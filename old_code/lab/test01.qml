import QtQuick 2.0
import Sparrow 2.0
import "Component"

SystemScreen {
    id: systemScreen
    padding.margins: dp * 10
    GridView {
        id: gridView
        anchors.fill: parent
        cellHeight: gridView.width / 4
        cellWidth: gridView.width / 4

        model: 10
        delegate: Item {
            width: gridView.cellWidth
            height: gridView.cellHeight

//            ParentAnimation {
//                target: systemApp
//                NumberAnimation { properties: "x,y,opacity"; duration: 10000 }
//            }

            SystemAppIcon {
                id: appIcon
                anchors.centerIn: parent
                onClicked: {
                    systemApp.startUp();
                }

                SystemApp {
                    id: systemApp
                    visible: false
                    opacity: 0
                    scale: 0

                    drawer: Drawer { }
                    NavigationItem {
                        title: "App"
                        Page {
                            Rectangle {
                                anchors.fill: parent
                                color: "red"
                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        systemApp.shutDown();
                                    }
                                }
                            }
                        }
                    }

                    function startUp() {
                        systemScreen.overlay = systemApp;
                        systemApp.opacity = 1;
                        systemApp.scale = 1;
                        systemApp.visible = true;
                    }

                    function shutDown() {
                        systemScreen.overlay = null;
                        systemApp.parent = appIcon;
                        systemApp.opacity = 0;
                        systemApp.scale = 0;
                        systemApp.visible = false;
                    }
                }
            }
        }
    }

}

