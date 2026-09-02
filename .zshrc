# ~/.zshrc — lightweight zsh setup (replaces fish config.fish)
# No framework. Plugins installed via Homebrew (see Brewfile).

# ---------- Options ----------
setopt auto_cd
setopt no_beep
setopt hist_ignore_dups
setopt share_history
setopt interactive_comments

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# ---------- PATH ----------
typeset -U path
path=(
  /opt/homebrew/bin
  ~/.local/bin
  ~/.cargo/bin
  ~/.composer/vendor/bin
  ~/.node_modules/bin
  ~/go/bin
  ~/.orbstack/bin
  /opt/homebrew/opt/mysql-client@8.4/bin
  $path
)

# ---------- Completion ----------
if [[ -d /opt/homebrew/share/zsh-completions ]]; then
  fpath=(/opt/homebrew/share/zsh-completions $fpath)
fi
zmodload zsh/complist
autoload -Uz compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ---------- fzf ----------
if command -v fzf >/dev/null 2>&1; then
  source /opt/homebrew/opt/fzf/shell/key-bindings.zsh 2>/dev/null
  source /opt/homebrew/opt/fzf/shell/completion.zsh 2>/dev/null
fi

# ---------- zoxide (fuzzy dir jump; replaces fish `z`) ----------
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# ---------- Autosuggestions ----------
if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ---------- Syntax highlighting (source last) ----------
if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# ---------- Aliases ----------
alias cat='bat'
alias cp='cp -riv'
alias curl='curlie'
alias dc='docker compose'
alias e='nvim'
alias ec='nvim --clean'
alias mkdir='mkdir -vp'
alias mv='mv -iv'
alias rm='rm -v'
alias tree='eza --tree'
alias ll='eza -al --group-directories-first --icons'
alias ls='eza --group-directories-first --icons'

# ---------- Git / Laravel shorthands ----------
alias art='php artisan'
alias gd='git diff'
alias gdm='git diff origin/$(git_main_branch)'
alias gl='git log'
alias glog='git log --oneline --decorate --graph'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias grb='git pull; git rebase -i origin/$(git_main_branch)'
alias gs='git status -sb'
alias gsw='git switch'
alias gswm='git switch $(git_main_branch)'

# ---------- Functions ----------
git_main_branch() {
  command git rev-parse --git-dir >/dev/null 2>&1 || return
  local ref
  for ref in refs/heads/{main,master,trunk} refs/remotes/{origin,upstream}/{main,master,trunk}; do
    if command git show-ref -q --verify "$ref" 2>/dev/null; then
      echo "${ref##*/}"
      return
    fi
  done
  echo main
}

ct() {
  cd ~/code/nmbr/api-core
  export NOVA_USERNAME=""
  export NOVA_LICENSE_KEY=""
  docker compose exec payroll-api bash
}

# ---------- Tool inits ----------
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi
source ~/.orbstack/shell/init.zsh 2>/dev/null || true
if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init - --no-rehash)"
fi

# ---------- Edit command line in $EDITOR (fish Alt+E parity) ----------
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '\ee' edit-command-line   # Alt+E — open the current command line in $EDITOR

# ---------- Expected-dependency check ----------
# This config assumes the following are installed. A missing one is a bug,
# so report it with a copyable install command instead of failing silently.
typeset -a _exp _mf _mc
_exp=(
  "zsh-completions|zsh-completions|dir|/opt/homebrew/share/zsh-completions"
  "fzf|fzf|cmd|fzf"
  "zoxide|zoxide|cmd|zoxide"
  "zsh-autosuggestions|zsh-autosuggestions|file|/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  "zsh-syntax-highlighting|zsh-syntax-highlighting|file|/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  "starship|starship|cmd|starship"
  "nodenv|nodenv|cmd|nodenv"
  "orbstack|orbstack|cask|/Users/tom/.orbstack/shell/init.zsh"
  "bat|bat|cmd|bat"
  "eza|eza|cmd|eza"
  "curlie|curlie|cmd|curlie"
  "nvim|neovim|cmd|nvim"
  "docker|docker|cmd|docker"
  "gh|gh|cmd|gh"
  "php|php|cmd|php"
  "composer|composer|cmd|composer"
)
for _it in "${_exp[@]}"; do
  IFS="|" read -r _n _p _t _g <<< "$_it"
  _ok=0
  case "$_t" in
    cmd)  command -v "$_g" >/dev/null 2>&1 && _ok=1 ;;
    file) [[ -f "$_g" ]] && _ok=1 ;;
    dir)  [[ -d "$_g" ]] && _ok=1 ;;
    cask) [[ -e "$_g" ]] && _ok=1 ;;
  esac
  (( _ok )) || { [[ "$_t" == "cask" ]] && _mc+=("$_p") || _mf+=("$_p"); }
done
if (( ${#_mf[@]} + ${#_mc[@]} > 0 )); then
  _line="brew install ${_mf[*]}"
  (( ${#_mc[@]} )) && _line="$_line && brew install --cask ${_mc[*]}"
  echo "zshrc: missing expected tools: ${_mf[*]}${_mc[*]:+ ${_mc[*]}}"
  echo "zshrc: to install, run:  $_line"
fi
unset _exp _mf _mc _it _n _p _t _g _ok _line
