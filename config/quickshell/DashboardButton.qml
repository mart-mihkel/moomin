import QtQuick
import Quickshell.Io

Rectangle {
    required property string icon
    property string command: "exit"
    readonly property var process: Process {
        command: ["sh", "-c", root.command]
    }

    id: root
    implicitWidth: 32
    implicitHeight: 32
    radius: 16
    color: mouse.containsMouse ? ColorsHellwal.color11 : ColorsHellwal.color3

    MaterialIcon {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: root.icon
    }

    MouseArea {
        id: mouse
        hoverEnabled: true
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: () => root.process.startDetached();
    }
}
