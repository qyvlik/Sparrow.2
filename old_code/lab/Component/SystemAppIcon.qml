import QtQuick 2.0

import Sparrow 2.0
import Sparrow.Private 2.0


Container {
    id: systemAppIcon

    implicitWidth: dp * 48
    implicitHeight: dp * 48
    clip: false
    glow.elevation: 1
    glow.color: "black"

    //property Item systemScreen
    signal clicked()

    property alias source: icon.source
    default property SystemApp systemApp

//    Binding {
//        target: systemApp
//        property: "systemScreen"
//        value: systemAppIcon.systemScreen
//    }

    Rectangle {
        anchors.fill: parent
        color: "green"
        MouseArea {
            anchors.fill: parent
            onPressed: {
                systemAppIcon.glow.elevation = 2
            }
            onReleased: {
                systemAppIcon.glow.elevation = 1
            }
            onExited: {
                systemAppIcon.glow.elevation = 1
            }
            onClicked: systemAppIcon.clicked();
        }
    }

    Image {
        id: icon
        anchors.fill: parent
    }

}

