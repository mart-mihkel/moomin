import QtQuick
import QtQuick.Layouts

Rectangle {
    implicitWidth: parent.width / 3 - 8/2
    implicitHeight: parent.heigth / 4
    radius: 8
    color: ColorsHellwal.color9

    GridLayout {
        anchors {
            fill: parent
            topMargin: 8
            leftMargin: 8
            rightMargin: 8
            bottomMargin: 8
        }

        rows: 2
        columns: 2

        DashboardButton { icon: "wifi" }
        DashboardButton { icon: "bluetooth" }
        DashboardButton { icon: "mic" }
        DashboardButton { icon: "balance" }
    }
}
