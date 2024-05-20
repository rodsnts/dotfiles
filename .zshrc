export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"

plugins=(
  git
  npm
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias nvcfg="nvim ~/.config/nvim"
alias tmcfg="nvim ~/.config/tmux/tmux.conf"

alias opnv='nvim "$(find ~/Documents/* -type d ! -path "*/Work/*/*" ! -path "*/Dev/*/*" | fzf)"'
alias opt='find $HOME/Documents/* -type d ! -path "*/Work/*/*" ! -path "*/Dev/*/*" | fzf | xargs -i sh -c "tmux new -s {} -c {} -d && tmux switch -t {}"'
alias opd='cd "$(find ~/Documents/* -type d ! -path "*/Work/*/*" ! -path "*/Dev/*/*" | fzf)"'
alias cd='z'

eval "$(zoxide init zsh)"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi
