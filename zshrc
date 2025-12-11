PROMPT='
%~ '

setopt ignore_eof
setopt auto_cd
setopt correct

export EDITOR=$(command -v nvim || command -v vim || command -v nano || echo vi)
bindkey -v '^?' backward-delete-char

export PATH="$HOME/.local/bin:$HOME/wnem/xlocal:$HOME/wnem/dotfiles/scripts:$PATH"

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

  file=$(fd -t f -d 4 .  . | fzf --height=40% ) 
  [ -z "$file" ] && return 1

  echo "$cmd \"$file\""
  eval "$cmd \"$file\""
}

alias e="x $EDITOR"

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
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

cat $HOME/noticeboard.txt

