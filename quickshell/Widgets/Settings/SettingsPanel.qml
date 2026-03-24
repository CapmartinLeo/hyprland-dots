import QtQuick
import QtQuick.Layouts

import "Pipewire"

import "../../Components"
import "../../Style"
import "../../Core"

PopupPanelWindow {
	ColumnLayout {
		spacing: Theme.barSpacing
		WidgetWrapper {
			Loader {
				active: PipewireUtils.isReady()
				sourceComponent: PipewireSettings { type: "sink" }
			}
		}
		WidgetWrapper {
			Loader {
				active: PipewireUtils.isReady()
				sourceComponent: PipewireSettings { type: "source" }
			}
		}
	}
}
