#!/bin/sh
VIMHOME=${HOME}/.vim
for FILE in gitconfig vimrc tmux.conf
do
	ln -s -v ${VIMHOME}/${FILE} ${HOME}/.${FILE}
done
