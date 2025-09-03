import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import "../util"

Scope {
    required property bool show

    id: root

    LazyLoader {
        active: root.show

        PanelWindow {
            anchors {
                left: true
                bottom: true
            }

            exclusiveZone: 0
            implicitWidth: 325
            implicitHeight: 450
            color: "transparent"

            RectangularShadow {
                anchors.fill: dashboardRect
                color: Colors.foreground
            }

            Rectangle {
                anchors {
                    fill: parent
                    topMargin: 8
                    leftMargin: 8
                    rightMargin: 8
                    bottomMargin: 32
                }

                id: dashboardRect
                radius: 8
                color: Colors.background

                GridLayout {
                    anchors {
                        fill: parent
                        topMargin: 8
                        leftMargin: 8
                        rightMargin: 8
                        bottomMargin: 8
                    }

                    rows: 4
                    columns: 3
                    rowSpacing: 8
                    columnSpacing: 8

                    Datetime {
                        Layout.columnSpan: 2
                        implicitWidth: parent.width * 2 / 3 - 8
                        implicitHeight: parent.heigth / 4
                    }

                    Media {
                        implicitWidth: parent.width / 3
                        implicitHeight: parent.heigth / 4
                    }

                    Sliders {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 4
                    }

                    Mpris {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 4
                    }

                    Logout {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 4
                    }
                }
            }
        }
    }
}
