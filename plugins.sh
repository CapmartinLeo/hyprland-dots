#!/bin/sh

PLUGINS_LIST=(
	https://github.com/Duckonaut/split-monitor-workspaces
)

install_plugins() {
	for plugin in "${PLUGINS_LIST[@]}"; do
		# Check if the plugin is already installed
		if [ ! -d "$HOME/.config/qtile/plugins/$(basename $plugin)" ]; then
			echo "Installing plugin: $plugin"
			git clone "$plugin" "$HOME/.config/qtile/plugins/$(basename $plugin)"
		else
			echo "Plugin $(basename $plugin) is already installed."
		fi
	done
}
