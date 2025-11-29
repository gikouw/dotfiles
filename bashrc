#PROMPT_COMMAND='echo -ne "\e[999B\e[0G"'
#never fucking do this again... wasted my 2 days debugging asm

PS1="[\W] "

set -o ignoreeof
set -o vi
shopt -s cdspell
shopt -s autocd

export HISTCONTROL=ignoredups
export EDITOR=$(command -v nvim || command -v vim || command -v nano || echo vi)
export PATH="$HOME/.local/bin:$HOME/wnem/xlocal:$HOME/wnem/dotfiles/scripts:$PATH"
export QT_SCALE_FACTOR=1.5
export GDK_DPI_SCALE=1.25 


alias rm="trash-put"
alias xi="sudo xbps-install"
alias xr="sudo xbps-remove"
alias xq="xbps-query"
alias ss="sudo systemctl"
alias blc='bluetoothctl connect 84:0F:2A:C9:28:F2'
#alias ttc='xinput set-prop "MSFT0001:00 06CB:CE2D Touchpad" "libinput Tapping Enabled" 1'
alias sot="tmux source-file ~/.tmux.conf"
alias sop="source ~/venv/bin/activate"
alias mpvv='mpv --ytdl-raw-options=cookies-from-browser=brave -ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]"'


vpy() {
    source ~/venv/bin/activate
    python "$1"
    deactivate
}

lfm() {
  yt-dlp -f bestaudio "ytsearch:$1" -o "$1.webm"
  echo -n "play $1.webm ? y/n: "
  read uwu
  if [ "$uwu" = "y" ]; then
    mpv "$1.webm"
  fi
}


x() {
  local cmd file
  cmd="$*"
  [ -z "$cmd" ] && { echo "Usage: f <command>"; return 1; }

  file=$(fd -t f -d 4 .  . | fzf --height=40% ) 
  [ -z "$file" ] && return 1

  echo "$cmd \"$file\""
  eval "$cmd \"$file\""
}

alias e="x vim"

f() {
  local cmd dir
  cmd="$*"
  [ -z "$cmd" ] && { echo "Usage: f <command>"; return 1; }

  dir=$(fd -t d -d 4 . ~/ | fzf --height=40% )
  [ -z "$dir" ] && return 1

  echo "$cmd \"$dir\""
  eval "$cmd \"$dir\""
}

alias c="f cd"

#pi() {
#    paru -S $(paru -Slq | fzf --multi --preview 'paru -Si {}')
#}
#pr() {
#    paru -Rns $(paru -Qqe | fzf --multi --preview 'paru -Qi {}')
#}

cat $HOME/noticeboard.txt
