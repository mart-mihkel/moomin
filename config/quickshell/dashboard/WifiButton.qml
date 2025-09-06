import QtQuick
import Quickshell.Io
import "../services"
import "../util"

Rectangle {
    readonly property string icon: "wifi"
    readonly property string command: "exit"

    id: root
    implicitWidth: 32
    implicitHeight: 32
    radius: 16
    color: Network.wifiEnabled || mouse.containsMouse  ? Colors.color10 : Colors.color2

    Icon {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        icon: root.icon
    }

    MouseArea {
        id: mouse
        hoverEnabled: true
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: () => Network.enableWifi(!Network.wifiEnabled);
    }
}
