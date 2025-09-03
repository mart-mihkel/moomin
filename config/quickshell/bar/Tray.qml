import QtQuick
import Quickshell.Widgets
import Quickshell.Services.SystemTray
import "../util"

Column {
    readonly property list<SystemTrayItem> items: SystemTray.items.values
    id: root

    Icon { icon: "backup_table" }
    Repeater {
        model: root.items
        IconImage {
            source: modelData.icon
        }
    }
}
