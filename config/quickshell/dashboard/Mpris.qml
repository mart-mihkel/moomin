import QtQuick
import QtQuick.Layouts
import Quickshell.Services.Mpris
import "../util"

Rectangle {
    id: root
    radius: 8
    color: Colors.color9

    readonly property list<MprisPlayer> players: Mpris.players.values
    readonly property MprisPlayer player: players[0]

    function lengthStr(length: int): string {
        if (length < 0)
            return "-1:-1";

        const hours = Math.floor(length / 3600);
        const mins = Math.floor((length % 3600) / 60);
        const secs = Math.floor(length % 60).toString().padStart(2, "0");

        if (hours > 0) {
            return `${hours}:${mins.toString().padStart(2, "0")}:${secs}`;
        }

        return `${mins}:${secs}`;
    }


    GridLayout {
        anchors {
            fill: parent
            topMargin: 8
            leftMargin: 8
            rightMargin: 8
            bottomMargin: 8
        }

        rowSpacing: 4
        columnSpacing: 8
        rows: 3
        columns: 3

        Rectangle {
            Layout.rowSpan: 4
            implicitWidth: parent.width / 3
            implicitHeight: parent.heigth * 1
            radius: 8
            color: Colors.color3
        }

        Text {
            font {
                bold: true
                pointSize: 12
                family: Config.font.family.mono
            }

            text: player?.trackTitle
            Layout.columnSpan: 2
            color: Colors.foreground
        }

        Text {
            text: player?.trackArtist
            font.family: Config.font.family.mono
            color: Colors.foreground
        }

        RowLayout {
            Layout.columnSpan: 2

            Text {
                text: root.lengthStr(player?.position)
                font.family: Config.font.family.mono
                color: Colors.foreground
            }

            Rectangle {
                Layout.fillWidth: true
                implicitHeight: 8
                radius: 16
                color: Colors.color3

                Rectangle {
                    anchors {
                        top: parent.top
                        left: parent.left
                        bottom: parent.bottom
                    }

                    implicitWidth: parent.width * (player?.position / player?.length)
                    radius: parent.radius
                    color: Colors.color11
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
