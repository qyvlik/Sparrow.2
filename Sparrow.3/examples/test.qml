import QtQuick 2.0

Rectangle {
    id: container

    property string text: "Drag this text..."
    property bool animated: true

    width: 640; height: 480; color: "#474747"; focus: true

    Keys.onPressed: {
        if (event.key === Qt.Key_Delete || event.key === Qt.Key_Backspace)
            container.remove()
        else if (event.text !== "") {
            container.append(event.text)
        }
    }

    function append(text) {
        container.animated = false
        var lastLetter = container.children[container.children.length - 1]
        var newLetter = letterComponent.createObject(container)
        newLetter.text = text
        newLetter.follow = lastLetter
        container.animated = true
    }

    function remove() {
        if (container.children.length)
            container.children[container.children.length - 1].destroy()
    }

    function doLayout() {
        var follow = null
        for (var i = 0; i < container.text.length; ++i) {
            var newLetter = letterComponent.createObject(container)
            newLetter.text = container.text[i]
            newLetter.follow = follow
            follow = newLetter
        }
    }

    Component {
        id: letterComponent
        Text {
            id: letter
            property variant follow

            x: follow ? follow.x + follow.width : container.width / 3
            y: follow ? follow.y : container.height / 2

            font.pixelSize: 40; font.bold: true
            color: "#999999"; styleColor: "#222222"; style: Text.Raised

            MouseArea {
                anchors.fill: parent
                drag.target: letter; drag.axis: Drag.XandYAxis
                onPressed: letter.color = "#dddddd"
                onReleased: letter.color = "#999999"
            }

            Behavior on x { enabled: container.animated; SpringAnimation { spring: 3; damping: 0.3; mass: 1.0 } }
            Behavior on y { enabled: container.animated; SpringAnimation { spring: 3; damping: 0.3; mass: 1.0 } }
        }
    }

    Component.onCompleted: doLayout()
}
