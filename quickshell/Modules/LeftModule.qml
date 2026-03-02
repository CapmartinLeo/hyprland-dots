import QtQuick.Layouts
import Quickshell

import "../Style"

import "../Widgets/Workspaces"
import "../Widgets/WindowTitle"

RowLayout {
	id: root

	required property PanelWindow bar;
	property ShellScreen screen: bar.screen;

	anchors.left: parent.left
	anchors.verticalCenter: parent.verticalCenter
	spacing: Theme.defaultSpacing

	Workspaces { screen: root.screen }

	WindowTitle {}
}
