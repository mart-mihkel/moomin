import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.columnSpan: 3
    implicitWidth: parent.width
    implicitHeight: parent.heigth / 8 - 8/2
    radius: 8
    color: "transparent"

    ColumnLayout {
        anchors {
            fill: parent
            topMargin: 4
            leftMargin: 4
            rightMargin: 4
            bottomMargin: 4
        }

        RowLayout {
            implicitWidth: parent.width
            implicitHeight: parent.heigth / 2

            MaterialIcon {
                text: "volume_up"
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 8
                color: ColorsHellwal.color9

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: 40
                    radius: parent.radius
                    color: ColorsHellwal.color3
                }
            }
        }

        RowLayout {
            implicitWidth: parent.width
            implicitHeight: parent.heigth / 2

            MaterialIcon {
                text: "brightness_7"
                anchors.verticalCenter: parent.verticalCenter
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 8
                color: ColorsHellwal.color9

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: 10
                    radius: parent.radius
                    color: ColorsHellwal.color3
                }
            }
        }
    }
}
