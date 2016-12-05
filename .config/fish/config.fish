# pyenv
status --is-interactive; and . (pyenv init -| psub)

# prompt
function fish_prompt --description 'Write out the prompt'
  set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
  set -l prompt_symbol ''

  switch $USER
    case root toor;
      set prompt_symbol '#'
    case '*';
      set prompt_symbol '$'
  end
  
  #printf "[%s@%s %s%s%s]%s " $USER (hostname -s) (set_color $fish_color_cwd) $pwd (set_color normal) $prompt_symbol
  #printf "[%s%s%s]%s " (set_color $fish_color_cwd) $pwd (set_color normal) $prompt_symbol
  printf "%s " (set_color normal) $prompt_symbol
end

# right_prompt
function fish_right_prompt -d "Right Prompt"
  set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')

  set_color aa2
  #printf " <%s>" (set_color $fish_color_cwd) $pwd (set_color normal)
  printf " [%s]"   $pwd
  set_color normal
end
