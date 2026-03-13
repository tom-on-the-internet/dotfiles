fish_add_path -g /opt/homebrew/bin/
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.composer/vendor/bin
fish_add_path -g ~/.npm-packages/bin
fish_add_path -g ~/.node_modules/bin
fish_add_path -g ~/go/bin
fish_add_path -g ~/.gem/ruby/3.3.0/bin
fish_add_path -g ~/.orbstack/bin
fish_add_path /opt/homebrew/opt/mysql-client@8.4/bin

alias cat='bat'
alias cp='cp -riv'
alias curl='curlie'
alias dc='docker compose'
alias e='nvim'
alias ec='nvim --clean'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='rm -v'
alias tf='terraform'
alias tree='eza --tree'
alias ll='eza -al --group-directories-first --icons'
alias ls='eza --group-directories-first --icons'
alias prs='gh pr list --state open --author "@me" --json title,url,headRepository --jq \'.[] | "\(.headRepository.name): \(.title) \(.url)"\''
alias zz='exit'

abbr -a -- art 'php artisan'
abbr -a -- gbl 'git blame -b -w'
abbr -a -- gd 'git diff'
abbr -a -- gdm 'git diff origin/(git_main_branch)'
abbr -a -- gdmn 'git diff origin/(git_main_branch) --name-status'
abbr -a -- gl 'git log'
abbr -a -- glog 'git log --oneline --decorate --graph'
abbr -a -- gp 'git push'
abbr -a -- gpf 'git push --force-with-lease'
abbr -a -- gpl 'git pull'
abbr -a -- grb 'git pull; git rebase -i origin/(git_main_branch)'
abbr -a -- gs 'git status -sb'
abbr -a -- gshow 'git show'
abbr -a -- gshowps 'git show --pretty=short --show-signature'
abbr -a -- gsw 'git switch'
abbr -a -- gswc 'git switch -c'
abbr -a -- gswm 'git switch (git_main_branch)'
abbr -a -- gwch 'git whatchanged -p --abbrev-commit --pretty=medium'
abbr -a -- gwip 'git add . && git commit -m wip'

function ct
    cd ~/code/nmbr/api-core
    set -x NOVA_USERNAME ""
    set -x NOVA_LICENSE_KEY ""
    docker compose exec payroll-api bash
end

function git_main_branch -d 'Detect name of main branch of current git repository'
    # heuristic to return the name of the main branch
    command git rev-parse --git-dir &>/dev/null || return
    for ref in refs/{heads,remotes/{origin,upstream}}/{main,master,trunk}
        if command git show-ref -q --verify $ref
            echo (string split -r -m1 -f2 / $ref)
            return
        end
    end
    echo main
end

function wip
    set now (date "+%Y-%m-%d-%H:%M")
    git add .
    git commit -m "wip $now"
end

function _generate_commit_message --description "Generate a commit message from staged diff via Claude"
    # Expects changes to already be staged. Outputs the message to stdout.
    # Returns 1 on failure/abort.

    read -P "Additional context? (why this change, or enter to skip) " -g _commit_context

    echo "Generating commit message..." >&2
    set -l diff_input "=== Summary ===
"(git diff --cached --stat)"
=== Diff (truncated if large) ===
"(git diff --cached | head -c 50000)

    set -l context_block ""
    if test -n (string trim -- "$_commit_context")
        set context_block "
=== Context from author ===
$_commit_context"
    end

    set -l msg (echo "$diff_input$context_block" | claude -p "Write a short commit message (under 72 chars) for this diff. Focus on WHY the change was made, not what files changed. If the author provided context, lean on it heavily. Be specific but concise—no filler words. Output ONLY the message, no quotes, no explanation." 2>/tmp/_commit_claude_err)
    or begin
        echo "Failed to generate commit message:" >&2
        cat /tmp/_commit_claude_err >&2
        return 1
    end

    if test -z "$msg"
        echo "Got empty commit message from Claude." >&2
        return 1
    end

    echo "Commit message: $msg" >&2
    read -P "Proceed? [Y/n/e(dit)] " confirm
    switch (string lower "$confirm")
        case n no
            echo "Aborted." >&2
            return 1
        case e edit
            read -P "New message: " msg
            if test -z "$msg"
                echo "Empty message. Aborted." >&2
                return 1
            end
    end

    echo "$msg"
end

function commit --description "Stage and commit with optional AI-generated message"
    set -l commitMessage (string join " " $argv)

    git add .
    or return 1

    if git diff --cached --quiet
        echo "Nothing to commit."
        return 0
    end

    if test -z "$commitMessage"
        set commitMessage (_generate_commit_message)
        or begin
            git reset HEAD --quiet
            return 1
        end
    end

    git commit -m "$commitMessage"
end

function kickoff --description "Create a branch, commit staged changes, and push"
    # Warn if not on main/master
    set -l current_branch (git rev-parse --abbrev-ref HEAD)
    if not contains $current_branch main master
        echo "Warning: you're branching off $current_branch, not main or master."
        read -P "Continue? [Y/n] " confirm
        switch (string lower "$confirm")
            case n no
                return 1
        end
    end

    # Stage and check for changes
    git add .
    or return 1
    if git diff --cached --quiet
        echo "Nothing to commit."
        return 0
    end

    # Ask for Linear ticket
    read -P "Linear ticket? (e.g. PROJ-123, or enter to skip) " ticket
    set ticket (string trim "$ticket")

    # Generate commit message from diff
    set -l commitMessage (_generate_commit_message)
    or begin
        git reset HEAD --quiet
        return 1
    end

    # Prefix commit message with ticket
    if test -n "$ticket"
        set commitMessage "$ticket $commitMessage"
    end

    # Derive short branch name (max 5 words from message)
    set -l short (string split " " -- "$commitMessage" | head -5 | string join " ")
    set -l kebab (string lower "$short" | string replace -ar '[^a-z0-9 -]' '' | string replace -ar ' +' '-' | string trim --chars='-')

    git checkout -b "$kebab"
    or return 1

    commit "$commitMessage"
    or return 1

    git push -u origin "$kebab"

    # Offer to create a draft PR
    read -P "Create draft PR? [y/N] " pr_confirm
    switch (string lower "$pr_confirm")
        case y yes
            echo "Generating PR description..."
            set -l diff_for_pr (git diff origin/(git_main_branch)...HEAD | head -c 50000)
            set -l pr_context ""
            if test -n (string trim -- "$_commit_context")
                set pr_context "
=== Context from author ===
$_commit_context"
            end
            set -l pr_body (echo "$diff_for_pr$pr_context" | claude -p "Write a 1-2 sentence PR description explaining WHY this change was made and what problem it solves. Do not describe what files changed or list individual changes. If the author provided context, lean on it heavily. Output ONLY the description, no markdown, no sections, no bullet points." 2>/dev/null)
            set -l pr_title "$commitMessage"

            if test -n "$pr_body"
                gh pr create --draft --title "$pr_title" --body "$pr_body"
            else
                gh pr create --draft --title "$pr_title" --body ""
            end
    end
end

set -g fish_greeting
set -gx EDITOR nvim
set -gx JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION true
#set -g fish_autosuggestion_enabled 0

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias assume="source (brew --prefix)/bin/assume.fish"
starship init fish | source

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :

# Added by `nodenv init` on Thu 27 Nov 2025 15:46:57 EST
status --is-interactive; and nodenv init - --no-rehash fish | source
