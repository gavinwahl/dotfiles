#!/usr/bin/env bash
#--------------------------------------------------
#   Creates a symbolically linked "." version of a
#   file in the user's home directory
#--------------------------------------------------
link_file()
{
  if [[ -a ${HOME}/.${1} ]]; then
    echo "Removing old ~/.${1}..."
    rm ${HOME}/.${1}
  fi

  echo "Linking ~/.${1}..."
  ln -s ${PWD}/${1} ${HOME}/.${1}
}

link_file bashrc
link_file vimrc
link_file vim
link_file xmonad
link_file gitconfig
