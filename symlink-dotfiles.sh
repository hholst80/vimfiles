#!/bin/sh
VIMHOME=${HOME}/.vim
for FILE in gitconfig vimrc tmux.conf redshift.conf Xresources bash_aliases toprc
do
	TARGET=${HOME}/.${FILE}
	if ! test -s ${TARGET}; then
		ln -s -v ${VIMHOME}/${FILE} ${HOME}/.${FILE}
	fi
done
