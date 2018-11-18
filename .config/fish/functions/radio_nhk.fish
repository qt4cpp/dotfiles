function radio_nhk -d "Download HLS file and convert mp4 file."
    # If current directory isn't ~/Download/nhk, transport there.
    if test (pwd) != '/Users/tatsu/Downloads/nhk'
        cd ~/Downloads/nhk/
    end

    set arr (ls *.m3u8)

    set p 'ラジオ英会話  ストリーミング  マイ語学  NHKゴガク.m3u8'
    if test -e $p
        command ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -allowed_extensions ALL -i $p -movflags faststart -c copy -bsf:a aac_adtstoasc ラジオ英会話1.mp4
    else
        echo 'can not find playlist file'
    end
end
