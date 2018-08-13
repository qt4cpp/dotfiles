function record_rajiru
	set d (date +"%y%m%d")
set fn (string join '' $d rajiru.m4a)
ffmpeg -i 'https://nhkradioakr1-i.akamaihd.net/hls/live/511633/1-r1/1-r1-01.m3u8' -t 5400 -movflags faststart -c copy -y $fn
end
