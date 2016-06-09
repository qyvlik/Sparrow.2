import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Window 2.0

Item {
    id: drawerlayer
    clip: true
    
    property Component drawerComponent: null
    readonly property Item drawerItem: drawerLoader.item
    
    readonly property bool isShow: dragItem.x == 0
    
    onIsShowChanged: {
        if(isShow) {
            // navigation.forceActiveFocus();
        }
    }
    
    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.5 - Math.abs(dragItem.x/dragItem.hideX)
    }
    
    function show() {
        dragItem.x = 0;
    }
    
    function hide() {
        dragItem.x = dragItem.hideX;
    }
    
    MouseArea {
        id: dragItem
        preventStealing: false
        height: parent.height
        width: parent.width
        readonly property real hideX: -(drawerlayer.width*0.95)
        x: hideX
        drag.target: dragItem
        drag.axis: Drag.XAxis
        drag.maximumX: 0
        drag.minimumX: hideX
        //! [关键]
        // 如果在 MouseArea 上还有一个 ListView 的话，设置为 true 即可
        drag.filterChildren: true
        
        Behavior on x { NumberAnimation { duration: 300 } }
        
        onReleased: {
            if(x > hideX / 2) {
                drawerlayer.show();
            } else {
                drawerlayer.hide();
            }
        }

        Loader {
            id: drawerLoader
            width: parent.width < parent.height ? parent.width * 0.8 : parent.width * 0.4
            height: parent.height
            sourceComponent: drawerComponent
            Binding {
                target: drawerLoader.item
                property: "anchors.fill"
                value: drawerLoader
            }
        }
    }
    
    MouseArea {
        width: parent.width <= parent.height ? parent.width * 0.2 : parent.width * 0.6
        height: parent.height
        anchors.right: parent.right
        visible: dragItem.x === 0
        onClicked: {
            if(dragItem.x === 0) dragItem.x = dragItem.hideX ;
        }
    }
}
