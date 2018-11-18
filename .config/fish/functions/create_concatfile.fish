function create_concatfile --description 'create list file to cancatenate with FFmpeg. You can specify input extension in arguments.'
	if test (count $argv) -ne 2
echo '[using] create_concatfile input_ext ouput_filename\n'
end
set input_ext $argv[1]
set output_file $argv[2]
for i in *.$input_ext
echo "file" \'$i\' | cat >> $output_file
end
end
