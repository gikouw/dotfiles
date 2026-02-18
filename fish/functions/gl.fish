function gl --wraps='git log --oneline --graph --decorate --all' --description 'alias gl git log --oneline --graph --decorate --all'
    git log --oneline --graph --decorate --all $argv
end
