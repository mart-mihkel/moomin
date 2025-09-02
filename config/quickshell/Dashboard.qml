import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell

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
            implicitWidth: 300
            implicitHeight: 400
            color: "transparent"

            RectangularShadow {
                anchors.fill: dashboardRect
                color: ColorsHellwal.foreground
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
                color: ColorsHellwal.background

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

                    DashboardDate {}
                    DashboardMedia {}
                    DashboardSliders {}
                    DashboardMpris {}
                    DashboardLogout {}
                }
            }
        }
    }
}
