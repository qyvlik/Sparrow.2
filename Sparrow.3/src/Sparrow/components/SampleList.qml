import QtQuick 2.5

ListView {
    id: view
    clip: true

    property string emptyText: ""
    signal clickedItem(int index, Item item)

/*
    property url icon: item && item.icon ? item.icon : ""
    property string string: item && item.string ? item.string : ""
*/

    delegate:
        SampleRow {
        id: sampleRow
        onClickedItem: view.clickedItem(index, item)
    }

    SampleText {
        anchors.centerIn: parent
        text: emptyText
        visible: view.count == 0
    }

}

