# pyenv
status --is-interactive; and . (pyenv init -| psub)


# virtualenv & virtualenvwrapper
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Documents/programming/python
#source $HOME/.pyenv/versions/3.6.0/bin/virtualenvwrapper.sh


# git branch
function git_branch
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ [\1]/'
end


# prompt
function fish_prompt --description 'Write out the prompt'
  set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n $PWD | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
  set -l prompt_symbol ''
  set -l branch_name (git_branch)

  switch $USER
    case root toor;
      set prompt_symbol '#'
    case '*';
      set prompt_symbol '$'
  end

  #printf "[%s@%s %s%s%s]%s " $USER (hostname -s) (set_color $fish_color_cwd) $pwd (set_color normal) $prompt_symbol
  printf "%s%s " (set_color $fish_color_cwd) $branch_name (set_color normal) $prompt_symbol
  #printf "%s " (set_color normal) $prompt_symbol
end


# right_prompt
function fish_right_prompt -d "Right Prompt"
  set -l home_escaped (echo -n $HOME | sed 's/\//\\\\\//g')
  set -l pwd (echo -n (prompt_pwd) | sed "s/^$home_escaped/~/" | sed 's/ /%20/g')
  set -l now (date "+[%H:%M]")

  set_color aa2
  #printf " <%s>" (set_color $fish_color_cwd) $pwd (set_color normal)
  printf " [%s] %s"   $pwd $now
  set_color normal
end


# After cd, do ls
function cd
  if test (count $argv) -eq 0
    return 0
  else if test (count $argv) -gt 1
    printf "%s\n" (_ "Too many args for cd command")
      return 1
    end

    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = "-"
      if test "$__fish_cd_direction" = "next"
        nextd
      else
        prevd
      end
      return $status
    end

    builtin cd $argv
    set -l cd_status $status

    # Log history
    if test $cd_status -eq 0 -a "$PWD" != "$previous"
      set -q dirprev[$MAX_DIR_HIST]
      and set -e dirprev[1]
      set -g dirprev $dirprev $previous
      set -e dirnext
      set -g __fish_cd_direction prev
    end

    if test $cd_status -ne -
      return 1
    end
    ls
    return $status
  end


