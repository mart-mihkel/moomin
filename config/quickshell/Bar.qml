import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root
    color: "transparent"
    implicitWidth: 16 + Config.margin.md * 2
    anchors {
        top: true
        left: true
        bottom: true
    }

    ColumnLayout {
        spacing: Config.margin.md * 2
        anchors {
            fill: parent
            topMargin: Config.margin.md
            leftMargin: Config.margin.md
            rightMargin: Config.margin.md
            bottomMargin: Config.margin.md
        }

        Column {
            MaterialIcon { text: "image" }
            Workspaces {}
        }

        Item { Layout.fillHeight: enabled }

        Column {
            MaterialIcon { text: "calendar_clock" }
            Text {
                text: Time.format("hh\nmm")
                font.family: Config.font.family.mono
                anchors.horizontalCenter: parent.horizontalCenter
            }
        }

        MaterialIcon { text: "tune" }
    }
}
