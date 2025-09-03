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

install_wallpapers() {
	if [ ! -d ~/.wallpapers ]; then
		echo "Creating wallpapers directory"
		mkdir ~/.wallpapers
	fi

	if [ ! -d ~/.wallpapers/Wallpapers ]; then
		echo "Downloading wallpapers"
		git clone git@github.com:CapmartinLeo/wallpapers.git ~/.wallpapers/Wallpapers
	fi
}

install_nvim_config() {
	if [ ! -d ./nvim ]; then
		echo "Creating nvim config directory"
		mkdir ./nvim
		echo "Downloading nvim config"
		git clone git@github.com:CapmartinLeo/nvim_config.git ./nvim
	fi
}

install_hyprland_plugins() {
	
}

install_nvim_config

install_wallpapers

link_dotfiles
