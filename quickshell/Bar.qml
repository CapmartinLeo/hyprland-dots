import Quickshell
import Quickshell.Io
import QtQuick

import "Style/"
import "Modules/"

Scope {
	Variants {
		model: Quickshell.screens

		PanelWindow {
			id: bar
			required property var modelData
			screen: modelData

			anchors {
				top: true
				left: true
				right: true
			}

			color: "transparent"

			implicitHeight: bar_content.implicitHeight + Theme.defaultMargin * 2

			Rectangle {
				id: bar_content

				anchors {
					fill: parent
					topMargin: Theme.defaultMargin
					bottomMargin: Theme.defaultMargin
					leftMargin: Theme.defaultMargin
					rightMargin: Theme.defaultMargin
				}

				implicitHeight: Math.max(left.implicitHeight, center.implicitHeight, right.implicitHeight)
				color: "transparent"

				LeftModule {
					id: left
					bar: bar
				}

				CenterModule {
					id: center
					bar: bar
				}

				RightModule {
					id: right
					bar: bar
				}
			}
		}
	}
}
