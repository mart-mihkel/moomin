import QtQuick

Column {
    // TODO: false by default
    property bool show: true

    id: root

    MaterialIcon {
        text: "tune"

        MouseArea {
            anchors.fill: parent
            onClicked: () => root.show = true;
        }
    }

    Dashboard { show: root.show }
}
