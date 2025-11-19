import QtQuick
import QtQuick.Controls

import Quickshell.Widgets
import Quickshell.Hyprland

import "../../Style"

WidgetWrapper {
	Row {
		spacing: Theme.defaultMargin * 2

		Repeater {
			model: Hyprland.workspaces

			Rectangle {
				color: "transparent"
				implicitWidth: borderedRectangle.implicitWidth
				implicitHeight: borderedRectangle.implicitHeight

				BorderedRectangle {
					id: borderedRectangle
					property bool isFocused: Hyprland.focusedWorkspace.name == modelData.name

					borderBottomColor: Colors.on_tertiary 
					borderBottomWidth: isFocused ? 2 : 0

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
							font.pixelSize: 15
							text: modelData.name
							color: borderedRectangle.isFocused ? Colors.on_tertiary : Colors.on_primary

						}
					}

				}
			}
		}
	}
}
