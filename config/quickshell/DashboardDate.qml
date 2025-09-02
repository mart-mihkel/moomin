import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.columnSpan: 2
    implicitWidth: parent.width * 2 / 3 - 8/2
    implicitHeight: parent.heigth / 4
    radius: 8
    color: ColorsHellwal.color9

    Text {
        id: clock
        anchors.horizontalCenter: parent.horizontalCenter
        y: 10 // TODO: un-hardcode
        font.pointSize: 24
        font.family: Config.font.family.mono
        text: TimeService.format("󰥔 hh:mm")
        color: ColorsHellwal.foreground
    }

    Text {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: clock.bottom
        font.family: Config.font.family.mono
        text: TimeService.format("󰃭 ddd d. MMM yyyy")
        color: ColorsHellwal.foreground
    }
}
