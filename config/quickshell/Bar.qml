import Quickshell
import QtQuick
import QtQuick.Layouts

PanelWindow {
    id: root
    anchors {
        top: true
        left: true
        bottom: true
    }

    color: "transparent"
    implicitWidth: 16 + Config.margin.md * 2

    ColumnLayout {
        spacing: Config.margin.md * 2
        anchors {
            fill: parent
            topMargin: Config.margin.md
            leftMargin: Config.margin.md
            rightMargin: Config.margin.md
            bottomMargin: Config.margin.md
        }

        BarWorkspaces {}
        Item { Layout.fillHeight: true }
        BarClock {}
        Column {
            MaterialIcon { text: "tune" }
            Dashboard {}
        }
    }
}
