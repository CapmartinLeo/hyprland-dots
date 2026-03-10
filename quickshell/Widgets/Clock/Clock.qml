import QtQuick.Layouts
import Quickshell

import "../../Style"
import "../../Components"

WidgetWrapper {
	id: root
		
	required property ShellScreen screen;
	onClicked: {
		calendar.active = !calendar.active

	}

	RowLayout {
		spacing: Theme.itemSpacing
		FontText { text: "" }
		FontText { text: Time.time }
	}	

	CalendarWindow {
		id: calendar

		spawner: root
		screen: root.screen
	}
}
