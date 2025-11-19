import Quickshell.Widgets
import QtQuick

Rectangle {
  id: widgetWrapper
  required default property Item child

  radius: Theme.defalutRadius

  color: Colors.surface_container

  anchors {
    leftMargin: Theme.defaultMargin
    rightMargin: Theme.defaultMargin
  }

  MarginWrapperManager { 
    topMargin: Theme.defaultMargin
    bottomMargin: Theme.defaultMargin
    leftMargin: Theme.defaultMargin * 2
    rightMargin: Theme.defaultMargin * 2
  }

  children: [
    widgetWrapper.child 
  ]
}
