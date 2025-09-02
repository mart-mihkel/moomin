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

        ColumnLayout {
            spacing: Config.margin.md * 2
            anchors {
                fill: parent
                topMargin: 8
                leftMargin: 8
                rightMargin: 8
                bottomMargin: 8
            }

            Column {
                MaterialIcon { text: "image" }
                BarWorkspaces {}
            }

            Column { Layout.fillHeight: true }


            Column {
                MaterialIcon { text: "calendar_clock" }
                BarClock {}
            }

            Column {
                MaterialIcon { text: "tune" }
                Dashboard {}
            }
        }
    }
}
