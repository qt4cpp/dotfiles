function radio_nhk -d "Download HLS file and convert mp4 file."

  # Set defaults
  set down_dir = 'Users/tatsu/Dowloads/'
  set playlist_ext = '.m3u8'

  #

  # If current directory isn't ~/Download/nhk, transport there.
  if test (pwd) != '/Users/tatsu/Downloads/nhk'
    cd_or_mkdir ~/Downloads/nhk/
  end

  set p '../ラジオ英会話  ストリーミング  マイ語学  NHKゴガク.m3u8'
  if test -e $p
    command ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -allowed_extensions ALL -i $p -movflags faststart -c copy -bsf:a aac_adtstoasc -y -vn ラジオ英会話1.mp4
    rm $p

    set i 2
    for file in ../*\).m3u8
      command ffmpeg -protocol_whitelist file,http,https,tcp,tls,crypto -allowed_extensions ALL -i $file -movflags faststart -c copy -bsf:a aac_adtstoasc -y -vn ラジオ英会話$i.mp4
      set i (math $i+1)
      rm $file
    end
  else
    echo 'can not find playlist file'
  end
end
