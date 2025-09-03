import QtQuick
import QtQuick.Layouts

Rectangle {
    radius: 8
    color: ColorsHellwal.color9

    RowLayout {
        anchors.fill: parent
        spacing: 16

        Row { Layout.fillWidth: true }

        DashboardButton {
            icon: "power_settings_new"
            command: "shutdown now"
        }

        DashboardButton {
            icon: "refresh"
            command: "reboot"
        }

        DashboardButton {
            icon: "sleep"
            command: "systemctl suspend"
        }

        DashboardButton {
            icon: "lock"
            command: "hyprlock"
        }

        Row { Layout.fillWidth: true }
    }
}
