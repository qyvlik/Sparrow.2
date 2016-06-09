import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Window 2.0

Rectangle {
    id: swipeViewControler
    width: parent.width
    height: 36 * dp
    
    color: "#3b3b3b"

    property ListView listView: null
    property alias delegate: repeater.delegate
    property alias markerColor: scrollbar.color
    property alias markerHeight: scrollbar.height

    Row {
        spacing: 0


        Repeater {
            id: repeater
            model: swipeViewControler.listView.count
        }
    }
    
    Rectangle {
        id: scrollbar
        
        anchors.bottom: parent.bottom
        
        x: swipeViewControler.listView.visibleArea.xPosition * swipeViewControler.listView.width
        
        width: swipeViewControler.listView.visibleArea.widthRatio * swipeViewControler.listView.width
        height: 2 * dp
        color: "white"
    }
}
