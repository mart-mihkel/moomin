import QtQuick
import Quickshell.Io
import "../util"

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
    color: mouse.containsMouse ? Colors.color11 : Colors.color3

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
        onClicked: () => root.process.startDetached();
    }
}
