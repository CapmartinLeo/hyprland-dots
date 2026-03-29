import QtQuick.Layouts
import Quickshell

import "../Style"
import "../Widgets/Media"

RowLayout {
	id: root

	required property PanelWindow bar;
	property ShellScreen screen: bar.screen;

	anchors.verticalCenter: parent.verticalCenter
	anchors.horizontalCenter: parent.horizontalCenter
	spacing: Theme.barSpacing

	Media {
		screen: root.screen
	}
}
