import QtQuick 2.5
import QtQuick.Controls 1.4

import Sparrow 2.0
import Sparrow.Private 2.0

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
                                Text { text: page2.parent + "" }
                                Text { text: page2.navigation + "" }
                            }

                            MouseArea {
                                anchors.fill: parent;
                                onClicked: navigationStack.pop();
                            }
                        }
                    }
                }
            }
        }
    }



}

