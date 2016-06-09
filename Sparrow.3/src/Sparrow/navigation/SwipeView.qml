import QtQuick 2.5

ListView {
    id: view

    preferredHighlightBegin: 0
    preferredHighlightEnd: 0
    highlightMoveDuration: 250

    snapMode: ListView.SnapOneItem
    boundsBehavior: ListView.StopAtBounds
    highlightRangeMode: ListView.StrictlyEnforceRange

    orientation: ListView.Horizontal

    default property Item initPage

    Component.onCompleted: {
        view.contentX = 0;
        if(initPage) {
            listModel.addItem(initPage);
        }
    }

    model: ListModel {
        id: listModel
        function addItem(item){
            listModel.append({"item":item});
        }
    }

    delegate: Item {
        id: swipeItem
        width: view.width
        height: view.height
        property bool swipeItemDeath: false
        property var recode: listModel.get(index)
        property Item page:  recode ? recode.item : null

        Binding {
            when: !swipeItem.swipeItemDeath
            target: swipeItem.page
            property:"visible"
            value: true
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

    function addItem(component, properties) {
        properties = properties || { visible: false };
        if(Qt.isQtObject(component)) {
            var item = component.createObject(view, properties);
            if(item) {
                listModel.addItem(item);
            }
        }
    }

    function removeItem(index) {
        var oldItem = listModel.get(itemIndex).item;
        listModel.remove(itemIndex, 1);
        oldItem.destroy();
    }
}
