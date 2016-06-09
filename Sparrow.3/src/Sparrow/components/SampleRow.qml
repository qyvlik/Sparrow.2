import QtQuick 2.5
import QtQuick.Layouts 1.1

Rectangle {
    id: sampleRow

    color: "#eee"

    // 本方法不适合在 QAbstractItemModel* 及其子类中使用，除非 QAbstractItemModel* 及其子类有设定 modelData 这个角色
    property var item: try {
                           // modelData 适用与 list<QtObject> 类型， js 数组类型，数字等
                           // 注意 QtObject* 除 QAbstractItemModel* 外都会转换成 list<QtObject> 这种类型

                           // console.debug(typeof modelData)
                           return modelData;
                       } catch(e) {
                           return ListView.view.model.get(index);
                       }

    signal clickedItem(int index, Item item)

    property url icon: item && item.icon ? item.icon : ""
    property string string: item && item.string ? item.string : ""

    width: parent.width
    // height: row.childrenRect.height * 1.2
    height: row.implicitHeight * 1.2

    RowLayout {
        id: row

        width: parent.width
        anchors.verticalCenter: parent.verticalCenter

        SampleImage {
            id: icon
            Layout.leftMargin: 16 * dp
            visible: sampleRow.icon != ""
            source: sampleRow.icon
            sourceSize: Qt.size(icon.width, icon.height)
            width: 48 * dp
            height: 48 * dp
        }

        Item {
            Layout.alignment: Qt.AlignCenter
            Layout.fillWidth: true
            anchors.verticalCenter: parent.verticalCenter
            height: text.contentHeight

            SampleText {
                id: text
                text: sampleRow.string
                anchors.centerIn: parent
                anchors.horizontalCenterOffset: icon.visible ? - icon.paintedWidth + 16 * dp : 0
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
            }
        }
    }

    BottomLine { }

    AvoidMultiTouchArea {
        anchors.fill: parent
        onValidClicked: {
            clickedItem(index, sampleRow)
        }
        Ripple{}
    }

}
