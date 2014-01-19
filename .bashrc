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
export PATH="${HOME}/bin:${HOME}/.local/bin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin"
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

# Toggle PS1 transformations
# Param: $* Interior of bash parameter expansion: '/\\u/\\u is a luser'
__ps1toggle__() {
    # Seed PS1 stack variable if unset
    declare -p __ps1stack__ &>/dev/null || __ps1stack__=("$PS1")

    # Check for existing transformation
    local idx count=${#__ps1stack__[@]} exists
    for ((idx = 1; idx < count; ++idx)); do
        if [[ "$*" == "${__ps1stack__[idx]}" ]]; then
            exists=1
            break
        fi
    done

    # Remove existing pattern, or push new one
    if ((exists)); then
        __ps1stack__=("${__ps1stack__[@]:0:idx}" "${__ps1stack__[@]:idx+1}")
    else
        __ps1stack__+=("$*")
    fi

    # Replay transformations
    local expr
    PS1="${__ps1stack__[0]}"
    for expr in "${__ps1stack__[@]:1}"; do
        eval "PS1=\"\${PS1$expr}\""
    done
}

type git &> /dev/null && {
    source $HOME/.bashrc.d/git-prompt.sh
    gitps1() {
        __ps1toggle__ '//\\w/\\w\$(__git_ps1 " → \[\033[3m\]%s\[\033[23m\]")'
    }
    gitps1
}

if [ -r "$HOME/.bashrc-local" ]; then
    . $HOME/.bashrc-local
fi
