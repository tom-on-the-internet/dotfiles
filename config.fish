# Nightfox Color Palette
# Style: carbonfox
# Upstream: https://github.com/edeneast/nightfox.nvim/raw/main/extra/carbonfox/carbonfox.fish
set -l foreground f2f4f8
set -l selection 2a2a2a
set -l comment 6e6f70
set -l red ee5396
set -l orange 3ddbd9
set -l yellow 08bdba
set -l green 25be6a
set -l purple be95ff
set -l cyan 33b1ff
set -l pink ff7eb6

# Syntax Highlighting Colors
set -g fish_color_normal $foreground
set -g fish_color_command $cyan
set -g fish_color_keyword $pink
set -g fish_color_quote $yellow
set -g fish_color_redirection $foreground
set -g fish_color_end $orange
set -g fish_color_error $red
set -g fish_color_param $purple
set -g fish_color_comment $comment
set -g fish_color_selection --background=$selection
set -g fish_color_search_match --background=$selection
set -g fish_color_operator $green
set -g fish_color_escape $pink
set -g fish_color_autosuggestion $comment

# Completion Pager Colors
set -g fish_pager_color_progress $comment
set -g fish_pager_color_prefix $cyan
set -g fish_pager_color_completion $foreground
set -g fish_pager_color_description $comment

fish_add_path -g /opt/homebrew/bin/
fish_add_path -g ~/.local/bin
fish_add_path -g ~/.npm-packages/bin
fish_add_path -g ~/go/bin

alias cat='bat'
alias cp='cp -riv'
alias curl='curlie'
alias dc='docker compose'
alias ec='nvim --clean'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='rm -v'
alias tf='terraform'
alias tree='eza --tree'

alias ll='eza -al --group-directories-first --icons'
alias ls='eza --group-directories-first --icons'
alias e='nvim'

set -g fish_greeting
set -gx EDITOR nvim
set -gx TERM wezterm

starship init fish | source

# slow_print prints input... slowly
# mostly to be annoying
function slow_print
    for x in (string split '' $argv)
        printf $x
        sleep 0.01
    end
end

# be rude to user, who is me.
function fish_command_not_found
    printf '\n'
    sleep 0.1
    slow_print umm
    slow_print '...'
    sleep 0.1
    printf ' '
    printf $argv[1] | lolcat -a -s 20
    printf ' '
    slow_print 'is not a command? '
    sleep 0.1
    printf '🤣'
    sleep 0.1
    printf '\n'
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
