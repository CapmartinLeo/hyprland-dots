import Quickshell

import "../../Components"

PopupPanelWindow {
	id: root
	required property QsMenuHandle handle

	ItemList {
		id: content
		menu: root.handle

		onMenuShouldClose: { root.active = false }
	}
}
