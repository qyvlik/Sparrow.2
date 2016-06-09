import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 1.0

SwipeToPop {
    id: swipeToPop

    Rectangle {
        id: navigation

        color: "#3e3e3e"

        SwipeViewControler {
            id: swipeViewControler
            listView: swipe

            delegate: Rectangle {
                color: "#3e3e3e"
                width: swipeViewControler.listView.visibleArea.widthRatio * swipeViewControler.listView.width
                height: 34 * dp
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
        } // SwipeViewControler

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
                            "icon": Qt.resolvedUrl("../../../assets/a_x.png"),
                            "string": "name"
                        },
                    ]
                    onClickedItem: { swipeToPop.push(otherPages, {text: firstPage.text+1}) }
                }
                Component {
                    id: otherPages
                    Item {
                        id: p
                        property int text
                        SampleList {
                            anchors.fill: parent
                            model: [
                                {
                                    "icon": Qt.resolvedUrl("../../../assets/a_i.png"),
                                    "string": "name"
                                },
                            ]
                            onClickedItem: { swipeToPop.push(otherPages, {text: p.text+1}) }
                        }
                        Text { text: p.text }
                    }
                }
            } // SwipeView

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
    }
} // SwipeToPop
