pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell

ColumnLayout {
	id: root
	spacing: 0

	property QsMenuHandle menu

	signal menuShouldClose()

	QsMenuOpener {
		id: trayActions
		menu: root.menu
	}

	Repeater {
		id: repeater

		model: trayActions.children

		Item {
			id: item
			required property QsMenuEntry modelData

			Layout.fillWidth: true
			Layout.minimumWidth: trayItem.implicitWidth
			Layout.preferredHeight: trayItem.implicitHeight

			readonly property Item separator: Rectangle {
				anchors.left: parent?.left
				anchors.right: parent?.right
				anchors.verticalCenter: parent?.verticalCenter

				implicitHeight: 1
				color: "red"
			}

			readonly property Item trayItem: TrayItem {
				id: menuItem

				trayItem: item.modelData

				onMenuShouldClose: root.menuShouldClose()

			}

			children: modelData.isSeparator ? [separator] : [trayItem]
		}

	}
}

