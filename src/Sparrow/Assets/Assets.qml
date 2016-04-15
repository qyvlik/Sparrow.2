pragma Singleton

import QtQuick 2.0

QtObject {
    id: asserts
    objectName: "Sparrow.Assets.Assets 2.0"

    readonly property
    url fontawesome_webfont_ttf : Qt.resolvedUrl("./font/fontawesome-webfont.ttf")

    readonly property
    url test_pic: Qt.resolvedUrl("../../001/tSTAY_0097F592_0022.jpg")
}

