export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"

plugins=(
  git
  npm
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

FZF_DEFAULT_OPTS="\
  --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias nvcfg="nvim ~/.config/nvim"
alias tmcfg="nvim ~/.config/tmux/tmux.conf"

fuzzy_repo_tmux() {
  local WORK_DIR="$HOME/Documents/Work"
  local DEV_DIR="$HOME/Documents/Dev"

  local work_repos=$(find "$WORK_DIR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)
  local dev_repos=$(find "$DEV_DIR" -maxdepth 1 -mindepth 1 -type d -exec basename {} \;)

  local all_repos=$(printf "%s\n%s\n" "$work_repos" "$dev_repos")

  local selected_repo=$(echo "$all_repos" | fzf)

  if [ -n "$selected_repo" ]; then
    local repo_path=""
    if [[ -d "$WORK_DIR/$selected_repo" ]]; then
      repo_path="$WORK_DIR/$selected_repo"
    elif [[ -d "$DEV_DIR/$selected_repo" ]]; then
      repo_path="$DEV_DIR/$selected_repo"
    else
      echo "Repository not found."
      return 1
    fi

    tmux new -d -s "$selected_repo" -c "$repo_path"
    tmux switch -t "$selected_repo"
  else
    echo ""
  fi
}

alias opt=fuzzy_repo_tmux
alias cd='z'
alias ls='ls --color=auto -lah'
eval "$(zoxide init zsh)"

source /usr/share/nvm/init-nvm.sh
