#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

source install/link.sh

source install/git.sh

# only perform macOS-specific install
#if [ "$(uname)" == "Darwin" ]; then
#    echo -e "\\n\\nRunning on macOS"
#    source install/brew.sh
#    source install/osx.sh
#fi

echo "creating vim directories"
mkdir -p ~/tmp
mkdir -p ~/.vim/autoload
mkdir -p ~/.vim/plugged

curl -s "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.vim/autoload/plug.vim

echo "Done. Reload your terminal."
