import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland

Column {
    // TODO: find actual moomin icon
    MaterialIcon { text: "image" }
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
}
