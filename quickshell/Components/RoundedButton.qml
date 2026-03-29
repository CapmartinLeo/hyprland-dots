import QtQuick
import QtQuick.Controls
import Quickshell.Widgets

import "../Style"

AbstractButton {
	id: root

	required property string contentText
	property double fontSize: Theme.defaultFontSize

	property color buttonColor: enabled ? Theme.buttonColor : Theme.buttonDisabledColor
	property color textColor: enabled ? Theme.buttonTextColor : Theme.buttonDisabledTextColor


	onPressedChanged: {
		if (!enabled) return

		if (pressed) {
			buttonColor = Theme.buttonHoveredColor
			textColor   = Theme.buttonHoveredTextColor
		} else {
			buttonColor = Theme.buttonColor
			textColor   = Theme.buttonTextColor
		}
	}

	background: Rectangle {
		radius: 30
		opacity: root.hovered ? 0.7 : 1
		color: root.buttonColor
	}
	
	FontText {
		anchors.centerIn: parent
		color: root.textColor
		text: root.contentText
		font.pointSize: root.fontSize
	}
}
