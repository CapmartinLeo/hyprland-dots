//@ pragma UseQApplication
//@ pragma IconTheme Papirus
import QtQuick
import Quickshell

Scope {
	Connections {
		target: Quickshell
		function onReloadCompleted() {
			Quickshell.inhibitReloadPopup();
		}
	}

	Bar {}
}
