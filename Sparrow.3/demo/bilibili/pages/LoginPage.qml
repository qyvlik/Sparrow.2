import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 3.0

Rectangle {
    //    width: 360 * dp
    //    height: 640 * dp
    color : "#3e3e3e"

    signal success(var info)

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 16
        Item {
            height: parent.height * 0.2
            width: parent.width
        }
        SampleTextField {
            id: username
            Layout.fillWidth: true
            placeholderText: "用户名"
            textColor: "white"
            placeholderTextColor: "white"

        }
        SampleTextField {
            id: password
            Layout.fillWidth: true
            placeholderText: "密码"
            textColor: "white"
            placeholderTextColor: "white"
        }

        RowLayout {
            Layout.fillWidth: true
            SampleButton {
                text: "cancel"
            }
            Item {
                Layout.fillWidth: true
            }
            SampleButton {
                text: "submit"
                onClicked: {
                    success("OK")
                }
            }
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
