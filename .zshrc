export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gentoo"

plugins=(
  asdf
  git
  npm
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

export FZF_DEFAULT_OPTS="\
  --color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8 \
  --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  --color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

alias nvcfg="nvim ~/.config/nvim"
alias tmcfg="nvim ~/.config/tmux/tmux.conf"

fuzzy_repo_tmux() {
  local WORK_DIR="$HOME/Documents/Work"
  local DEV_DIR="$HOME/Documents/Dev"

  local all_repos
  all_repos=$(
    find -L "$WORK_DIR" -maxdepth 1 -mindepth 1 -type d -exec printf "[WORK] %s\t%s\n" "$(basename "{}")" "{}" \; ;
    find -L "$DEV_DIR" -maxdepth 1 -mindepth 1 -type d -exec printf "[DEV]  %s\t%s\n" "$(basename "{}")" "{}" \;
  )

  # Let user pick, but show just basename in list, pass full path to preview

  local selected
  selected=$(echo "$all_repos" | \
    fzf --with-nth=1 \
        --delimiter='\t' \
        --ansi \
        --inline-info \
        --preview='eza -lah -B --icons --git --group-directories-first --color=always {2}' \
        --prompt="Select a repo: " \
        --layout=reverse)

  if [ -n "$selected" ]; then
    local label_and_name repo_path repo_name
    label_and_name=$(echo "$selected" | cut -f1)
    repo_path=$(echo "$selected" | cut -f2)
    repo_name=$(basename "$repo_path")

    # Reuse tmux session if it exists
    if tmux has-session -t "$repo_name" 2>/dev/null; then
      tmux switch -t "$repo_name"
    else
      tmux new -d -s "$repo_name" -c "$repo_path"
      tmux switch -t "$repo_name"
    fi
  else
    echo "No repo selected."
    return 1
  fi
}

alias opt=fuzzy_repo_tmux
alias cd='z'
alias ls='ls --color=auto -lah'
alias cat='bat'
alias ls='eza -lah -B --icons --group-directories-first --git --color=always'
eval "$(zoxide init zsh)"

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# opencode
export PATH=/Users/macbook-pro/.opencode/bin:$PATH

# pnpm
export PNPM_HOME="/Users/macbook-pro/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# bun completions
[ -s "/Users/macbook-pro/.bun/_bun" ] && source "/Users/macbook-pro/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
