import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell

PanelWindow {
    anchors {
        top: true
        left: true
        bottom: true
    }

    id: root
    color: "transparent"
    implicitWidth: 16 + 8*2 + 8*2

    RectangularShadow {
        anchors.fill: barRect
        color: ColorsHellwal.foreground
    }

    Rectangle {
        anchors {
            fill: parent
            topMargin: 8
            leftMargin: 8
            rightMargin: 8
            bottomMargin: 8
        }

        id: barRect
        radius: 8
        color: ColorsHellwal.background

        ColumnLayout {
            anchors {
                fill: parent
                topMargin: 8
                leftMargin: 8
                rightMargin: 8
                bottomMargin: 8
            }

            spacing: 16

            BarWorkspaces {}
            BarTray {}
            Column { Layout.fillHeight: true }
            BarClock {}
            BarDashboard {}
        }
    }
}
