import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Window 2.0
import Sparrow 3.0

AppWindow {

    Rectangle {
        id: navigation

        anchors.centerIn: parent

        width: 360 * dp
        height: 640 * dp

        color: "#ddd"

        OperatorBar {
            id: operatorBar
            color: "lightblue"
            leftComponent : Icon {
                icon: FontAwesome.fa_arrow_left
                onValidClicked: {
                    swipe.pop()
                }
            }

            centerComponent: SampleText {
                anchors.centerIn: parent
                text: "Title"
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }

            rightComponent:  Icon {
                icon: FontAwesome.fa_ellipsis_v
                onValidClicked: {
                    overlay.toggle()
                }
            }
        }


        SwipeToPop {
            id: swipe
            clip: true

            anchors.right: parent.right
            anchors.left: parent.left

            anchors.top: operatorBar.bottom
            anchors.bottom: navigation.bottom

            Item {
                id: firstPage
                property int text: 0
                SampleList {
                    anchors.fill: parent
                    emptyText: "Nothing!"
                    model: [
                        {
                            "icon": Qt.resolvedUrl("../assets/a_x.png"),
                            "string": "name"
                        },
                    ]
                    onClickedItem: { swipe.push(d, {text: firstPage.text+1}) }
                }
                Text { text: firstPage.text }
            }
        }


        Item {
            id: overlay
            anchors.fill: parent

            function toggle() {
                pop.visible = !pop.visible;
                return mouseArea.visible = !mouseArea.visible;
            }

            MouseArea {
                id: mouseArea
                anchors.fill: parent
                visible: false
                onClicked: {
                    overlay.toggle();
                }
            }

            Rectangle {
                id: pop
                visible: false
                x: navigation.width - pop.width*1.2
                y: operatorBar.height * 1.2
                width: 128 * dp
                height: 128 * dp

                border.color: "#ccc"
                border.width: dp
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("clicked")
                    }
                }
            }
        }
    }

    Component {
        id: d
        Item {
            id: p
            property int text
            SampleList {
                anchors.fill: parent
                model: [
                    {
                        "icon": Qt.resolvedUrl("../assets/a_h.png"),
                        "string": "name"
                    },
                    {
                        "icon": Qt.resolvedUrl("../assets/a_i.png"),
                        "string": "name"
                    },
                    {
                        "icon": Qt.resolvedUrl("../assets/a_k.png"),
                        "string": "name"
                    },
                    {
                        "icon": Qt.resolvedUrl("../assets/a_l.png"),
                        "string": "name"
                    },
                    {
                        "icon": Qt.resolvedUrl("../assets/a_n.png"),
                        "string": "name"
                    },
                    {
                        "icon": Qt.resolvedUrl("../assets/a_o.png"),
                        "string": "name"
                    },
                ]
                onClickedItem: { swipe.push(d, {text: p.text+1}) }
            }
            Text { text: p.text }
        }
    }


}

