import QtQuick 2.0

import Sparrow.Controls 2.0

Rectangle {
    id: r
    property alias key: t.text
    implicitHeight: t.contentHeight * 1.4
    implicitWidth:  t.contentHeight > t.contentWidth ?　t.contentHeight * 1.2 : t.contentWidth * 1.2

    signal clicked(string keyString)

    Text {
        id: t
        anchors.centerIn: parent
        font.pointSize: 14
        font.family: "微软雅黑"
    }
    MouseArea {
        anchors.fill: parent
        Ripple { }
        onClicked: r.clicked(key)
    }
}

