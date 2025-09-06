import QtQuick
import Quickshell.Io
import Quickshell.Services.Pipewire
import "../util"

Rectangle {
    readonly property Process process: Process {
        command: ["wpctl", "set-mute", "@DEFAULT_AUDIO_SOURCE@", "toggle"]
    }

    PwObjectTracker {
        objects: [ Pipewire.defaultAudioSource ]
    }

    id: root
    implicitWidth: 32
    implicitHeight: 32
    radius: 16
    color: !Pipewire.defaultAudioSource?.audio.muted  || mouse.containsMouse  ? Colors.color10 : Colors.color2

    Icon {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        icon: Pipewire.defaultAudioSource?.audio.muted ? "mic_off" : "mic"
    }

    MouseArea {
        id: mouse
        hoverEnabled: true
        anchors.fill: parent
        acceptedButtons: Qt.LeftButton
        onClicked: () => root.process.startDetached();
    }
}
