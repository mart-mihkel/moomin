pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    readonly property Font font: Font {}

    component Font: JsonObject {
        readonly property FontFamily family: FontFamily {}
    }

    component FontFamily: JsonObject {
        readonly property string mono: "JetBrainsMono NF"
        readonly property string material: "Material Symbols Rounded"
    }

}
