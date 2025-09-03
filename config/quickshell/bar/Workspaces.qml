import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import "../util"

Column {
    // TODO: find actual moomin icon
    Icon { icon: "image" }
    Repeater {
        model: 5
        Text {
            required property int index
            text: index + 1 == Hyprland.focusedWorkspace?.id ? "adjust" : "circle"
            font.family: Config.font.family.material
            anchors.horizontalCenter: parent.horizontalCenter
            color: Colors.foreground
        }
    }
}
