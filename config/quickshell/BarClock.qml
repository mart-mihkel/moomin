import Quickshell
import QtQuick

Column {
    MaterialIcon { text: "calendar_clock" }
    Text {
        text: TimeService.format("hh\nmm")
        font.family: Config.font.family.mono
        anchors.horizontalCenter: parent.horizontalCenter
    }
}

