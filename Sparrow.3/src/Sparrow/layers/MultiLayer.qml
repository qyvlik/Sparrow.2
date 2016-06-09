import QtQuick 2.5

Item {
    id: multiLayer

    property Component backgroundComponent: null
    readonly property Item backgroundItem: backgroundItemLoader.item

    Loader {
        id: backgroundItemLoader
        anchors.fill: parent
        sourceComponent: multiLayer.backgroundComponent
        Binding {
            target: backgroundItemLoader.item
            property: "anchors.fill"
            value: backgroundItemLoader
        }
    }

    property Component contentComponent: null
    readonly property Item contentItem: contentItemLoader.item

    Loader {
        id: contentItemLoader
        anchors.fill: parent
        sourceComponent: multiLayer.contentComponent
        Binding {
            target: contentItemLoader.item
            property: "anchors.fill"
            value: contentItemLoader
        }
    }

    property Component overlayerComponent: null
    readonly property Item overlayerItem: overlayerLoader.item

    Loader {
        id: overlayerLoader
        anchors.fill: parent
        sourceComponent: multiLayer.overlayerComponent
        Binding {
            target: overlayerLoader.item
            property: "anchors.fill"
            value: overlayerLoader
        }
    }
}

