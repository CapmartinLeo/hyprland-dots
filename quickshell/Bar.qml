import Quickshell
import Quickshell.Io
import QtQuick

import "Style/"
import "Widgets/Clock"
import "Widgets/Workspaces"

Scope {
	Variants {
		model: Quickshell.screens

		PanelWindow {

			anchors {
				top: true
				left: true
				right: true
			}

			implicitHeight: 30
			color: "#000000"

			Rectangle {
				anchors {
					left: parent.left
					right: parent.right
					top: parent.top
					bottom: parent.bottom
					leftMargin: 8
					rightMargin: 8
				}
				color: "#000000"

				Workspaces {
					anchors {
						left: parent.left
						verticalCenter: parent.verticalCenter
					}
					color: Colors.primary
				}

				ClockWidget {
					anchors {
						right: parent.right
						verticalCenter: parent.verticalCenter
					}
					color: Colors.primary
				}
			}
		}
	}
}

