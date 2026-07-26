function sot --wraps='tmux source-file ~/.tmux.conf' --description 'alias sot=tmux source-file ~/.tmux.conf'
    tmux source-file ~/.tmux.conf $argv
end
