pragma Singleton

import Quickshell
import QtQuick

Singleton {
  //global
  readonly property double defaultFontSize: 9.6
  readonly property double smallFontSize: 8
  readonly property double bigFontSize: 11
  readonly property int barSpacing: 10
  readonly property int itemSpacing: 5
  readonly property int defaultMargin: 5
  readonly property int defalutRadius: 4

  
  readonly property color widgetBackground: Colors.primary_container
  readonly property color windowBackground: Colors.surface
  readonly property color windowBorder: Colors.surface_container
  readonly property color mainText: Colors.on_primary_container
  readonly property color secondaryText: Colors.primary

  // buttons
  readonly property color buttonColor: Colors.secondary
  readonly property color buttonTextColor: Colors.on_secondary
  readonly property color buttonHoveredColor: Colors.secondary_fixed
  readonly property color buttonHoveredTextColor: Colors.on_secondary_fixed
  readonly property color buttonDisabledColor: Colors.outline
  readonly property color buttonDisabledTextColor: Colors.on_secondary

  // slider
  readonly property color sliderHandleColor: Colors.tertiary
  readonly property color sliderProgressColor: Colors.tertiary_fixed
  readonly property color sliderBackgroundColor: Colors.outline
  readonly property int sliderHandleSize: 10
  readonly property int sliderHandleRadius: 5
  readonly property int sliderHeight: 4
  readonly property int sliderRadius: 2
}
