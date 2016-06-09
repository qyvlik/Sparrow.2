//! code from

import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

import Sparrow 3.0

CheckBox {
    id: checkBox

    /*!
       The checkbox color. By default this is the app's accent color
     */
    property color color: "#2196f3"

    property real indicatorLength: 36 * dp
    property real indicatorRectLength: 16 * dp
    property real indicatorRectRadius: 2 * dp
    property real rippleRadius: indicatorRectLength

    property font textFont
    textFont.pixelSize: 14

    property color textColor: enabled ? darkBackground ? "#ffffff"
                                                       : "#d8000000"
                                                       : darkBackground ? "#4cffffff"
                                                       : "#42000000"
    property bool darkBackground


    style: CheckBoxStyle {
        id: checkboxStyle

        spacing: 2 * dp

        label: Item {
            implicitWidth: text.implicitWidth + 2
            implicitHeight: text.implicitHeight

            baselineOffset: text.baselineOffset

            Label {
                id: text
                anchors.centerIn: parent
                color: textColor
                text: control.text
                font: textFont
            }
        }

        indicator: Item {
            id: parentRect

            implicitWidth: indicatorLength
            implicitHeight: indicatorLength

            Rectangle {
                id: indicatorRect

                anchors.centerIn: parent

                property color __internalColor: control.enabled ? control.color
                                                                : control.darkBackground ? "#4cffffff"
                                                                                         : "#42000000"

                width: indicatorRectLength
                height: indicatorRectLength
                radius: indicatorRectRadius

                border.width: indicatorRectRadius

                border.color: control.enabled ? control.checked ? control.color
                                                                : control.darkBackground ? "#b2ffffff"
                                                                                         : "#89000000"
                                              : control.darkBackground ? "#4cffffff"
                                                                       : "#42000000"

                color: control.checked ? __internalColor : "transparent"

                Behavior on color {
                    ColorAnimation {
                        easing.type: Easing.InOutQuad
                        duration: 200
                    }
                }

                Behavior on border.color {
                    ColorAnimation {
                        easing.type: Easing.InOutQuad
                        duration: 200
                    }
                }

                Item {
                    id: container

                    anchors.centerIn: indicatorRect

                    height: parent.height
                    width: parent.width

                    opacity: control.checked ? 1 : 0

                    property int thickness: 4 * dp

                    Behavior on opacity {
                        NumberAnimation {
                            easing.type: Easing.InOutQuad
                            duration: 200
                        }
                    }

                    Rectangle {
                        id: vert

                        anchors {
                            top: parent.top
                            right: parent.right
                            bottom: parent.bottom
                        }

                        radius: (1)
                        color: control.darkBackground ? "#d8000000" : "#ffffff"
                        width: container.thickness * 2

                    }
                    Rectangle {
                        anchors {
                            left: parent.left
                            right: vert.left
                            bottom: parent.bottom
                        }

                        radius: (1)
                        color: control.darkBackground ? "#d8000000" : "#ffffff"
                        height: container.thickness
                    }

                    transform: [
                        Scale {
                            origin { x: container.width / 2; y: container.height / 2 }
                            xScale: 0.5
                            yScale: 1
                        },
                        Rotation {
                            origin { x: container.width / 2; y: container.height / 2 }
                            angle: 45;
                        },
                        Scale {
                            id: widthScale

                            origin { x: container.width / 2; y: container.height / 2 }
                            xScale: control.checked ? 0.6 : 0.2
                            yScale: control.checked ? 0.6 : 0.2

                            Behavior on xScale {
                                NumberAnimation {
                                    easing.type: Easing.InOutQuad
                                    duration: 200
                                }
                            }

                            Behavior on yScale {
                                NumberAnimation {
                                    easing.type: Easing.InOutQuad
                                    duration: 200
                                }
                            }
                        },
                        Translate { y: -(container.height - (container.height * 0.9)) }
                    ]
                }
            }
        }
    }

    MouseArea {
        id: mouseArea
        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: (indicatorLength-rippleRadius * 2)/2

        }

        Item {
            anchors.fill: parent
            Ripple {
                id: ripple
                maxRadius: rippleRadius
                Connections {
                    target: mouseArea
                    ignoreUnknownSignals: true

                    onPressed: {
                        ripple.start(Qt.point(mouseArea.width/2, mouseArea.height/2));
                    }

                    onReleased: {
                       ripple.stop();
                    }

                    onExited: {
                        ripple.stop();
                    }

                    onCanceled: {
                        ripple.stop();
                    }
                }
            }
        }


        width: rippleRadius * 2
        height: rippleRadius * 2

        enabled: checkBox.enabled



        onClicked: {
            checkBox.checked = !checkBox.checked
            checkBox.clicked();
        }
    }
}
