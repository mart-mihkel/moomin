import QtQuick
import "../services"
import "../util"

Column {
    Icon { icon: "calendar_clock" }
    Text {
        text: Clock.format("hh\nmm")
        font.family: Config.font.family.mono
        anchors.horizontalCenter: parent.horizontalCenter
        color: Colors.foreground
    }
}
