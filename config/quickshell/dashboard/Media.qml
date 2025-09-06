import QtQuick
import QtQuick.Layouts
import "../util"

Rectangle {
    radius: 8
    color: Colors.color8

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

        WifiButton {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Button {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon: "bluetooth"
        }

        MicButton {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
        }

        Button {
            Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            icon: "balance"
        }
    }
}
