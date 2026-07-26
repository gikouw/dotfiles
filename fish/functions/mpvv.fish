function mpvv --wraps='mpv --ytdl-raw-options=cookies-from-browser=firefox -ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]"' --description 'alias mpvv=mpv --ytdl-raw-options=cookies-from-browser=firefox -ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]"'
    mpv --ytdl-raw-options=cookies-from-browser=firefox -ytdl-format="bestvideo[height<=1080]+bestaudio/best[height<=1080]" $argv
end
