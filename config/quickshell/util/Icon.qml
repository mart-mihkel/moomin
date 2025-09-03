import QtQuick

Text {
    required property string icon

    font {
        pointSize: 12
        family: Config.font.family.material
    }

    color: Colors.foreground
    text: icon
}
