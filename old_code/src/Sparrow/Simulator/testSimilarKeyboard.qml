import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 2.0
import Sparrow.Controls 2.0
import Sparrow.Theme 2.0
import Sparrow.Private 2.0

AppWindow {

    Navigation {
        id: navigation
        anchors.fill: parent

        drawer: Drawer {

            header: Rectangle {
                width: parent.width
                height: parent.width * 0.6
                color: "lightblue"
            }

            footer: Rectangle {
                width: parent.width
                height: parent.width * 0.6
                color: "plum"
            }
        }

        NavigationItem {
            icon: FontAwesome.fa_home
            title: "teal"
            NavigationStack {
                Page {
                    id: tealPage
                    navigationBarEnabled:  true
                    header: NavigationBar {
                        Button {
                            text: "menu"
                            onClicked: { navigation.showDrawer() }
                        }
                    }

                    RippleButton {
                        anchors.centerIn: parent
                        text: qsTr("Button")
                        onClicked: {
                            tealPage.navigationStack.push(component2)
                        }
                    }
                    Component {
                        id: component2
                        Page {
                            padding.margins: 10
                            Rectangle {
                                anchors.fill: parent
                                color: "pink"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        inputMethod.hide();
                                        textField.focus = false;
                                    }
                                }
                                TextField {
                                    id:textField
                                    width: parent.width
                                    //placeholderText: "Type You Word"
                                    onActiveFocusChanged: {
                                        if(activeFocus) {
                                            inputMethod.show();
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }

        NavigationItem {
            icon: FontAwesome.fa_qq
            title: "red"

            NavigationStack {
                Page {
                    id: page
                    navigationBarEnabled: true
                    ListView {
                        anchors.fill: parent
                        delegate: Rectangle {
                            width: parent.width
                            height: dp * 60
                            color: "pink"
                            border.width: 1
                            border.color: "#ccc"
                            RippleButton {
                                text: "button"
                                anchors.centerIn: parent
                                onClicked: {
                                    page.navigationStack.push(component)
                                }
                            }
                        }
                        model: 5
                    }

                    Component {
                        id: component
                        Page {
                            padding.margins: 10
                            Rectangle {
                                anchors.fill: parent
                                color: "pink"
                                Text {
                                    anchors.centerIn: parent
                                    text: "component"
                                }
                            }
                        }
                    }
                }

            }
        }

    }
}

