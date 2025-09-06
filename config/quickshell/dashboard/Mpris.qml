import QtQuick
import QtQuick.Effects
import QtQuick.Layouts
import Quickshell.Services.Mpris
import "../util"

Rectangle {
    id: root
    radius: 8
    color: Colors.color8

    readonly property list<MprisPlayer> players: Mpris.players.values
    readonly property MprisPlayer player: players[0] ?? null

    function lengthStr(length: int): string {
        if (length < 0) {
            return "0:00";
        }

        const hours = Math.floor(length / 3600);
        const mins = Math.floor((length % 3600) / 60);
        const secs = Math.floor(length % 60).toString().padStart(2, "0");

        if (hours > 0) {
            return `${hours}:${mins.toString().padStart(2, "0")}:${secs}`;
        }

        return `${mins}:${secs}`;
    }

    Timer {
        repeat: true
        interval: 1000
        running: player?.isPlaying ?? false
        onTriggered: player?.positionChanged()
    }

    RowLayout {
        anchors {
            fill: parent
            topMargin: 8
            leftMargin: 8
            rightMargin: 8
            bottomMargin: 8
        }

        spacing: 0

        Rectangle {
            implicitWidth: parent.width / 3
            implicitHeight: parent.heigth * 1
            radius: 8
            color: "transparent"

            Image {
                id: image
                visible: false
                asynchronous: true
                anchors.left: parent.left
                source: player?.trackArtUrl ?? ""
                width: Math.min(parent.height, parent.width)
                height: Math.min(parent.height, parent.width)
            }

            MultiEffect {
                source: image
                maskSource: mask
                maskEnabled: true
                anchors.fill: image
            }

            Rectangle {
                width: image.width
                height: image.height
                radius: 8
                visible: player?.trackArtUrl == null
                color: Colors.color2
            }

            Item {
                id: mask
                visible: false
                width: image.width
                height: image.height
                layer.enabled: true

                Rectangle {
                    width: image.width
                    height: image.height
                    radius: 8
                }
            }
        }

        Column {
            spacing: 8
            Layout.fillWidth: true

            Text {
                font {
                    bold: true
                    family: Config.font.family.mono
                }

                text: player?.trackTitle || "~"
                width: parent.width
                elide: Text.ElideRight
                Layout.columnSpan: 2
                color: Colors.foreground
            }

            Text {
                font {
                    family: Config.font.family.mono
                    pointSize: 8
                }

                text: player?.trackArtist || "~"
                width: parent.width
                elide: Text.ElideRight
                color: Colors.foreground
            }

            RowLayout {
                width: parent.width

                Text {
                    text: root.lengthStr(player?.position)
                    font.family: Config.font.family.mono
                    color: Colors.foreground
                }

                Rectangle {
                    Layout.fillWidth: true
                    implicitHeight: 8
                    radius: 16
                    color: Colors.color2

                    Rectangle {
                        anchors {
                            top: parent.top
                            left: parent.left
                            bottom: parent.bottom
                        }

                        implicitWidth: parent.width * (player?.position / player?.length)
                        radius: parent.radius
                        color: Colors.color10
                    }
                }

                Text {
                    text: root.lengthStr(player?.length)
                    font.family: Config.font.family.mono
                    color: Colors.foreground
                }
            }
        }
    }
}
