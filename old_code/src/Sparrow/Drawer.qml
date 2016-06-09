import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 2.0
import Sparrow.Controls 2.0
import Sparrow.Private 2.0

/*
{
    "pageTitle": items[iter].title,
    "pageIcon": items[iter].icon,
    "pageIndex": iter,
    "page"
};
*/

Page {
    id: drawer
    objectName: "Sparrow.Drawer 2.0"

    //! Don't use Navigation type, use var.
    property var navigation

    property alias __model: menusView.model
    property alias delegate: menusView.delegate

    signal select(int index)

    width: parent.width <= parent.height ? parent.width * 0.8 : parent.width * 0.4
    height: parent.height

    background: Rectangle {
        anchors.fill: parent
        color: "white"
    }

    ListView {
        id: menusView
        anchors.fill: parent
        boundsBehavior: Flickable.StopAtBounds
        delegate: RippleButton {
            id: button
            width: parent.width
            height: dp * 60
            padding.margins: 0
            glowEffectEnable: false
            backgroundColor: "white"
            icon: drawer.__model[index]["pageIcon"]
            text: drawer.__model[index]["pageTitle"]
            textColor: drawer.__model[index]["page"].visible ? "#3498db":"balck"
            onClicked: {
                select(index);
            }
            Rectangle {
                parent: button
                anchors.bottom: parent.bottom
                width: button.width
                height: dp * 1
                color: "#ccc"
            }
        }
    }
}

