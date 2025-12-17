pragma Singleton

import Quickshell

import Quickshell.Hyprland

Singleton {
	id: root

	function getMonitorWorkspaces(screen) {
		const monitor = Hyprland.monitorFor(screen)
		let workspaces = Hyprland.workspaces.values.filter(ws => ws.monitor.id === monitor.id);
		return workspaces;
	}
}
