function x
    if test (count $argv) -eq 0
	echo "Usage: x <command>"
	return 1
    end

    set file (find . -maxdepth 4 -type f ! -path '*/.*' | fzf --height=40%)

    if test -z "$file"
	return 1
    end

    echo "$argv \"$file\""
    eval $argv \"$file\"
end
