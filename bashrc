#PROMPT_COMMAND='echo -ne "\e[999B\e[0G"'
#never fucking do this again... wasted my 2 days debugging asm

PS1="
\W "

set -o ignoreeof
set -o vi
shopt -s cdspell
shopt -s autocd

export HISTCONTROL=ignoredups

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

lfm() {
  yt-dlp -f bestaudio "ytsearch:$1" -o "$1.webm"
  echo -n "play $1.webm ? y/n: "
  read -r uwu
  if [[ "$uwu" == "y" ]]; then
    mpv "$1.webm"
  fi
}

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

enable_sv() {
    [ -z "$1" ] && { echo "Usage: esv <service-name>"; return 1; }
    [ ! -d "/etc/sv/$1" ] && { echo "Error: service directory '/etc/sv/$1' does not exist."; return 1; }
    [ -e "/var/service/$1" ] && { echo "Service '$1' is already enabled."; return 1; }
    sudo ln -s "/etc/sv/$1" /var/service/
    echo "Service '$1' has been enabled."
}

disable_sv() {
    set -x
    sudo rm "/var/service/$1"
}
