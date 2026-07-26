function f

    if test (count $argv) -eq 0
       echo "Usage: f <command>"
       return 1
    end

    set dir (find ~/ -maxdepth 4 -type d ! -path '*/.*' | fzf --height=40%)

    if test -z "$dir"
       return 1
    end

    echo "$argv \"$dir\""
    eval $argv \"$dir\"
end
