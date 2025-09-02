import QtQuick
import QtQuick.Layouts

Rectangle {
    Layout.columnSpan: 3
    implicitWidth: parent.width
    implicitHeight: parent.heigth / 4
    radius: 8
    color: ColorsHellwal.color9

    GridLayout {
        anchors {
            fill: parent
            topMargin: 4
            leftMargin: 4
            rightMargin: 4
            bottomMargin: 4
        }

        rowSpacing: 4
        columnSpacing: 4
        rows: 3
        columns: 3

        Rectangle {
            Layout.rowSpan: 3
            implicitWidth: parent.width / 3 - 2
            implicitHeight: parent.heigth / 1
            radius: 8
            color: ColorsHellwal.color3
        }

        RowLayout {
            Layout.columnSpan: 2
            implicitWidth: parent.width * 2 / 3 - 2

            Text {
                text: "Tiffer"
                font.family: Config.font.family.mono
                font.pointSize: 12
                color: ColorsHellwal.foreground
            }
        }

        RowLayout {
            Layout.columnSpan: 2
            implicitWidth: parent.width * 2 / 3 - 2

            Text {
                text: "Ursula"
                font.family: Config.font.family.mono
                color: ColorsHellwal.foreground
            }

            Row { Layout.fillWidth: true }

            MaterialIcon {
                text: "keyboard_double_arrow_left"
                color: ColorsHellwal.foreground
            }

            MaterialIcon {
                text: "resume"
                color: ColorsHellwal.foreground
            }

            MaterialIcon {
                text: "keyboard_double_arrow_right"
                color: ColorsHellwal.foreground
            }
        }

        RowLayout {
            Layout.columnSpan: 2
            implicitWidth: parent.width * 2 / 3 - 2

            Text {
                text: "1:21"
                font.family: Config.font.family.mono
                color: ColorsHellwal.foreground
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 16
                color: ColorsHellwal.color3

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: 50
                    radius: parent.radius
                    color: ColorsHellwal.color10
                }
            }

            Text {
                text: "3:52"
                font.family: Config.font.family.mono
                color: ColorsHellwal.foreground
            }
        }
    }
}
