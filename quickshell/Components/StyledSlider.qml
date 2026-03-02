import QtQuick
import QtQuick.Controls

import "../Style"
Slider {
	id: slider

	handle: Rectangle {
		color: Theme.sliderHandleColor
		radius: Theme.sliderHandleRadius
		implicitWidth: Theme.sliderHandleSize
		implicitHeight: Theme.sliderHandleSize
		x: slider.visualPosition * slider.width - width / 2
	}

	background: Item {
		id: background
		// color: "black"
		// color: "transparent"

		// background
		Rectangle {
			anchors.centerIn: parent
			color: Theme.sliderBackgroundColor
			opacity: slider.enabled && slider.hovered ? 0.7 : 1
			radius: Theme.sliderRadius
			height: Theme.sliderHeight
			width: slider.width
		}

		// progress bar
		Rectangle {
			color: Theme.sliderProgressColor
			anchors.verticalCenter: background.verticalCenter
			radius: Theme.sliderRadius
			implicitWidth: slider.visualPosition * slider.width
			implicitHeight: Theme.sliderHeight
		}
	}
}

