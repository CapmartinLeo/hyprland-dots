import QtQuick.Layouts
import Quickshell

import "../Style"

import "../Widgets/SystemTray"
import "../Widgets/KBLayout"
import "../Widgets/Clock"

RowLayout {
	id: root

	required property PanelWindow bar;
	property ShellScreen screen: bar.screen;

	anchors.verticalCenter: parent.verticalCenter
	anchors.right: parent.right
	spacing: Theme.barSpacing

	SystemTray {
		screen: root.screen
	}
	KBLayout {}
	Clock {
		screen: root.screen
	}
}
