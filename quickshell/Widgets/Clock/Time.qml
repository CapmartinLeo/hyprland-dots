pragma Singleton

import Quickshell

Singleton {
	id: root
	readonly property string time: {
		Qt.formatDateTime(clock.date, "ddd dd MMM hh:mm:ss")
	}

	readonly property var currentDay: {
		return {
			day: clock.date.getDate(),
			month: clock.date.getMonth(),
			year: 1900 + clock.date.getYear()
		}

	}

	SystemClock {
		id: clock
		precision: SystemClock.Seconds
	}
}
