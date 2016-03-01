#!/bin/sh

# Backup old .vimrc
if [ -f "$HOME/.vimrc" ]; then
  echo "Backup old .vimrc to .vimrc.old"
    mv $HOME/.vimrc $HOME/.vimrc.old
fi

if [ -d "$HOME/.vim" ]; then
  echo "Backing up old .vim to .vim.old/"
  mv $HOME/.vim $HOME/.vim.old
fi

# Install
dir="$(dirname $(readlink -f "$0"))"
echo "Creating .vim and .vimrc..."
cp "${dir}/.vimrc"  $HOME/.vimrc
cp -R "${dir}/.vim" $HOME/.vim
# Ready
echo
echo "Installed!"
echo "You need to reload your shell config by running:"
echo "  source $HOME/.${SHELL##*/}rc"
echo "Or by opening a new terminal prompt."
