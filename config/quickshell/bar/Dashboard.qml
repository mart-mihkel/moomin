import QtQuick
import "../util"
import "../dashboard"

Column {
    // TODO: false by default
    property bool show: true

    id: root

    Icon {
        icon: "tune"

        MouseArea {
            anchors.fill: parent
            onClicked: () => root.show = !root.show;
        }
    }

    Dashboard { show: root.show }
}
