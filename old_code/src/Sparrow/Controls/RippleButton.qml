import QtQuick 2.5
import QtGraphicalEffects 1.0

import Sparrow 2.0
import Sparrow.Private 2.0
import Sparrow.Theme 2.0

Container {
    id: button
    objectName: "Sparrow.Controls.RippleButton 2.0"

    property alias text: buttonText.text
    property string icon

    property alias textColor: buttonText.color
    property alias font: buttonText.font
    property alias textPointSize: buttonText.font.pointSize
    property alias backgroundColor: background.color
    property alias glowEffectEnable: effect.visible

    width: 88 * dp
    height: 48 * dp

    padding.margins:  dp * button.shadowLength

    Accessible.role: Accessible.Button

    signal clicked()

    property alias pressed: mouseArea.pressed
    property real shadowLength : 3
    property real radius: 2


    background: Item {
        anchors.fill: parent

        Rectangle {
            id: background
            color: "#1abc9c"
            //color:  Theme.rippleButtonTheme.backgroundColor
            anchors.fill: parent
            radius: dp * button.radius
            anchors.margins:  dp * button.shadowLength
        }

        RectangularGlow {
            id: effect
            anchors.fill: background
            glowRadius: dp * 5
            spread: 0.2
            color: background.color
            cornerRadius: background.radius + glowRadius
        }

    }

    Connections {
        target: mouseArea
        onClicked: button.clicked()
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent

        Text {
            //! 设置 font.family
            text: icon
            font.family: FontAwesome.family
            //! TODO
            font.pointSize: button.dp * 12 > 0 ? button.dp * 12 : 12
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: dp * 12
            color: buttonText.color
        }

        Text {
            id: buttonText
            color: "black"
            font.family: "微软雅黑"
            //! TODO
            font.pointSize: button.dp * 14 > 0 ? button.dp * 14 : 14
            anchors.centerIn: parent
            text: qsTr("Button")
        }
        Ripple { }
    }
}
