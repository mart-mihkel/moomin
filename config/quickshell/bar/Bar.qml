import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import "../util"

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
        color: Colors.foreground
    }

    Rectangle {
        anchors {
            fill: parent
            topMargin: 32
            leftMargin: 8
            rightMargin: 8
            bottomMargin: 32
        }

        id: barRect
        radius: 8
        color: Colors.background

        ColumnLayout {
            anchors {
                fill: parent
                topMargin: 8
                leftMargin: 8
                rightMargin: 8
                bottomMargin: 8
            }

            spacing: 16

            Workspaces {}
            Tray {}
            Column { Layout.fillHeight: true }
            Time {}
            Dashboard {}
        }
    }
}
