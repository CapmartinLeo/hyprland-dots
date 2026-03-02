pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets

import "../../Components"
import "../../Style"

PopupPanelWindow {
	id: root
	required property QsMenuHandle handle

	Item {
		implicitWidth: content.implicitWidth
		implicitHeight: content.implicitHeight
		QsMenuOpener {
			id: trayActions

			menu: root.handle

		}

		ColumnLayout {
			id: content
			spacing: 0 // Theme.defaultSpacing

			Item {
				id: maxWidth
				Layout.fillWidth: true
			}

			Repeater {
				id: repeater

				model: trayActions.children
				Loader {
					id: loader
					required property QsMenuEntry modelData

					readonly property Component separator: Item {
						MarginWrapperManager {
							topMargin: Theme.defaultSpacing
							bottomMargin: Theme.defaultSpacing
						}

						Rectangle {
							implicitWidth: maxWidth.width
							implicitHeight: 1
							color: "red"
						}
					}

					readonly property Component item: TrayItem {
						trayItem: loader.modelData
						maxWidth: maxWidth.width
						window: root

					}
					sourceComponent: modelData.isSeparator ? separator : item
				}

			}
		}
	}
}
