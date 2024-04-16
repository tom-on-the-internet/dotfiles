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

alias ll='eza -al --group-directories-first --icons --color-scale'
alias ls='eza --group-directories-first --icons --color-scale'
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
