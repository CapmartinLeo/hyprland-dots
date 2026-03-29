import QtQuick 

Rectangle {
  id: root
  property color borderTopColor: "transparent"
  property color borderBottomColor: "transparent"
  property color borderLeftColor: "transparent"
  property color borderRightColor: "transparent"
  property int borderTopWidth: 0
  property int borderBottomWidth: 0
  property int borderLeftWidth: 0
  property int borderRightWidth: 0

  color: "transparent"

  // top border
  Rectangle {
    anchors.top: parent.top;
    anchors.left: parent.left;
    anchors.right: parent.right;
    height: root.borderTopWidth;
    color: root.borderTopColor
  }
  // bottom border
  Rectangle {
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    anchors.right: parent.right;
    height: root.borderBottomWidth;
    color: root.borderBottomColor
  }
  // left border
  Rectangle {
    anchors.top: parent.top;
    anchors.bottom: parent.bottom;
    anchors.left: parent.left;
    width: root.borderLeftWidth;
    color: root.borderLeftColor 
  }
  // right border
  Rectangle { 
    anchors.top: parent.top;
    anchors.bottom: parent.bottom;
    anchors.right: parent.right;
    width: root.borderRightWidth;
    color: root.borderRightColor
  }
}
