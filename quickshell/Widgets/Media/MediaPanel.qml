import QtQuick
import QtQuick.Layouts
import Quickshell.Widgets
import Quickshell.Services.Mpris

import "../../Components"
import "../../Style"

import "helper.mjs" as Helper

PopupPanelWindow {
	ColumnLayout {
		spacing: Theme.defaultMargin

		Repeater {
			model: Mpris.players

			WidgetWrapper {
				id: entry
				required property MprisPlayer modelData
				ColumnLayout {
					FontText {
						text: Helper.getAppIcon(entry.modelData.identity) + " " + entry.modelData.identity
						color: Theme.secondaryText
						font.pointSize: Theme.smallFontSize
					}
					RowLayout {
						spacing: Theme.defaultSpacing
						Layout.preferredWidth: playback.implicitWidth

						ClippingWrapperRectangle {
							radius: Theme.defalutRadius
							Layout.preferredWidth: 75
							Layout.preferredHeight: 75
							color: "transparent"

							Image {
								id: trackCover
								source: entry.modelData.trackArtUrl
								fillMode: Image.PreserveAspectCrop
								clip: true
							}
						}

						ClippingRectangle {
							Layout.alignment: Qt.AlignLeft
							Layout.fillWidth: true
							Layout.fillHeight: true
							color: "transparent"

							ColumnLayout {
								FontText {
									text: entry.modelData.trackTitle || "Unknown Title"
									font.pointSize: Theme.bigFontSize
								}

								FontText {
									text: entry.modelData.trackArtist || "Unknown Artist"
									color: Theme.secondaryText
								}
							}
						}

						MediaControls {
							Layout.alignment: Qt.AlignRight
							player: entry.modelData
						}
					}

					MediaPlayback {
						id: playback
						player: entry.modelData
					}
				}
			}
		}
	}
}
