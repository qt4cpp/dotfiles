function conversion_container --description 'Convert media file to another container.'
	argparse -n conversion_container -x 'c,v' 'c/codec_copy' 'i/input_ext=' 'o/output_ext=' 'f/output_file=' 'v/video_codec=' 'a/audio_codec=' -- $argv
or return 1

	if count $argv = 0
		echo usage conversion_container -v vcodec -a acodec -i ext -o ext -f file 
		echo -c: codec copy
	end
	set vcodec
	set acodec

	if set -q _flag_c
		set codec (string join ' ' -- -codec copy)
	else
		if set -q _flag_v
			set vcodec (string join ' ' -- -vcodec $_flag_v)
		end	
		if set -q _flag_a
			set acodec (string join ' ' -- -acodec $_flag_a)
		end

		set codec (string join ' ' -- $vcodec $acodec)
	end

	set count 1
	
	for i in *.$_flag_i
		if set -q _flag_f
			set output (string join '' $_flag_f _ $count . $_flag_o)
			set count (math $count + 1)
		else
			set filename (basename $i .$_flag_i)
			set output (string join '' $filename . $_flag_o )
		end
		echo ffmpeg -i $i $codec $output
		ffmpeg -i $i -- (string split ' ' $codec) $output
	end
end
