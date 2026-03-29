pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import "../../Components"
import "../../Style"

import "MonthsToString.mjs" as Helper

PopupPanelWindow {
	WidgetWrapper {
		id: root
		property int day: Time.currentDay.day
		property int month: Time.currentDay.month
		property int year: Time.currentDay.year

		function incrementMonth() {
			month = (month + 1) % 12
			if (month == 0) {
				year++
			}
		}

		function decrementMonth() {
			let tmp = month - 1
			if (tmp == -1) {
				tmp = 11
				year--
			}

			month = tmp
		}

		function setDate(date) {
			day = date.day
			month = date.month
			year = date.year
		}

		GridLayout {
			columns: 3
			RoundedButton {
				Layout.preferredWidth: 20
				Layout.preferredHeight: 20

				contentText: ""

				onClicked: { root.decrementMonth() }
			}

			Rectangle {
				Layout.fillWidth: true
				Layout.fillHeight: true
				color: "transparent"
				FontText {
					anchors.centerIn: parent
					font.pointSize: Theme.bigFontSize
					text:`${Helper.monthToString(root.month)} ${root.year}`
				}
			}

			RoundedButton  {
				Layout.preferredWidth: 20
				Layout.preferredHeight: 20

				contentText: ""

				onClicked: { root.incrementMonth() }
			}

			DayOfWeekRow {
				Layout.columnSpan: 3
				Layout.fillWidth: true

				locale: monthGrid.locale

				delegate: FontText {
					text: shortName

					horizontalAlignment: Text.AlignHCenter
					verticalAlignment: Text.AlignVCenter

					color: Theme.highlightText

					required property string shortName
				}
			}

			MonthGrid {
				id: monthGrid

				Layout.columnSpan: 3
				Layout.fillWidth: true

				month: root.month
				year: root.year
				locale: Qt.locale("en_US")

				delegate: Rectangle {
					id: dayCell

					required property var model

					property bool isCurrentDay: model.month == root.month 
						&& model.day == root.day
						&& model.year == root.year

					implicitWidth: label.implicitWidth
					implicitHeight: label.implicitHeight

					radius: Theme.defalutRadius

					color: isCurrentDay ? Theme.buttonColor : "transparent"

					MouseArea {
						anchors.fill: parent
						onClicked: { root.setDate(parent.model) }
					}

					FontText {
						id: label

						anchors.centerIn: parent

						text: monthGrid.locale.toString(dayCell.model.date, "d")
						color: dayCell.isCurrentDay ? Theme.buttonTextColor : Theme.mainText
						opacity: dayCell.model.month === monthGrid.month ? 1 : 0.5
					}

				} 
			}	
		}
	}
}
