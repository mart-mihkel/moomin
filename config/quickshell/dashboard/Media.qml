import QtQuick
import QtQuick.Layouts
import "../util"

Rectangle {
    radius: 8
    color: Colors.color9

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

        Button {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon: "wifi"
        }

        Button {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon: "bluetooth"
        }

        Button {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon: "mic"
        }

        Button {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon: "balance"
        }
    }
}
