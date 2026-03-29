import Qt5Compat.GraphicalEffects
import QtQuick
import Quickshell
import Quickshell.Widgets

Item {
	id: root

	required property string source
	required property int size

	property color color: "transparent"
	property bool cached: false

	implicitWidth: icon.implicitWidth
	implicitHeight: icon.implicitHeight

	IconImage {
		id: icon
		source : Quickshell.iconPath(root.source)
		implicitSize: root.size
	}	

	ColorOverlay {
		anchors.fill: icon
		source: icon
		color: root.color
		cached: root.cached
	}
}
