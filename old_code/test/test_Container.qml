import QtQuick 2.0

import Sparrow.Private 2.0

Container {
    width: dp * 360
    height: dp * 640
    glow.visible: false

    Container {
        id: container2

        implicitHeight: dp * 100
        implicitWidth: dp * 100
        glow.elevation: 1
        glow.color: "black"
        anchors.centerIn: parent

        Rectangle {
            anchors.fill: parent
            color: "green"
            MouseArea {
                anchors.fill: parent
                onPressed: {
                    container2.glow.elevation = 2
                }
                onReleased: {
                    container2.glow.elevation = 1
                }
            }
        }
    }
}

