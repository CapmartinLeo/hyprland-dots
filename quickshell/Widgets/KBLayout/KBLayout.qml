import QtQuick
import QtQuick.Layouts

import Quickshell.Io
import Quickshell.Hyprland

import "../../Style"
import "../../Components"

import "GetKbLayout.mjs" as Helper

WidgetWrapper {
	id: root

	property string kbLayout: ""

	// get starting KbLayout
	Process {
		running: true
		command: ["sh", "-c", "hyprctl devices -j"]
		stdout: StdioCollector {
			onStreamFinished: {
				root.kbLayout = Helper.getKbLayout(this.text)
			}
		}
	}

	Process { id: process }
	onClicked: {
		process.exec(["sh", "-c", "hyprctl switchxkblayout current next"])
	}

	Connections {
		target: Hyprland
		
		function onRawEvent(event) {
			if (event.name == "activelayout") {
				let layout = event.parse(2)
				root.kbLayout = layout[1]
			}
		}
	}

	RowLayout {
		spacing: Theme.itemSpacing

		FontText { text: "" }
		FontText { text: root.kbLayout }
	}
}
