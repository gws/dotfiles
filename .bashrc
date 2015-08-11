umask 022

set -o vi

if [ $(id -u) -eq 0 ]; then
    export PS1="[1;31m\u[m@[1;32m\h[m:\w\n\\$ "
else
    export PS1="\u@[1;32m\h[m:\w\n\\$ "
fi

export EDITOR="vim"
export HISTFILE=""
export GPG_TTY=$(tty)
export JAVA_HOME="`which java | sed 's!/bin/java!!'`"
export LESS="-q -R"
export LESSHISTFILE="-"
export PAGER="less"
export PATH="${HOME}/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
export SUDO_EDITOR="$EDITOR"
export VISUAL="$EDITOR"

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

alias ls="ls --color=auto"
alias ll="ls -la"
alias tmux="tmux -2u"

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

for script in $HOME/.bashrc.d/*
do
  [ -x "$script" ] || continue

  . $script
done

if [ -r "$HOME/.bashrc-local" ]; then
    . $HOME/.bashrc-local
fi
