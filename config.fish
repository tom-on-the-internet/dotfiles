fish_add_path -g /opt/homebrew/bin/
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.npm-packages/bin
fish_add_path -g ~/.node_modules/bin
fish_add_path -g ~/go/bin
fish_add_path -g ~/.gem/ruby/3.3.0/bin

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

function nct
    nmbuddy
    ct
end

function git
    if test "$argv[1]" = checkout
        echo "Tom! Don't use checkout!" >&2
        return 1
    else
        command git $argv
    end
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

set -g fish_greeting
set -gx EDITOR nvim
set -gx TERM wezterm
set -gx JSII_SILENCE_WARNING_UNTESTED_NODE_VERSION true
#set -g fish_autosuggestion_enabled 0


if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias assume="source (brew --prefix)/bin/assume.fish"
