import QtQuick
import QtQuick.Layouts
import QtQuick.Effects
import Quickshell

Scope {
    id: root
    property bool show: true
    LazyLoader {
        active: root.show
        PanelWindow {
            anchors {
                left: true
            }

            color: "transparent"
            implicitWidth: 300
            implicitHeight: 400
            exclusiveZone: 0

            RectangularShadow {
                anchors.fill: dashboardRect
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

                GridLayout {
                    anchors {
                        fill: parent
                        topMargin: 8
                        leftMargin: 8
                        rightMargin: 8
                        bottomMargin: 8
                    }

                    rowSpacing: 8
                    columnSpacing: 8
                    rows: 4
                    columns: 3

                    // date time
                    Rectangle {
                        Layout.columnSpan: 2
                        implicitWidth: parent.width * 2 / 3 - 8/2
                        implicitHeight: parent.heigth / 4
                        radius: 8
                        color: "blue"

                        Text {
                            id: clock
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.verticalCenter: parent.verticalCenter
                            font.pointSize: 24
                            text: TimeService.format("hh:mm:ss")
                        }

                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: clock.bottom
                            text: TimeService.format("ddd d. MMM yyyy")
                        }
                    }

                    // wifi bluetooth mic powermode
                    Rectangle {
                        Layout.columnSpan: 1
                        implicitWidth: parent.width / 3 - 8/2
                        implicitHeight: parent.heigth / 4
                        radius: 8
                        color: "black"

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
                            rows: 2
                            columns: 2

                            Rectangle {
                                implicitWidth: parent.width / 2 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "wifi"
                                }
                            }

                            Rectangle {
                                implicitWidth: parent.width / 2 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "bluetooth"
                                }
                            }

                            Rectangle {
                                implicitWidth: parent.width / 2 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "mic"
                                }
                            }

                            Rectangle {
                                implicitWidth: parent.width / 2 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "balance"
                                }
                            }
                        }
                    }

                    // volume backlight
                    Rectangle {
                        Layout.columnSpan: 3
                        implicitWidth: parent.width
                        implicitHeight: parent.heigth / 8 - 8/2
                        radius: 8
                        color: "blue"

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

                                MaterialIcon { text: "volume_up" }
                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: 8
                                    radius: 8
                                    color: "black"

                                    Rectangle {
                                        anchors {
                                            top: parent.top
                                            left: parent.left
                                            bottom: parent.bottom
                                        }

                                        implicitWidth: 40
                                        radius: parent.radius
                                    }
                                }
                            }

                            RowLayout {
                                implicitWidth: parent.width
                                implicitHeight: parent.heigth / 2

                                MaterialIcon { text: "brightness_7" }
                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: 8
                                    radius: 8
                                    color: "black"

                                    Rectangle {
                                        anchors {
                                            top: parent.top
                                            left: parent.left
                                            bottom: parent.bottom
                                        }

                                        implicitWidth: 10
                                        radius: parent.radius
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
                        color: "black"

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
                                color: "blue"
                            }

                            RowLayout {
                                Layout.columnSpan: 2
                                implicitWidth: parent.width * 2 / 3 - 2

                                Text {
                                    text: "Peegelpõrand - Winny Puhh"
                                    color: "white"
                                }
                            }

                            RowLayout {
                                Layout.columnSpan: 2
                                implicitWidth: parent.width * 2 / 3 - 2

                                Text {
                                    text: "1:21"
                                    color: "white"
                                }

                                Rectangle {
                                    Layout.fillWidth: true
                                    implicitHeight: 8
                                    radius: 16
                                }

                                Text {
                                    text: "3:52"
                                    color: "white"
                                }
                            }

                            RowLayout {
                                Layout.columnSpan: 2
                                implicitWidth: parent.width * 2 / 3 - 2

                                MaterialIcon {
                                    text: "keyboard_double_arrow_left"
                                    color:"white"
                                }

                                MaterialIcon {
                                    text: "resume"
                                    color:"white"
                                }

                                MaterialIcon {
                                    text: "keyboard_double_arrow_right"
                                    color:"white"
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
                        color: "black"

                        RowLayout {
                            anchors {
                                fill: parent
                                topMargin: 4
                                leftMargin: 4
                                rightMargin: 4
                                bottomMargin: 4
                            }

                            Rectangle {
                                implicitWidth: parent.width / 4 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "power"
                                }
                            }

                            Rectangle {
                                implicitWidth: parent.width / 4 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "refresh"
                                }
                            }

                            Rectangle {
                                implicitWidth: parent.width / 4 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "sleep"
                                }
                            }

                            Rectangle {
                                implicitWidth: parent.width / 4 - 4
                                implicitHeight: parent.heigth / 2
                                radius: 16
                                color: "blue"
                                MaterialIcon {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "lock"
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}
