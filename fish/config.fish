function fish_greeting
end

fish_vi_key_bindings

alias e="x $EDITOR"
alias c="f cd"

if status is-login
    if command -v run_local_jobs >/dev/null
	run_local_jobs &
    end
end
