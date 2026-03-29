pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import Quickshell.Io

import "../../Components"
import "../../Style"
import "../../Core"

Item {
	id: root
	implicitWidth: content.width
	implicitHeight: content.implicitHeight

	required property string type;

	ColumnLayout {
		id: content
		width: 250

		RowLayout {
			spacing: Theme.barSpacing
			Layout.fillWidth: true

			RoundedButton {
				Layout.preferredWidth: 20
				Layout.preferredHeight: 20
				contentText: PipewireUtils.getIcon(root.type)

				onClicked: {
					PipewireUtils.toggleDefaultMute(root.type)
				}
			}

			StyledSlider {
				Layout.fillWidth: true

				from: 0
				to: 1

				value: PipewireUtils.getDefaultVolume(root.type)

				onMoved: {
					PipewireUtils.setDefaultVolume(root.type, value)
				}
			}

			RoundedButton  {
				Layout.preferredWidth: 20
				Layout.preferredHeight: 20
				contentText: menu.menuOpened ? "": ""

				onClicked: {
					menu.menuOpened = !menu.menuOpened
				}
			}
		}

		Item {
			visible: menu.menuOpened || animation.running

			Layout.fillWidth: true
			Layout.preferredWidth: options.implicitWidth
			Layout.preferredHeight: menu.menuOpened 
			? options.implicitHeight
			: 0

			Behavior on Layout.preferredHeight {
				NumberAnimation {
					id: animation
					duration: 100
					easing.type: Easing.InOutQuad
				}

			}

			clip: true
			ColumnLayout {
				id: options
				Repeater {
					model: PipewireUtils.getDevices(root.type)	

					Item {
						id: labelBox

						required property var modelData

						Layout.preferredWidth: content.width
						Layout.preferredHeight: label.implicitHeight

						clip: true
						MouseArea {
							id: area
							anchors.fill: parent
							hoverEnabled: true

							onClicked: { PipewireUtils.setDefaultTo(root.type, labelBox.modelData.id) }
						}

						FontText { 
							id: label

							property bool active: PipewireUtils.isDefault(root.type, labelBox.modelData.id) || area.containsMouse

							text: "  " + labelBox.modelData.label 
							color: active ? Theme.mainText : Theme.buttonDisabledColor

						}
					}

				}

				Item {
					id: menu

					property bool menuOpened: false

					Layout.preferredWidth: content.width
					Layout.preferredHeight: settingsLabel.implicitHeight

					clip: true

					MouseArea {
						id: settingsArea
						anchors.fill: parent
						hoverEnabled: true

						Process { id: settingsLauncher }
						onClicked: {
							settingsLauncher.exec(["sh", "-c", "pavucontrol"])
						}
					}

					FontText { 
						id: settingsLabel
						text: "󰒓  Settings"
						color: settingsArea.containsMouse ? Theme.mainText : Theme.buttonDisabledColor

					}
				}
			}

		}

	}
}

