import QtQuick
import QtQuick.Layouts

Rectangle {
    radius: 8
    color: ColorsHellwal.color9

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 16
            leftMargin: 32
            rightMargin: 32
            bottomMargin: 16
        }

        RowLayout {
            implicitWidth: parent.width
            implicitHeight: parent.heigth / 2

            MaterialIcon {
                text: "volume_up"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 8
                color: ColorsHellwal.color3

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: parent.width * 0.5
                    radius: parent.radius
                    color: ColorsHellwal.color11
                }
            }
        }

        RowLayout {
            implicitWidth: parent.width
            implicitHeight: parent.heigth / 2

            MaterialIcon {
                text: "brightness_7"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 8
                color: ColorsHellwal.color3

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: parent.width * 0.75
                    radius: parent.radius
                    color: ColorsHellwal.color11
                }
            }
        }
    }
}
