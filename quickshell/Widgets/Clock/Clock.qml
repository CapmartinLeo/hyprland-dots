import Quickshell
import "../../Components"

WidgetWrapper {
	id: root
		
	required property ShellScreen screen;
	onClicked: {
		calendar.active = !calendar.active

	}

	FontText {
		text: Time.time
	}

	CalendarWindow {
		id: calendar

		spawner: root
		screen: root.screen
	}
}
