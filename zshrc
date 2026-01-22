PROMPT='
%~ '

setopt ignore_eof
setopt auto_cd
setopt correct

bindkey -v '^?' backward-delete-char

alias ls="ls -lrth"
alias rm="trash-put"
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq="xbps-query"
alias ss="sudo systemctl"
alias sot="tmux source-file ~/.tmux.conf"
alias mpvv='mpv --ytdl-raw-options=cookies-from-browser=firefox -ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]"'


x() {
  local cmd file
  cmd="$*"
  [ -z "$cmd" ] && { echo "Usage: f <command>"; return 1; }

  file=$(find . -maxdepth 4 -type f ! -path '*/.*' | fzf --height=40% )
  [ -z "$file" ] && return 1

  echo "$cmd \"$file\""
  eval "$cmd \"$file\""
}

alias e="x $EDITOR"

f() {
  local cmd dir
  cmd="$*"
  [ -z "$cmd" ] && { echo "Usage: f <command>"; return 1; }

  dir=$(find ~/ -maxdepth 4 -type d ! -path '*/.*' | fzf --height=40% )
  [ -z "$dir" ] && return 1

  echo "$cmd \"$dir\""
  eval "$cmd \"$dir\""
}

alias c="f cd"


HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt append_history
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
