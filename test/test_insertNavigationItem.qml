import QtQuick 2.0

import Sparrow 2.0
import Sparrow.Controls 2.0
import Sparrow.Private 2.0

Navigation {

    id: navigation

    drawer: Drawer { }

    // Don't set Navigation.header
    navigationBar.titleItem: Rectangle {
        color: "red"
        width: navigation.width * 0.6
        height: navigation.width > navigation.height ? parent.width * 0.1 : parent.width * 0.2
        Behavior on height { NumberAnimation { } }

        MouseArea {
            anchors.fill: parent
            Ripple {}
            onClicked: {
                navigation.insertNavigationItem(0, com2)
            }
        }

        Component {
            id: com2
            NavigationItem {
                Page {
                    Tracker {}
                }
            }
        }
    }

    NavigationItem {
        title: "main"
        icon: "main"

        Page {
            id: page
            padding.margins: dp * 16
            contentClip: true
            clip: true
            Rectangle {
                id: rect
                objectName: "Rect"
                anchors.fill: parent
                color: "green"
                border.width: dp
                border.color: "black"
                radius: dp * 2

                Container {
                    anchors.centerIn: parent
                    implicitWidth: dp * 88
                    implicitHeight: dp * 48
                    glow.color: "#ccc"
                    Rectangle {
                        anchors.fill: parent
                        Text {
                            anchors.centerIn: parent
                            //text: page.parent.toString()
                            text: rect.parent.toString()
                        }
                    }
                }
            }
        }

    }
}

