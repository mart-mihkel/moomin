import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell
import Quickshell.Widgets
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
                topMargin: 4
                leftMargin: 4
                rightMargin: 4
                bottomMargin: 4
            }

            spacing: 4

            WrapperRectangle {
                margin: 4
                radius: 4
                color: Colors.color8
                child: Workspaces {}
            }

            WrapperRectangle {
                margin: 4
                radius: 4
                color: Colors.color8
                child: Tray {}
            }

            Column { Layout.fillHeight: true }

            WrapperRectangle {
                margin: 4
                radius: 4
                color: Colors.color8
                child: Time {}
            }

            WrapperRectangle {
                margin: 4
                radius: 4
                color: Colors.color8
                child: Dashboard {}
            }
        }
    }
}
