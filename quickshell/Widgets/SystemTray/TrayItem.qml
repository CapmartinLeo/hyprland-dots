import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets

import "../../Components"
import "../../Style"


ColumnLayout {
	id: root

	required property QsMenuEntry trayItem

	property bool subMenuOpened: false
	property bool subMenuLoaded: false

	signal menuShouldClose();

	anchors.fill: parent

	spacing: 0

	Rectangle {
		color: "transparent"
		Layout.fillWidth: true
		Layout.minimumWidth: rowLayout.implicitWidth
		Layout.preferredHeight: rowLayout.implicitHeight

		MouseArea {
			id: mouseArea
			anchors.fill: parent
			hoverEnabled: true

			onClicked: {
				if (root.trayItem.hasChildren) {
					root.subMenuOpened = !root.subMenuOpened

				} else {
					root.trayItem.triggered()
					root.menuShouldClose()
				}
			}

			onEntered: parent.color = "blue"
			onExited: parent.color = "transparent"
		}

		RowLayout {
			id: rowLayout
			anchors.fill: parent
			spacing: Theme.itemSpacing

			IconImage {
				source: root.trayItem.icon
				implicitSize: text.implicitHeight
			}

			FontText {
				Layout.fillWidth: true
				id: text
				text: root.trayItem?.text || ""
			}

			FontText {
				property string endIcon: root.trayItem.hasChildren
				? (root.subMenuOpened ? "" : "")
				: " "
				text: endIcon

			}
		}
	}

	Item {
		id: subMenu
		implicitWidth: subMenuLoader.implicitWidth
		clip: true

		Layout.preferredHeight: root.subMenuOpened && subMenuLoader.item
		? subMenuLoader.item.implicitHeight
		: 0

		Behavior on Layout.preferredHeight {
			NumberAnimation {
				duration: 100
				easing.type: Easing.InOutQuad
			}
		}

		Loader {
			id: subMenuLoader
			active: root.trayItem.hasChildren && root.subMenuOpened
			source: "ItemList.qml"
			onLoaded: {
				item.menu = root.trayItem
			}
		}
	}
}
