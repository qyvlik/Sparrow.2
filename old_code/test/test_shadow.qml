import QtQuick 2.0
import QtGraphicalEffects 1.0

Rectangle {
    width: 180
    height: 100

    Row {
        anchors.centerIn: parent
        spacing: 16

        Rectangle {
            id: normalRect
            width: 60
            height: 60
            color: "#444"

            layer.enabled: true

            layer.effect: DropShadow {
                radius: 4
                samples: radius * 2
                source: normalRect
                color: Qt.rgba(0, 0, 0, 0.5)
            }
        }

        Rectangle {
            id: transparentBorderRect
            width: 60
            height: 60
            color: "#444"

            layer.enabled: true

            layer.effect: DropShadow {
                radius: 4
                samples: radius * 2
                source: transparentBorderRect
                color: Qt.rgba(0, 0, 0, 0.5)
                transparentBorder: true
            }
        }
    }
}
