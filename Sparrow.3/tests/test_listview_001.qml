import QtQuick 2.5
import QtQml.Models 2.2

import Sparrow 3.0

AppWindow {
    id: app

    MultiLayer {
        id: main

        width: parent.width
        height: parent.height


        readonly property bool mustLock: contentItem.mustLock

        contentComponent: ListView {
            id: rootView
            anchors.fill: parent
            model: objectsModel

            snapMode: ListView.SnapOneItem
            boundsBehavior: ListView.StopAtBounds

            header: OperatorBar {
                color: "#3e3e3e"
                leftComponent : Icon {
                    icon: FontAwesome.fa_navicon
                    onValidClicked: {
                        main.toggleDrawer();
                    }
                }

                centerComponent: SampleText {
                    anchors.centerIn: parent
                    text: "Title"
                    color: "white"
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                }

                rightComponent:  Icon {
                    icon: FontAwesome.fa_ellipsis_v
                    onValidClicked: {
                        main.togglePopup();
                    }
                }
            }

            readonly property bool mustLock: rootView.contentY >= 0 && rootView.contentY < headerItem.height
        }

        overlayerComponent: MultiLayer {
            id: overlayer
            contentComponent: Drawerlayer {
                drawerComponent: Rectangle {
                    color: "#3e3e3e"
                }
            }

            overlayerComponent: PopupLayer {
                popupX: 160 * dp
                popupY: 56 * dp
                popupWidth: 180 * dp
                popupHeight: 200 * dp
                popupComponent: Rectangle {
                    id: popupMenu
                    color: "green"
                    ListView {
                        anchors.fill: parent
                        model: 1
                        delegate: SampleButton {
                            text: index
                            width: parent.width
                        }
                    }
                }
            }

            function toggleDrawer() {
                if(overlayer.contentItem.isShow) {
                    overlayer.contentItem.hide()
                } else {
                    overlayer.contentItem.show()
                }
            }

            function togglePopup() {
                overlayerItem.toggle();
            }
        }

        function toggleDrawer() {
            overlayerItem.toggleDrawer();
        }


        function togglePopup() {
            overlayerItem.togglePopup();
        }

    }

    ObjectModel {
        id: objectsModel

        Item {
            width: 360
            height: 640

            SwipeViewControler {
                id: swipeViewControler
                listView: swipeView
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
            }

            SwipeView {
                id: swipeView

                width: parent.width
                anchors.top: swipeViewControler.bottom
                anchors.bottom: parent.bottom

                Component.onCompleted: {
                    swipeView.addItem(swipePageComponent)
                    swipeView.addItem(swipePageComponent)
                    swipeView.addItem(swipePageComponent)
                    swipeView.addItem(swipePageComponent)
                    swipeView.addItem(swipePageComponent)
                    swipeView.addItem(swipePageComponent)
                }

            }
        }
    }

    Component {
        id: swipePageComponent
        Rectangle {
            id: swipeItem
            clip: true
            color: Qt.rgba(Math.random(), Math.random(), Math.random(), Math.random())

            ListView {
                id: thisView
                anchors.fill: parent
                model: 50
                boundsBehavior: ListView.StopAtBounds

                interactive: main.mustLock

                delegate: Rectangle {
                    width: swipeItem.width
                    height: 48 * dp
                    color: Qt.rgba(Math.random(), Math.random(), Math.random(), Math.random())
                    Text {
                        text: index
                    }
                }
            }
        }
    }

}

