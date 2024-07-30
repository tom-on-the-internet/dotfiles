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
alias ec='nvim --clean'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='rm -v'
alias tf='terraform'
alias tree='eza --tree --color never'
alias ll='eza -al --group-directories-first --icons --color never'
alias ls='eza --group-directories-first --icons --color never'

function e -d "Open Neovim"
    if $IS_DARK_MODE ="true"
        nvim --cmd "set background=dark" $argv
    else
        nvim --cmd "set background=light" $argv
    end
end

function ct
    cd ~/code/nmbr/api-core
    set -x NOVA_USERNAME ""
    set -x NOVA_LICENSE_KEY ""
    docker compose exec payroll-api bash
end

set -g fish_greeting
set -gx EDITOR nvim
set -gx TERM wezterm

starship init fish | source

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias assume="source (brew --prefix)/bin/assume.fish"
