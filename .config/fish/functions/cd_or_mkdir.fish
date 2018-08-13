function cd_or_mkdir -d "cd after make the directory if destination doesn't exist."

  if not test -d $argv
    mkdir $argv
  end
  cd $argv
end
