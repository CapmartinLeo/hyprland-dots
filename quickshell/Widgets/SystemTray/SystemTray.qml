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

	visible: SystemTray.items.values.length > 0

	RowLayout {
		spacing: Theme.itemSpacing
		Repeater {
			model: SystemTray.items

			IconImage {
				id: item
				required property SystemTrayItem modelData
				source: modelData?.icon || ""
				implicitSize: 18

				TrayMenu {
					id: menu
					screen: root.screen
					spawner: item
					
					handle: item.modelData?.menu || null
				}

				MouseArea {
					anchors.fill: parent
					acceptedButtons: Qt.RightButton | Qt.LeftButton | Qt.MiddleButton
					onClicked: (mouse) => {
						const button = mouse.button
						const itemData = item.modelData

						if (button == Qt.RightButton && itemData.hasMenu) {
							// hack to refresh list when opening tray
							menu.handle = null
							menu.handle = itemData.menu

							menu.active = true
						} else if (button == Qt.LeftButton && !itemData.onlyMenu) {
							itemData.activate()
						} else if (button == Qt.LeftButton) {
							itemData.secondaryActivate()
						}
					}
				}
			}
		}
	}
}
