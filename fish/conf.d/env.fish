if command -sq nvim
    set -x EDITOR (command -v nvim)
else if command -sq vim
    set -x EDITOR (command -v vim)
else if command -sq nano
    set -x EDITOR (command -v nano)
else
    set -x EDITOR vi
end

if test -r /etc/os-release

    set -x DISTRO (grep '^ID=' /etc/os-release | cut -d= -f2 | tr -d '"')

    if test $DISTRO = void
	set -x XDG_RUNTIME_DIR "/tmp/runtime_"(id -u)

	if not test -d $XDG_RUNTIME_DIR
	    mkdir -p $XDG_RUNTIME_DIR
	    chmod 700 $XDG_RUNTIME_DIR
	end
    end

else
    echo "Error: /etc/os-release not found or not readable" >&2
end

