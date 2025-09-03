import QtQuick
import QtQuick.Layouts

Rectangle {
    radius: 8
    color: ColorsHellwal.color9

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
            text: TimeService.format("󰥔 hh:mm")
            color: ColorsHellwal.foreground
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            text: TimeService.format("󰃭 ddd d. MMM yyyy")
            font.family: Config.font.family.mono
            color: ColorsHellwal.foreground
        }
    }
}
