import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Quickshell
import Quickshell.Hyprland

import "../../Style"
import "../../Components"

WidgetWrapper {
	id: root
	required property ShellScreen screen;

	RowLayout {
		spacing: Theme.itemSpacing

		Repeater {
			model: WorkspaceWrapper.getMonitorWorkspaces(root.screen)

			BorderedRectangle {
				id: borderedRectangle
				property bool isFocused: Hyprland.focusedWorkspace?.name == modelData?.name

				borderBottomColor: Theme.mainText
				borderBottomWidth: isFocused ? 1 : 0

				implicitWidth: text.implicitWidth
				implicitHeight: text.implicitHeight

				Button {
					implicitWidth: text.implicitWidth
					implicitHeight: text.implicitHeight
					background: Rectangle {	color: "transparent" }

					onHoveredChanged: {
						parent.isFocused = Qt.binding(() => hovered || Hyprland.focusedWorkspace.name == modelData.name)
					}

					onClicked: {
						Hyprland.dispatch("workspace " + modelData.name)
					}

					FontText {
						id: text
						text: modelData.name
						color: borderedRectangle.isFocused ? Theme.mainText: Theme.secondaryText

					}
				}

			}
		}
	}
}
