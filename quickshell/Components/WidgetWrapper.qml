import QtQuick.Controls
import Quickshell.Widgets
import QtQuick
import "../Style"

AbstractButton {
  id: widgetWrapper

  background: Rectangle {
    radius: Theme.defalutRadius
    color: Theme.widgetBackground
  }

  MarginWrapperManager {
    topMargin: Theme.defaultMargin
    bottomMargin: Theme.defaultMargin
    leftMargin: Theme.defaultMargin * 2
    rightMargin: Theme.defaultMargin * 2
  }
}
