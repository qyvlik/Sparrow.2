import QtQuick 2.0

Item {
    width: 360
    height: 640
    MouseArea {
        anchors.fill: parent
        onClicked: {
            if(blueRect.state === "") {
                blueRect.state = "reparented";
            } else {
                blueRect.state = "";
            }
        }
    }
    Rectangle {
        id: redRect
        width: 100; height: 100
        color: "red"
    }


    Rectangle {
        width: 50
        height: 50
        color: "yellow"
        x: redRect.width
        Rectangle {
            id: blueRect

            width: 360
            height: 640
            scale: 0
            opacity: 0
            color: "blue"
            //visible: false
            states: State {
                name: "reparented"
                ParentChange { target: blueRect; parent: redRect; x: 0; y: 0 }
                ParentChange { target: blueRect; parent: redRect; scale: 1 }
                PropertyChanges { target: blueRect; opacity: 1 }

            }

            transitions: Transition {
                ParallelAnimation {
                    ParentAnimation {
                        NumberAnimation { properties: "x,y,scale"; duration: 300 }
                    }
                    NumberAnimation { properties: "opacity"; duration: 300 }
                    //ScriptAction { script: blueRect.visible = true }
                }
            }
        }
    }


}
