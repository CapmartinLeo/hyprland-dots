pragma ComponentBehavior: Bound

import QtQuick
import Quickshell
import Quickshell.Wayland
import Quickshell.Widgets

import "../Style"

LazyLoader {
  id: root

  required default property Item child;

  required property Item spawner
  required property ShellScreen screen

  property point globalPos

  function getPos() {
    const pos = spawner.mapToGlobal(spawner.width / 2, spawner.height)

    return {
      x: pos.x - screen.x,
      y: pos.y + Theme.defaultMargin - screen.y
    }
  }

  onActiveChanged: {
    let pos = getPos()
    globalPos.x = pos.x
    globalPos.y = pos.y

  }

  PanelWindow {
    id: panel
    anchors {
      left: true
      top: true
      right: true
      bottom: true
    }
    exclusionMode: ExclusionMode.Ignore

    color: "transparent"

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.OnDemand

    MouseArea {
      anchors.fill: parent
      acceptedButtons: Qt.RightButton | Qt.LeftButton
      onClicked: {
        root.active = false
      }

    }

    Rectangle {
      id: content
      color: Theme.windowBackground
      radius: Theme.defalutRadius

      implicitWidth: area.implicitWidth
      implicitHeight: area.implicitHeight
      property double desiredX: root.globalPos.x - width / 2
      property double actualX: desiredX + width > root.screen.width
        ? root.screen.width - width - Theme.defaultMargin 
        : desiredX

      x: actualX
      y: root.globalPos.y

      border {
        color: Theme.windowBorder
        width: 2
      }

      focus: true

      Keys.onEscapePressed: {
        root.active = false
      }

      MouseArea {
        id: area

        acceptedButtons: Qt.RightButton | Qt.LeftButton
        onClicked: {} // do nothing only consume the event

        MarginWrapperManager {
          topMargin:    Theme.defaultMargin
          bottomMargin: Theme.defaultMargin
          leftMargin:   Theme.defaultMargin
          rightMargin:  Theme.defaultMargin
        }

        children: [
          root.child
        ]
      }

    }
  }
}
