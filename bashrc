#PROMPT_COMMAND='echo -ne "\e[999B\e[0G"'
#never fucking do this again... wasted my 2 days debugging asm

PS1="
\w "

set -o ignoreeof
set -o vi
shopt -s cdspell
shopt -s autocd

export HISTCONTROL=ignoredups

alias ls="ls -lrth"
alias rm="trash-put"
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq="xbps-query"
alias ss="sudo systemctl"
#alias ttc='xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1'
alias sot="tmux source-file ~/.tmux.conf"
alias sop="source ~/venv/bin/activate"
alias mpvv='mpv --ytdl-raw-options=cookies-from-browser=brave -ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]"'

bind '"\C-l": clear-screen'

x() {
  local cmd file
  cmd="$*"
  [ -z "$cmd" ] && { echo "Usage: f <command>"; return 1; }

  file=$(find . -maxdepth 4 -type f ! -path '*/.*' | fzf --height=40% )
  [ -z "$file" ] && return 1

  echo "$cmd \"$file\""
  eval "$cmd \"$file\""
}

if [ "$EDITOR" = "" ]; then
    alias e="x vi"
else
    alias e="x $EDITOR"
fi

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
