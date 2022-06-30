export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="obraun"
plugins=(git fzf-tab node docker kubectl docker-compose zoxide rust golang extract per-directory-history command-not-found colored-man-pages thefuck zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

alias ohmyzsh="mate ~/.oh-my-zsh"
alias ra="ranger"
alias s="neofetch | lolcat"
alias o="onefetch | lolcat"
alias lg="lazygit"
alias ld="lazydocker"
alias v="nvim"
alias t="tldr"
alias vd="neovide"
alias vi="nvim"
alias tx="tmux"
alias ls="exa --git"
alias top="htop"
alias df="duf"
alias du="ncdu"
alias ps="procs"
alias curl="http"

# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

eval "$(starship init zsh)"
eval "$(mcfly init zsh)"
