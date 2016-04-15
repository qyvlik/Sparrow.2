import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

import Sparrow 2.0
import Sparrow.Private 2.0

Window {

    width: navigation.width
    height: navigation.height
    Window {
        visible: true
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
                    // navigationBarEnabled 要重新设定。
                    navigationBarEnabled: stack1.navigationBarEnabled
                    padding.margins: 0
                    // must set __navigation implicitWidth implicitHeight
                    NavigationStack {
                        id: stack1
                        __navigation: navigation
                        implicitWidth: navigation.width
                        implicitHeight: navigation.height
                        Page {
                            id: page0
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
                                        page0.navigationStack.push(com2, {} )
                                    }
                                }
                            }
                            Component {
                                id:com2
                                Page {
                                    id: page2
                                    // navigationBarEnabled 要重新设定。
                                    navigationBarEnabled: swipe2.navigationBarEnabled
                                    clip: true
                                    padding.margins: dp * 16;
                                    NavigationSwipe {
                                        id: swipe2
                                        __navigation: page2.navigation
                                        implicitWidth: page2.navigation.width
                                        implicitHeight: page2.navigation.height
                                        Component.onCompleted: {

                                        }

                                        Page {
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
                                                            navigationStack.push(com2, {} )
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        Page {
                                            id: page000
                                            navigationBarEnabled: true

                                            padding.margins: dp * 20
                                            Rectangle {color:"green";anchors.fill: parent}
                                            Text {
                                                anchors.centerIn: parent
                                                text: page000.navigation + ""
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
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

