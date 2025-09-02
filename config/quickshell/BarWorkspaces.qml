import QtQuick
import Quickshell.Hyprland

Repeater {
    model: 5
    Text {
        required property int index
        text: index + 1 == Hyprland.focusedWorkspace?.id ? "adjust" : "circle"
        font.family: Config.font.family.material
        anchors.horizontalCenter: parent.horizontalCenter
        color: ColorsHellwal.foreground
    }
}
