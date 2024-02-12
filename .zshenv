PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:/root/.local/bin"
PATH="$PATH:/usr/local/go/bin"
PATH="$PATH:$HOME:.cargo/env"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source ~/git-subrepo/.rc

XDG_CONFIG_HOME=$HOME/.config