#!/bin/bash

PACKAGES=(
	# System Utilities
	tree
	fzf
	unzip
	unrar
	brightnessctl
	playerctl
	btop
	bat
	bat-extras
	fastfetch
	imagemagick
	qt5-graphicaleffects
	qt5‑quickcontrols2
	qt5‑svg

	# Development Tools
	git
	nodejs
	npm
	stylua
	prettier
	eslint
	pyenv

	# Fonts
	ttf-jetbrains-mono-nerd
	adobe-source-han-sans-jp-fonts
	adobe-source-han-serif-jp-fonts
	noto-fonts-emoji

	# Wayland/Desktop Environment
	xdg-desktop-portal-gtk
	ags-hyprpanel-git
	waypaper
	rofi-wayland
	rofi-calc
	swww
	libnotify
	hypridle
	hyprlock
	hyprshot
	matugen-bin
	cliphist

	# hyprland plugins
	cpio
	cmake
	meson
	gcc

	# Bluetooth
	bluez
	blueman

	# misc apps
	eog
	vlc
	pinta
	gnome-calculator
	baobab
	nautilus
)

PACKAGES_TO_INSTALL=""

install_yay() {
	echo Installing yay...
	sudo pacman -S --needed git base-devel
	git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin
	cd /tmp/yay-bin
	makepkg -si
}

install_packages() {
	if ! pacman -Q yay-bin &> /dev/null; then
		install_yay
	else
		echo yay already installed
	fi

	for p in "${PACKAGES[@]}"; do
		if pacman -Q "$p" &> /dev/null; then
			echo "$p" already installed
		else
			PACKAGES_TO_INSTALL="$PACKAGES_TO_INSTALL $p"
		fi
	done

	if [ -n "$PACKAGES_TO_INSTALL" ]; then
		echo Installing: $PACKAGES_TO_INSTALL
		yay -S --noconfirm $PACKAGES_TO_INSTALL
	else
		echo All packages are already installed
	fi
}

install_packages
