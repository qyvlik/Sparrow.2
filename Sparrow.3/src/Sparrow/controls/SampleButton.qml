import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import Sparrow 3.0

Button {
    id: button

    implicitWidth: 88 * dp
    implicitHeight: 36 * dp

    property real raduis: 1 * dp
    property color backgroundColor: "white"
    property color textColor: "black"
    property font textFont

    style: ButtonStyle {

        padding {
            left: 0
            right: 0
            top: 0
            bottom: 0
        }

        background: Rectangle {

            width: button.width
            height: button.height
            radius: button.raduis
            color: button.backgroundColor

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                Connections {
                    target: control.__behavior
                    onPressed: mouseArea.onPressed(mouse)
                    onCanceled: mouseArea.onCanceled()
                    onReleased: mouseArea.onReleased(mouse)
                    onExited: mouseArea.exited()
                }
                Ripple { }
            }

        }
        label: Item {
            width: button.implicitWidth
            height: button.implicitHeight
            Text {
                width: button.implicitWidth
                elide: Text.ElideRight
                text: button.text
                color: button.textColor
                font: button.textFont
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                anchors.centerIn: parent
            }
        }
    }



}

