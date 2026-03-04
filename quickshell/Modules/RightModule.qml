import QtQuick.Layouts
import Quickshell

import "../Style"

import "../Widgets/Clock"
import "../Widgets/SystemTray"

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
	Clock {}
}
