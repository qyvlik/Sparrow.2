import QtQuick 2.0
import QtQuick.Layouts 1.1

Rectangle {
    id: keyboardArea
    //color: "#ccc"

    signal keyPressed(string key)

    MouseArea {
        id: mouseMask
        anchors.fill: parent
        onClicked: { }
    }

    ColumnLayout {
        anchors.fill: parent
        RowLayout {
            Layout.fillWidth: true
            Item {Layout.fillWidth: true}
            QWEKey {key:"Q" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"W" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"E" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"R" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"T" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"Y" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"U" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"I" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"O" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"P" ; onClicked: {keyPressed(key)} }
            Item {Layout.fillWidth: true}
        }
        RowLayout {
            Layout.fillWidth: true
            Item {Layout.fillWidth: true}
            QWEKey {key:"A" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"S" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"D" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"F" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"G" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"H" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"J" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"K" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"L" ; onClicked: {keyPressed(key)} }
            Item {Layout.fillWidth: true}
        }
        RowLayout {
            Layout.fillWidth: true
            Item {Layout.fillWidth: true}

            QWEKey {key:"△" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"Z" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"X" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"C" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"V" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"B" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"N" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"M" ; onClicked: {keyPressed(key)} }
            QWEKey {key:"◁"}

            Item {Layout.fillWidth: true}
        }
        RowLayout {
            Layout.fillWidth: true
            Item {Layout.fillWidth: true}

            QWEKey {key:"?123"; onClicked: {keyPressed(key)}  }
            QWEKey {key:","  ; onClicked: {keyPressed(key)} }
            QWEKey {key:" " ; Layout.fillWidth: true ; onClicked: {keyPressed(key)} }
            QWEKey {key:"." ; onClicked: {keyPressed(key)} }
            QWEKey {key:"Д" ; onClicked: {keyPressed(key)} }
            Item {Layout.fillWidth: true}
        }
    }
}
