import QtQuick

Text {
    text: TimeService.format("hh\nmm")
    font.family: Config.font.family.mono
    anchors.horizontalCenter: parent.horizontalCenter
}
