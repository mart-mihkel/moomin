import Quickshell.Hyprland
import QtQuick


Column {
    MaterialIcon { text: "image" }
    Repeater {
        model: 5
        Text {
            required property int index
            text: index + 1 == Hyprland.focusedWorkspace?.id ? "adjust" : "circle"
            font.family: Config.font.family.material
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}
