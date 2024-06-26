#!/bin/bash

link_dotfiles() {
	#list all dirs in current dir
	for dir in $(ls -d */); do
		dir=${dir%*/}
		echo "Linking $dir"
		src_dir=$(pwd)/$dir
		out_dir=~/.config/$dir

		#check if the dir exists
		if [ -L $out_dir ]; then
			echo "Removing existing symlink $out_dir"
			unlink $out_dir
		elif [ -d $out_dir ]; then
			echo "Directory $out_dir already exists, copying files to $out_dir.bak"
			mv $out_dir $out_dir.bak
		fi

		ln -s $(pwd)/$dir ~/.config/$dir
	done
}

link_dotfiles
