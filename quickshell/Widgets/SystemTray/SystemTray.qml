pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets 
import Quickshell.Services.SystemTray 

import "../../Components"
import "../../Style"

WidgetWrapper {
	id: root
	required property ShellScreen screen

	RowLayout {
		spacing: Theme.defaultSpacing
		Repeater {
			model: SystemTray.items

			IconImage {
				id: item
				required property SystemTrayItem modelData
				source: modelData.icon
				implicitSize: 18

				TrayMenu {
					id: menu
					screen: root.screen
					spawner: item
					
					handle: item.modelData.menu
				}

				MouseArea {
					anchors.fill: parent
					acceptedButtons: Qt.RightButton
					onClicked: {
						if (parent.modelData.hasMenu) {
							menu.active = true
						}
					}
				}
			}
		}
	}
}
