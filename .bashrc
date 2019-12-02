### Shell variables

HISTCONTROL=ignoreboth
HISTFILE=""

YELLOW="\[\033[1;33m\]"
GREEN="\[\033[1;32m\]"
CYAN="\[\033[1;36m\]"
RED="\[\033[1;31m\]"
RESTORE="\[\033[0m\]"

function prompt_command {
  local USER_PS1="\u"

  if [ $(id -u) -eq 0 ]; then
    USER_PS1="${RED}\u${RESTORE}"
  fi

  PS1="${USER_PS1}@${GREEN}\h${RESTORE}:\w$\n\\$ "
}

PROMPT_COMMAND=prompt_command

### Exported variables

export PATH="${HOME}/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"

export GPG_TTY=$(tty)

export PAGER="less"
export LESS="-q -R"
export LESSHISTFILE="-"

export EDITOR="vim"
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

function ls {
  /bin/ls -N --color=auto "$@"
}

function ll {
  ls -la "$@"
}

function tmux {
  /usr/bin/tmux -2u "$@"
}

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if [ -d "${HOME}/.bashrc.d" ]; then
  for i in "${HOME}/.bashrc.d/"*; do
    if [ -r "$i" ]; then
      . "$i"
    fi
  done
  unset i
fi

if [ -r "${HOME}/.bashrc-local" ]; then
    . "${HOME}/.bashrc-local"
fi
