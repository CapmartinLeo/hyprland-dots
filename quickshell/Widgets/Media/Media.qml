import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Services.Mpris

import "../../Components"

import "helper.mjs" as Helper

WidgetWrapper {
	id: root
	required property ShellScreen screen
	property ObjectModel players: Mpris.players
	property MprisPlayer activePlayer: Mpris.players.values[0] || null
	
	property var globalPos

	visible: players.values.length > 0

	onClicked: {
		panel.active = !panel.active
	}

	RowLayout {
		id: test
		FontText {
			text: Helper.getAppIcon(root.activePlayer?.identity)
		}

		FontText {
			id: text
			text: root.visible ? Helper.formatMediaTitle(root.activePlayer, 40) : ""
		}
	}

	MediaPanel { 
		id:panel

		// bar: root.topLevel
		spawner: root
		screen: root.screen
	}
}
