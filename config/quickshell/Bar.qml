import Quickshell
import Quickshell.Io
import Quickshell.Hyprland
import QtQuick
import QtQuick.Layouts

Scope {
    id: root

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData
            color: "transparent"
            implicitWidth: 16
            anchors {
                top: true
                left: true
                bottom: true
            }

            ColumnLayout {
                anchors.fill: parent
                spacing: 16

                Column {
                    MaterialIcon { text: "home" }
                    Repeater {
                        id: workspaces
                        model: 10
                        Text {
                            required property int index
                            text: index + 1 == Hyprland.focusedWorkspace.id ? "o" : "."
                            font.family: Config.font.family.mono
                            anchors.horizontalCenter: parent.horizontalCenter
                        }
                    }
                }

                Item { Layout.fillHeight: enabled }

                Text {
                    id: text
                    text: Hyprland.activeToplevel?.wayland?.title ?? "Desktop"
                    font.family: Config.font.family.mono
                    transform: Rotation {
                        angle: 90
                        origin.x: text.implicitHeight / 2
                        origin.y: text.implicitHeight / 2
                    }
                }

                Item { Layout.fillHeight: enabled }

                Column {
                    MaterialIcon { text: "wifi" }
                    MaterialIcon { text: "bluetooth" }
                    MaterialIcon { text: "energy_savings_leaf" }
                }

                Column {
                    MaterialIcon { text: "volume_up" }
                    MaterialIcon { text: "brightness_empty" }
                }

                Column {
                    MaterialIcon { text: "calendar_clock" }
                    Text {
                        text: Time.format("hh\nmm")
                        font.family: Config.font.family.mono
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                }

                MaterialIcon { text: "power_settings_new" }
            }
        }
    }
}
