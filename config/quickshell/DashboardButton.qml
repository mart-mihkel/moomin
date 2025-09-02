import QtQuick
import Quickshell.Io

Rectangle {
    required property string icon

    id: root
    implicitWidth: 32
    implicitHeight: 32
    radius: 16
    color: mouse.hovered ? ColorsHellwal.color11 : ColorsHellwal.color3

    MaterialIcon {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        text: root.icon
    }

    HoverHandler {
        id: mouse
        acceptedDevices: PointerDevice.Mouse | PointerDevice.TouchPad
        cursorShape: Qt.PointingHandCursor
    }
}
