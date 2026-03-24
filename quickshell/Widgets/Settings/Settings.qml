import QtQuick.Layouts
import Quickshell

import "../../Components"
import "../../Style"
import "../../Core"

WidgetWrapper {
	id: root

	required property ShellScreen screen

	onClicked: {
		panel.active = !panel.active
	}

	RowLayout {
		spacing: Theme.itemSpacing
		// 󰂲 󰂯 󰂱, 󰤟 󰤢 󰤥 󰤨 󰤭,  󰂛 󱅫

		FontText { text: PipewireUtils.isReady() && PipewireUtils.getIcon("sink") }
		FontText { text: PipewireUtils.isReady() && PipewireUtils.getIcon("source") }
		FontText { text: "󰂯" }
		FontText { text: "󰤨" }
		FontText { text: "" }
	}

	SettingsPanel {
		id: panel

		screen: root.screen
		spawner: root
	}
}
