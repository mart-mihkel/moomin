import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.columnSpan: 3
    implicitWidth: parent.width
    implicitHeight: parent.heigth / 4
    radius: 8
    color: ColorsHellwal.color9

    RowLayout {
        anchors {
            fill: parent
            topMargin: 4
            leftMargin: 4
            rightMargin: 4
            bottomMargin: 4
        }

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
