import QtQuick
import QtQuick.Layouts
import "../util"

Rectangle {
    radius: 8
    color: Colors.color8

    RowLayout {
        anchors.fill: parent
        spacing: 16

        Row { Layout.fillWidth: true }

        Button {
            icon: "power_settings_new"
            command: "shutdown now"
        }

        Button {
            icon: "refresh"
            command: "reboot"
        }

        Button {
            icon: "sleep"
            command: "systemctl suspend"
        }

        Button {
            icon: "lock"
            command: "hyprlock"
        }

        Row { Layout.fillWidth: true }
    }
}
