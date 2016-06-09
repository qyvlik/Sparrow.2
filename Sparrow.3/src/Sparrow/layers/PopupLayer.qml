import QtQuick 2.5
import QtQuick.Controls 1.3
import QtQuick.Window 2.0

MouseArea {
    id: popupLayer

    visible: false

    property real popupWidth: 160
    property real popupHeight: 200
    property real popupX: 160
    property real popupY: 56

    property Component popupComponent
    readonly property Item popupItem: popupItemLoaer.item

    Loader {
        id: popupItemLoaer
        width: popupLayer.popupWidth
        height: popupLayer.popupHeight
        x: popupLayer.popupX
        y: popupLayer.popupY

        sourceComponent: popupLayer.popupComponent
        Binding {
            target: popupItemLoaer.item
            property: "anchors.fill"
            value: popupItemLoaer
        }
        MouseArea { anchors.fill: parent }
    }

    onClicked: popupLayer.toggle();

    function toggle() {
        popupLayer.visible = !popupLayer.visible;
    }

    function show() {
        popupLayer.visible = true;
    }

    function hide() {
        popupLayer.visible = false;
    }
}
