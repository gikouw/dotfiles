function fish_greeting
end

fish_vi_key_bindings

alias e="x $EDITOR"
alias c="f cd"

set -l LOCAL_INIT run_local_startup_jobs

if status is-login
    if command -v $LOCAL_INIT >/dev/null
	$LOCAL_INIT &
    end
end
