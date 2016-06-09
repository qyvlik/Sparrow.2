import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 3.0

MultiLayer {

    clip: true

    backgroundComponent : Rectangle { color: "#3e3e3e" }

    contentComponent: MainPage {

    }

    overlayerComponent: Drawerlayer {
        id: drawerlayer
        drawerComponent: Rectangle {
            color: "#3e3e3e"
        }
    }

} // multilayer

