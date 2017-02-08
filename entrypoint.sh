#!/bin/sh
# sets up the users home directory if they haven't already

if [ ! -d "$HOME/.abuild" ] || [ ! -f "$HOME/.abuild/abuild.conf" ]; then
    echo "Generating abuild keys and config"
    abuild-keygen -a -i
fi
