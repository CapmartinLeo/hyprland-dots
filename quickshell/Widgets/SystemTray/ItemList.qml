pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell

import "../../Style"

ColumnLayout {
	id: root
	property QsMenuHandle menu
	property bool isSubMenu: false

	anchors.fill: isSubMenu ? parent : null

	spacing: 0

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
			property bool isSeparator: modelData.isSeparator

			Layout.fillWidth: true
			Layout.minimumWidth: isSeparator ? 0 : trayItem.implicitWidth
			Layout.preferredHeight: isSeparator ? Theme.menuSeparatorHeight :  trayItem.implicitHeight

			readonly property Item separator: Rectangle {
				anchors.left: parent?.left
				anchors.right: parent?.right
				anchors.verticalCenter: parent?.verticalCenter

				implicitHeight: 1
				color: Theme.menuSeparator
			}

			readonly property Item trayItem: TrayItem {
				id: menuItem

				trayItem: item.modelData

				onMenuShouldClose: root.menuShouldClose()

			}

			children: isSeparator ? [separator] : [trayItem]
		}

	}
}

