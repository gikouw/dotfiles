if [ -r /etc/os-release ]; then
    . /etc/os-release
    export DISTRO=$ID
fi

export EDITOR=$(command -v nvim || command -v vim || command -v nano || echo vi)
export PATH="$HOME/.local/bin:$HOME/wnem/xlocal:$HOME/wnem/dotfiles/scripts:$PATH"

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
export INPUT_METHOD=fcitx

export GDK_SCALE=2
export QT_SCALE_FACTOR=1.5

export XCURSOR_SIZE=48
export XCURSOR_THEME=Win7OS-Cursors

if [ "$DISTRO" = "void" ]; then
    export XDG_RUNTIME_DIR="/tmp/runtime_$(id -u)"
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
fi
