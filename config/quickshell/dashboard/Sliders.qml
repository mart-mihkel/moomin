import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Pipewire
import "../util"

Rectangle {
    radius: 8
    color: Colors.color8

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSink ]
    }

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

            Icon {
                icon: "volume_up"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 8
                color: Colors.color2

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: parent.width * (Pipewire.defaultAudioSink?.audio.volume ?? 0)
                    radius: parent.radius
                    color: Colors.color10
                }
            }
        }

        RowLayout {
            implicitWidth: parent.width
            implicitHeight: parent.heigth / 2

            Icon {
                icon: "brightness_7"
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 8
                color: Colors.color2

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: parent.width * 0.75
                    radius: parent.radius
                    color: Colors.color10
                }
            }
        }
    }
}
