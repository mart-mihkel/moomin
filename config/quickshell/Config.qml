pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    readonly property Font font: Font {}
    readonly property Margin margin: Margin {}

    component Font: JsonObject {
        readonly property FontFamily family: FontFamily {}
    }

    component FontFamily: JsonObject {
        readonly property string mono: "JetBrainsMono NF"
        readonly property string material: "Material Symbols Rounded"
    }

    component Margin: JsonObject {
        readonly property int sm: 4
        readonly property int md: 8
    }
}
