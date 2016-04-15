import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

import Sparrow 2.0
import Sparrow.Private 2.0

ToolBar {
    id: navigationBar
    objectName: "Sparrow.NavigationBar 2.0"

    property alias backgroundColor: container.backgroundColor

    property alias leftBarItem: container.leftBarItem
    property alias titleItem: container.titleItem
    property alias rightBarItem: container.rightBarItem

    style: ToolBarStyle {
        padding {
            left: 0
            right: 0
            top: 0
            bottom: 0
        }
    }

    //! avoid Binding loop
    Item { anchors.fill: parent }

    Container {
        id: container
        anchors.fill: parent
        objectName: "Sparrow.NavigationBar$Container 2.0"

        //! [role parent property] NavigationBar
        property color backgroundColor: "#3498db"
        //! [role parent property]

        property Item leftBarItem: null
        property Item titleItem: null
        property Item rightBarItem: null

        Binding {
            target: container.leftBarItem
            property: "parent"
            value: leftBarItemParent
        }

        Binding {
            target: container.titleItem
            property: "parent"
            value: titleItemParent
        }

        Binding {
            target: container.rightBarItem
            property: "parent"
            value: rightBarItemParent
        }

        Item {
            objectName: "Sparrow.NavigationBar$Container$Layout 2.0"

            anchors.fill: parent

            Item {
                id: leftBarItemParent
                width: leftBarItemParent.childrenRect.width
                height: parent.height
                anchors.left: parent.left

            }

            Item {
                id: titleItemParent
                width: titleItemParent.childrenRect.width
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Item {
                id: rightBarItemParent
                width: rightBarItemParent.childrenRect.width
                height: parent.height
                anchors.right: parent.right
            }
        }


        background: Rectangle {
            id: rowContainerBackgroundItem
            anchors.fill: parent
            color: container.backgroundColor
        }
    }
}
