import QtQuick 2.5

ListView {
    id: view

    currentIndex: 0
    preferredHighlightBegin: 0
    preferredHighlightEnd: 0
    highlightMoveDuration: 250

//    highlightRangeMode: ListView.StrictlyEnforceRange
    snapMode: ListView.SnapOneItem
    boundsBehavior: ListView.StopAtBounds

    orientation: ListView.Horizontal

    default property Item initPage

    signal pushed(Item pushedItem)
    signal poped()

    Component.onCompleted: {
//        view.positionViewAtIndex(0, ListView.SnapPosition)
        view.contentX = 0;
        if(initPage) {
            listModel.push(initPage)
        }

    }

    model: ListModel {
        id: listModel
        function push(item){
            listModel.append({"item":item});
            view.incrementCurrentIndex();
            pushed(item);
        }

        function pop() {
            if(listModel.count > 1) {
                view.decrementCurrentIndex();
            }
        }
    }

    delegate: Item {
        id: swipeItem
        width: view.width
        height: view.height
        property bool swipeItemDeath: false
        property var recode: listModel.get(index)
        property Item page:  recode ? recode.item : null

        signal outOfViewFromRightSide(int itemIndex)

        Connections {
            target: view
            onContentXChanged: {
                if(view.contentX <= (index-1)*swipeItem.width) {
                    swipeItem.outOfViewFromRightSide(index)
                }
            }
        }

        onOutOfViewFromRightSide: {
            if(itemIndex != 0) {
                var oldItem = listModel.get(itemIndex).item;
                listModel.remove(itemIndex, 1);
                oldItem.destroy();
                poped();
            }

        }

        Binding {
            when: !swipeItem.swipeItemDeath
            target: swipeItem.page
            property:"visible"
            value: !swipeItem.swipeItemDeath
        }

        Binding {
            when: !swipeItem.swipeItemDeath
            target: swipeItem.page
            property:"parent"
            value: swipeItem
        }

        Binding {
            when: !swipeItem.swipeItemDeath
            target: swipeItem.page
            property: "implicitWidth"
            value: swipeItem.width
        }

        Binding {
            when: !swipeItem.swipeItemDeath
            target: swipeItem.page
            property: "implicitHeight"
            value: swipeItem.height
        }
    }

    function push(component, properties) {
        properties = properties || {};
        if(Qt.isQtObject(component)) {
            var item = component.createObject(view, properties);
            if(item) {
                listModel.push(item);
            }
        }
    }

    function pop() {
        listModel.pop();
    }

}
