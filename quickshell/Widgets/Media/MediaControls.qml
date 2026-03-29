import QtQuick.Layouts

import Quickshell.Services.Mpris

import "../../Components"
import "../../Style"

RowLayout {
	id: root
	required property MprisPlayer player
	property bool playing: player.playbackState === MprisPlaybackState.Playing

	RoundedButton {
		implicitHeight: 30
		implicitWidth: 30
		fontSize: Theme.bigFontSize

		contentText:""
		enabled: root.player.canGoPrevious

		onClicked: root.player.previous()
	}
	RoundedButton {
		implicitHeight: 30
		implicitWidth: 30
		fontSize: Theme.bigFontSize

		contentText: root.playing ? "" : ""
		enabled: root.player.canTogglePlaying

		onClicked: root.player.togglePlaying()
	}
	RoundedButton {
		Layout.alignment: Qt.AlignRight
		implicitHeight: 30
		implicitWidth: 30
		fontSize: Theme.bigFontSize

		contentText:""
		enabled: root.player.canGoNext

		onClicked: root.player.next()
	}
}
