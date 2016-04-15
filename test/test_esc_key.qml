import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

import Sparrow 2.0

Window {

    width: navigation.width
    height: navigation.height
    Window {
        visible: true
        width:  360
        height: 640
        Flow {
            anchors.fill: parent
            Text {
                text: navigation.window.activeFocusItem + ""
            }
        }
    }

    Navigation {

        id: navigation


        drawer: Drawer { }

        NavigationItem {
            title: "Normal"
            Page {
                id: second
                padding.margins: dp * 16

                Rectangle {
                    anchors.fill: parent
                    color: "lightblue"
                }
            }
        }

        NavigationItem {
            title: "Swipe"
            NavigationSwipe {
                Page {
                    navigationBarEnabled: false
                    padding.margins: 0
                    Rectangle {color:"red";anchors.fill: parent}
                }

                Page {
                    navigationBarEnabled: false

                    padding.margins: 0
                    Rectangle {color:"green";anchors.fill: parent}
                }
                Page {
                    navigationBarEnabled: false

                    padding.margins: 0
                    Rectangle {color:"yellow";anchors.fill: parent}
                }
            }
        }

        NavigationItem {
            title: "Stack"
            NavigationStack {
                Page {
                    id: page
                    //! Test
                    navigationBarEnabled: false
                    padding.margins: dp * 16

                    Rectangle {
                        anchors.fill: parent
                        color: "red"
                        Button {
                            text: "push"
                            anchors.centerIn: parent
                            onClicked: {
                                page.navigationStack.push(com1, {} )
                            }
                        }
                    }
                    Component {
                        id:com1
                        Page {
                            id: page2
                            navigationBarEnabled: true
                            clip: true
                            padding.margins: dp * 16;
                            Rectangle {
                                anchors.fill: parent; color: "green"
                                Flow {
                                    anchors.fill: parent
                                    Button {
                                        text: "pop"
                                        onClicked: {
                                            navigationStack.pop();
                                        }
                                    }
                                    Button {
                                        text: "push"
                                        onClicked: {
                                            navigationStack.push(com1, {} )
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

