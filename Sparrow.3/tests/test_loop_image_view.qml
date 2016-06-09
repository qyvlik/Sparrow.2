import QtQuick 2.5

Item {
    width:  360
    height: 640

    ListModel {
        id: contactModel
        ListElement {
            name: "Bill Jones"
            icon: "pics/qtlogo.png"
        }
        ListElement {
            name: "Jane Doe"
            icon: "pics/qtlogo.png"
        }
        ListElement {
            name: "John Smith"
            icon: "pics/qtlogo.png"
        }
    }

    Component {
        id: delegate
        Rectangle {
            id: wrapper
            width: 200
            height: 200
            opacity: 0.5
            Text {
                id: nameText
                text: name
                font.pointSize: 16
                color: wrapper.PathView.isCurrentItem ? "red" : "black"
                anchors.centerIn: parent
            }
        }
    }

    PathView {
        width: parent.width
        model: contactModel
        height: parent.width * 0.4
        delegate: delegate
        snapMode: PathView.SnapOneItem
        highlightRangeMode: PathView.StrictlyEnforceRange
        path: Path {
            startX: 120; startY: 100
            PathQuad { x: 120; y: 25; controlX: 260; controlY: 75 }
            PathQuad { x: 120; y: 100; controlX: -20; controlY: 75 }
        }

        Rectangle {
            anchors.fill: parent
            color: "blue"
        }

    }
}

