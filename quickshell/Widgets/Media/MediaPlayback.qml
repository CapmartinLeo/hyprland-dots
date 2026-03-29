import QtQuick
import QtQuick.Layouts

import Quickshell.Services.Mpris

import "../../Components"
import "../../Style"

import "helper.mjs" as Helper

RowLayout {
	id: root

	required property MprisPlayer player


	spacing: Theme.itemSpacing

	FrameAnimation {
		// only emit the signal when the position is actually changing.
		running: root.player.playbackState == MprisPlaybackState.Playing
		// emit the positionChanged signal every frame.
		onTriggered: root.player.positionChanged()
	}


	FontText {
		text: Helper.formatTime(root.player.position) 
	}

	StyledSlider {
		id: slider
		Layout.preferredWidth: 300

		enabled: root.player.positionSupported && root.player.canSeek

		value: pressed ? value : root.player.position
		from: 0
		to: root.player.length
		
		onPressedChanged: {
			if (pressed) return

			let offset = value - root.player.position
			root.player.seek(offset)
		}
	}

	FontText {
		text: Helper.formatTime(root.player.length)
	}
}
