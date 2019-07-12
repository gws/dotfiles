### Shell variables

HISTCONTROL=ignoreboth
HISTFILE=""

if [ $(id -u) -eq 0 ]; then
    PS1="[1;31m\u[m@[1;32m\h[m:\w\n\\$ "
else
    PS1="\u@[1;32m\h[m:\w\n\\$ "
fi

### Exported variables

export EDITOR="vim"
export GPG_TTY=$(tty)
export LESS="-q -R"
export LESSHISTFILE="-"
export PAGER="less"
export PATH="${HOME}/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
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
