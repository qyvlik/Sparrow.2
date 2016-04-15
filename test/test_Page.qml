import QtQuick 2.0

import Sparrow 2.0
import Sparrow.Private 2.0

Page {


    //shadow.visible: false


        //        Container {
        //            id: container
        //            glow.color:  "#ccc"
        //            glow.elevation: 2

        //            Rectangle {
        //                anchors.fill: parent
        //                color: "green"
        //                MouseArea {
        //                    anchors.fill: parent
        //                    onPressed: {
        //                        container.glow.elevation = 8
        //                    }
        //                    onReleased: {
        //                        container.glow.elevation = 2
        //                    }
        //                }
        //            }
        //        }

        //        Container {
        //            id: container1
        //            glow.color: "#ccc"
        //            glow.elevation: 6

        //            Rectangle {
        //                anchors.fill: parent
        //                color: "green"
        //                MouseArea {
        //                    anchors.fill: parent
        //                    onPressed: {
        //                        container1.glow.elevation = 12
        //                    }
        //                    onReleased: {
        //                        container1.glow.elevation = 6
        //                    }
        //                }
        //            }
        //        }

        Container {
            id: container2

            implicitHeight: dp * 100
            implicitWidth: dp * 100
            glow.elevation: 1
            glow.color: "black"
            anchors.centerIn: parent

            Rectangle {
                anchors.fill: parent
                color: "green"
                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        container2.glow.elevation = 2
                    }
                    onReleased: {
                        container2.glow.elevation = 1
                    }
                }
            }
        }



}

