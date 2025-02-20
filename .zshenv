PATH="$HOME/.local/bin:$PATH"
PATH="$PATH:/root/.local/bin"
PATH="$PATH:/usr/local/go/bin"
PATH="$PATH:$HOME/.cargo/env"
PATH="$PATH:$HOME/go/bin"

source ~/git-subrepo/.rc

XDG_CONFIG_HOME=$HOME/.config

export OPENAI_API_KEY=$(cat ~/.credentials/openai)
export RUNPOD_API_KEY=$(cat ~/.credentials/runpod)

