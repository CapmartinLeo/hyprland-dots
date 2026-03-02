import Quickshell.Wayland
import "../../Components"
import "../../scripts/strings.mjs" as StringUtils

WidgetWrapper {
	id: root

	property var activeWindow: ToplevelManager.activeToplevel
	property bool isWindowActive: activeWindow?.activated ?? false

	visible: isWindowActive

	FontText {
		text: StringUtils.truncateMiddle(root.activeWindow?.title, 50)
	}
}
