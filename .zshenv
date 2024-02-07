if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
    PATH="$PATH:/usr/local/go/bin"
    PATH="$PATH:/root/.local/bin"
fi
