import QtQuick 2.0
import QtQuick.Controls 1.4

import Sparrow 2.0


Navigation {
    drawer: Drawer { }
    NavigationItem {
        title: "Swipe"
        icon: "Swipe"
        NavigationSwipe {
            Page {
                navigationBarEnabled: true
                Rectangle {color:"red";anchors.fill: parent}
            }

            Page {
                navigationBarEnabled: false
                Rectangle {color:"green";anchors.fill: parent}
            }
        }
    }
    NavigationItem {
        title: "Stack"
        icon: "Stack"
        NavigationStack {
            Page {
                id: mainPage
                navigationBarEnabled: true
                Rectangle {color:"red";anchors.fill: parent}
                Button {
                    anchors.centerIn: parent
                    text: "push"
                    onClicked: {
                        mainPage.navigationStack.push(com);
                    }
                }
                Component {
                    id: com
                    Page {
                        id: secondPage
                        Rectangle {color:"yellow";anchors.fill: parent}
                        Button {
                            anchors.centerIn: parent
                            text: "pop"
                            onClicked: {
                                secondPage.navigationStack.pop();
                            }
                        }
                    }
                }
            }
        }
    }
}
