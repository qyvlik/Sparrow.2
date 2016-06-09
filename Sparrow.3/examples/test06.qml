import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQml.Models 2.2
import QtQuick.Window 2.0
import Sparrow 3.0

import QtQuick.Dialogs 1.2

AppWindow {

    // ColorDialog {  visible: true }

    width: 360 * dp * 2
    height: 640 * dp * 1.2

    MultiLayer {

        width: 360 * dp
        height: 640 * dp

        anchors.centerIn: parent

        clip: true

        backgroundComponent: Rectangle { color: "#ddd" }

        contentComponent: SwipeToPop {
            id: swipeToPop

            Rectangle {
                id: navigation

                color: "#ddd"


                SwipeViewControler {
                    id: swipeViewControler
                    listView: swipe
                    delegate: Rectangle {
                        color: "#3e3e3e"
                        width: swipeViewControler.listView.visibleArea.widthRatio * swipeViewControler.listView.width
                        height: swipeViewControler.height - swipeViewControler.markerHeight
                        MouseArea {
                            anchors.fill: parent
                            onClicked: swipeViewControler.listView.currentIndex = index;
                            Ripple { }
                        }

                        SampleText {
                            text: index
                            anchors.centerIn: parent
                            color:"white"
                            elide: Text.ElideRight
                        }
                    }
                }

                SwipeView {
                    id: swipe
                    clip: true
                    width: parent.width
                    anchors.top: swipeViewControler.bottom
                    anchors.bottom: parent.bottom

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
                                {
                                    "icon": Qt.resolvedUrl("../assets/a_x.png"),
                                    "string": "name"
                                },
                                {
                                    "icon": Qt.resolvedUrl("../assets/a_x.png"),
                                    "string": "name"
                                },
                            ]
                        }
                    }

                    Component.onCompleted: {
                        swipe.addItem(page02Com)
                        swipe.addItem(page02Com)
                        swipe.addItem(page02Com)
                        swipe.addItem(page02Com)
                        swipe.addItem(page02Com)
                        swipe.addItem(page02Com)
                    }

                }

                Component {
                    id: page02Com
                    Rectangle {
                        id: page02
                        color: "green"
                        border.color: "#aaa"
                        border.width: dp
                    }
                }

            } // navigation

        } // contentComponent SwipeToPop

        overlayerComponent: Drawerlayer {
            id: drawerlayer
            drawerComponent: Rectangle {
                color: "#3e3e3e"
            }
        }

    } // multilayer


}

