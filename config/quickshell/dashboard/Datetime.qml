import QtQuick
import QtQuick.Layouts
import "../services"
import "../util"

Rectangle {
    radius: 8
    color: Colors.color8

    Column {
        anchors {
            verticalCenter: parent.verticalCenter
            horizontalCenter: parent.horizontalCenter
        }

        Text {
            font {
                bold: true
                pointSize: 24
                family: Config.font.family.mono
            }

            anchors.horizontalCenter: parent.horizontalCenter
            text: Clock.format("󰥔 hh:mm")
            color: Colors.foreground
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: Clock.format("󰃭 ddd d. MMM yyyy")
            font.family: Config.font.family.mono
            color: Colors.foreground
        }
    }
}
