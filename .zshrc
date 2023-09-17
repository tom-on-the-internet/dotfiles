#!/usr/bin/zsh

HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000

zstyle :compinstall filename '/home/tom/.zshrc'


   # Basic auto/tab complete:
        autoload -U compinit
        zstyle ':completion:*' menu select
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zmodload zsh/complist
        compinit
        _comp_options+=(globdots)		# Include hidden files.


EDTIOR=nvim

source <(/usr/bin/starship init zsh --print-full-init)
source ~/zsh/zoxide.zsh
source ~/zsh/git-helpers.sh
source /usr/share/nvm/init-nvm.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export PATH=$PATH:/home/tom/.local/bin:/home/tom/.npm-packages/bin/

        stty stop undef		# Disable ctrl-s to freeze terminal.


        setopt appendhistory
        setopt COMPLETE_ALIASES
        setopt SHARE_HISTORY
        setopt HIST_IGNORE_DUPS

        # Basic auto/tab complete:
        autoload -U compinit
        zstyle ':completion:*' menu select
        zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
        zmodload zsh/complist
        compinit
        _comp_options+=(globdots)		# Include hidden files.

        # edit in editor
        autoload -z edit-command-line
        zle -N edit-command-line
        bindkey "^X^E" edit-command-line
        bindkey "^E" edit-command-line
        bindkey '^ ' autosuggest-execute

        fancy-ctrl-z () {
          if [[ $#BUFFER -eq 0 ]]; then
            BUFFER="fg"
            zle accept-line -w
          else
            zle push-input -w
            zle clear-screen -w
          fi
        }
        zle -N fancy-ctrl-z
        bindkey '^Z' fancy-ctrl-z

alias aws-ass="source source-assume"
alias cat="bat"
alias cp="cp -riv"
alias curl="curlie"
alias dc="docker compose"
alias e="nvim"
alias ec="nvim --clean"
alias ll="ls -al"
alias ls="exa --group-directories-first --icons --color-scale"
alias mkdir="mkdir -vp"
alias mv="mv -iv"
alias rm="rm -v"
alias tf="terraform"
alias tree="exa --tree"
alias -g "..."="../.."
alias -g "...."="../../.."
alias -g "....."="../../../.."



        stty stop undef		# Disable ctrl-s to freeze terminal.
           bindkey -e # emacs mode

        setopt appendhistory
        setopt COMPLETE_ALIASES
        setopt SHARE_HISTORY
        setopt HIST_IGNORE_DUPS

bindkey -e
