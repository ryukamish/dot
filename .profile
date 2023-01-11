# Why does bash cannot have his bashrc sourced by default brain-dead program!?

if [ -n "$BASH_VERSION" ]; then
    # including bashrc if it exists
    [ -f $HOME/.bashrc ] && . $HOME/.bashrc
fi

#if [ -z "$DISPLAY" ]; then
#  pidof -s Xorg >/dev/null 2>&1 || exec startx "$XINITRC"
#fi

# Start ssh agent in the background
eval "$(ssh-agent -s)" >> /dev/null
