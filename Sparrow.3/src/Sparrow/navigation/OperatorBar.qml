import QtQuick 2.5

Rectangle {
    id: operatorBar

    height: 48 * dp
    width: parent.width

    property Component leftComponent: null
    readonly property Item leftItem: leftLoader.item
    
    Loader {
        id: leftLoader
        anchors.left: parent.left
        anchors.leftMargin: 8 * dp
        anchors.verticalCenter: parent.verticalCenter

        width: 32 *dp
        height: 32 * dp
        sourceComponent: leftComponent
//        Binding {
//            target: leftLoader.item
//            property: "anchors.fill"
//            value: leftLoader
//        }
    }

    property Component centerComponent: null
    readonly property Item centerItem: centerLoader.item
    
    Loader {
        id: centerLoader
        height: 32 * dp
        width: parent.width * 0.4
        anchors.centerIn: parent
        sourceComponent: centerComponent
//        Binding {
//            target: centerLoader.item
//            property: "anchors.centerIn"
//            value: centerLoader
//        }
    }

    property Component rightComponent: null
    readonly property Item rightItem: leftLoader.item
    

    Loader {
        id: rightLoader
        anchors.rightMargin: 8 * dp
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        width: 32 *dp
        height:  32 * dp
        sourceComponent: rightComponent
    }
}
