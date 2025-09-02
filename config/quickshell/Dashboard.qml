import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell

Scope {
    required property bool show

    id: root

    LazyLoader {
        active: root.show

        PanelWindow {
            anchors {
                left: true
            }

            exclusiveZone: 0
            implicitWidth: 300
            implicitHeight: 400
            color: "transparent"

            RectangularShadow {
                anchors.fill: dashboardRect
                color: ColorsHellwal.foreground
            }

            Rectangle {
                anchors {
                    fill: parent
                    topMargin: 8
                    leftMargin: 8
                    rightMargin: 8
                    bottomMargin: 8
                }

                id: dashboardRect
                radius: 8
                color: ColorsHellwal.background

                GridLayout {
                    anchors {
                        fill: parent
                        topMargin: 8
                        leftMargin: 8
                        rightMargin: 8
                        bottomMargin: 8
                    }

                    rows: 4
                    columns: 3
                    rowSpacing: 8
                    columnSpacing: 8

                    // date time
                    Rectangle {
                        Layout.columnSpan: 2
                        implicitWidth: parent.width * 2 / 3 - 8/2
                        implicitHeight: parent.heigth / 4
                        radius: 8
                        color: ColorsHellwal.color9

                        Text {
                            id: clock
                            anchors.horizontalCenter: parent.horizontalCenter
                            y: 10 // TODO: un-hardcode
                            font.pointSize: 24
                            font.family: Config.font.family.mono
                            text: TimeService.format("hh:mm")
                            color: ColorsHellwal.foreground
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: clock.bottom
                            font.family: Config.font.family.mono
                            text: TimeService.format("ddd d. MMM yyyy")
                            color: ColorsHellwal.foreground
                        }
                    }

                    // wifi bluetooth mic powermode
                    Rectangle {
                        implicitWidth: parent.width / 3 - 8/2
                        implicitHeight: parent.heigth / 4
                        radius: 8
                        color: ColorsHellwal.color9

                        GridLayout {
                            anchors {
                                fill: parent
                                topMargin: 8
                                leftMargin: 8
                                rightMargin: 8
                                bottomMargin: 8
                            }

                            rows: 2
                            columns: 2

                            DashboardButton { icon: "wifi" }
                            DashboardButton { icon: "bluetooth" }
                            DashboardButton { icon: "mic" }
                            DashboardButton { icon: "balance" }
                        }
                    }

                    // volume backlight
                    Rectangle {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 8 - 8/2
                        radius: 8
                        color: "transparent"

                        ColumnLayout {
                            anchors {
                                fill: parent
                                topMargin: 4
                                leftMargin: 4
                                rightMargin: 4
                                bottomMargin: 4
                            }

                            RowLayout {
                                implicitWidth: parent.width
                                implicitHeight: parent.heigth / 2

                                MaterialIcon {
                                    text: "volume_up"
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: 8
                                    radius: 8
                                    color: ColorsHellwal.color9

                                    Rectangle {
                                        anchors {
                                            top: parent.top
                                            left: parent.left
                                            bottom: parent.bottom
                                        }

                                        implicitWidth: 40
                                        radius: parent.radius
                                        color: ColorsHellwal.color3
                                    }
                                }
                            }

                            RowLayout {
                                implicitWidth: parent.width
                                implicitHeight: parent.heigth / 2

                                MaterialIcon {
                                    text: "brightness_7"
                                    anchors.verticalCenter: parent.verticalCenter
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: 8
                                    radius: 8
                                    color: ColorsHellwal.color9

                                    Rectangle {
                                        anchors {
                                            top: parent.top
                                            left: parent.left
                                            bottom: parent.bottom
                                        }

                                        implicitWidth: 10
                                        radius: parent.radius
                                        color: ColorsHellwal.color3
                                    }
                                }
                            }
                        }
                    }

                    // mpris
                    Rectangle {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 4
                        radius: 8
                        color: ColorsHellwal.color9

                        GridLayout {
                            anchors {
                                fill: parent
                                topMargin: 4
                                leftMargin: 4
                                rightMargin: 4
                                bottomMargin: 4
                            }

                            rowSpacing: 4
                            columnSpacing: 4
                            rows: 3
                            columns: 3

                            Rectangle {
                                Layout.rowSpan: 3
                                implicitWidth: parent.width / 3 - 2
                                implicitHeight: parent.heigth / 1
                                radius: 8
                                color: ColorsHellwal.color3
                            }

                            RowLayout {
                                Layout.columnSpan: 2
                                implicitWidth: parent.width * 2 / 3 - 2

                                Text {
                                    text: "Tiffer"
                                    font.family: Config.font.family.mono
                                    font.pointSize: 12
                                    color: ColorsHellwal.foreground
                                }
                            }

                            RowLayout {
                                Layout.columnSpan: 2
                                implicitWidth: parent.width * 2 / 3 - 2

                                Text {
                                    text: "Ursula"
                                    font.family: Config.font.family.mono
                                    color: ColorsHellwal.foreground
                                }

                                Row { Layout.fillWidth: true }

                                MaterialIcon {
                                    text: "keyboard_double_arrow_left"
                                    color: ColorsHellwal.foreground
                                }

                                MaterialIcon {
                                    text: "resume"
                                    color: ColorsHellwal.foreground
                                }

                                MaterialIcon {
                                    text: "keyboard_double_arrow_right"
                                    color: ColorsHellwal.foreground
                                }
                            }

                            RowLayout {
                                Layout.columnSpan: 2
                                implicitWidth: parent.width * 2 / 3 - 2

                                Text {
                                    text: "1:21"
                                    font.family: Config.font.family.mono
                                    color: ColorsHellwal.foreground
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: 8
                                    radius: 16
                                    color: ColorsHellwal.color3

                                    Rectangle {
                                        anchors {
                                            top: parent.top
                                            left: parent.left
                                            bottom: parent.bottom
                                        }

                                        implicitWidth: 50
                                        radius: parent.radius
                                        color: ColorsHellwal.color10
                                    }
                                }

                                Text {
                                    text: "3:52"
                                    font.family: Config.font.family.mono
                                    color: ColorsHellwal.foreground
                                }
                            }
                        }
                    }

                    // power
                    Rectangle {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 4
                        radius: 8
                        color: ColorsHellwal.color9

                        RowLayout {
                            anchors {
                                fill: parent
                                topMargin: 4
                                leftMargin: 4
                                rightMargin: 4
                                bottomMargin: 4
                            }

                            spacing: 16

                            Row { Layout.fillWidth: true }
                            DashboardButton { icon: "power_settings_new" }
                            DashboardButton { icon: "refresh" }
                            DashboardButton { icon: "sleep" }
                            DashboardButton { icon: "lock" }
                            Row { Layout.fillWidth: true }
                        }
                    }
                }
            }
        }
    }
}
