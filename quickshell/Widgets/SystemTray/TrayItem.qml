pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell
import Quickshell.Widgets

import "../../Components"
import "../../Style"


Rectangle {
	id: root

	required property QsMenuEntry trayItem
	required property double maxWidth
	required property PopupPanelWindow window

	property bool subMenuOpened: false

	color: "transparent"
	implicitWidth: itemContent.implicitWidth
	implicitHeight: itemContent.implicitHeight

	MouseArea {
		id: mouseArea
		anchors.fill: parent
		hoverEnabled: true

		onClicked: {
			if (root.trayItem.hasChildren) {
				root.subMenuOpened = !root.subMenuOpened

			} else {
				root.trayItem.triggered()
				root.window.active = false
			}
		}

		onEntered: parent.color = "blue"
		onExited: parent.color = "transparent"

	}

	QsMenuOpener {
		id: subMenuItems

		menu: root.trayItem.hasChildren ? root.trayItem : null
	}

	ColumnLayout {
		id: itemContent
		spacing: 0
		RowLayout {
			spacing: Theme.defaultSpacing
			implicitWidth: root.maxWidth > implicitWidth ? root.maxWidth : implicitWidth

			IconImage {
				source: root.trayItem.icon
				implicitSize: text.implicitHeight
			}

			FontText {
				Layout.fillWidth: true
				id: text
				text: root.trayItem.text
			}

			FontText {
				text: root.trayItem.hasChildren ? "" : " "
			}
		}

		Rectangle {
			id: subMenu
			color: "green"
			Layout.fillWidth: true

			states: State {
				name: "opened"
				when: root.subMenuOpened
				PropertyChanges {
					target: subMenu
					implicitHeight: 30
				}
			}

			transitions: Transition {

				NumberAnimation {
					duration: 100
					properties: "implicitHeight"
					easing.type: Easing.InOutQuad
				}
			}


			ColumnLayout {
				Repeater {
					model: subMenuItems

					// TrayItem {
					// 	required property QsMenuEntry modelData
					// 	trayItem: modelData
					// 	maxWidth: root.maxWidth
					// 	window: root.window
					// }
				}
			}
		}

	}

} 
