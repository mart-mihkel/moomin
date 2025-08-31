pragma Singleton

import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property Font font: Font {}

    component Font: JsonObject {
        property FontFamily family: FontFamily {}
    }

    component FontFamily: JsonObject {
        property string mono: "JetBrainsMono NF"
        property string material: "Material Symbols Rounded"
    }
}
