import QtQuick 2.5
import QtQuick.Layouts 1.1

import Sparrow 3.0

AppWindow {

    width: 360 * dp * 2
    height: 640 * dp * 1.2

    Rectangle {
        width: 360 * dp
        height: 640 * dp
        anchors.centerIn: parent
        // color : "#ccc"

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
                // floatingLabel: true
                // helperText: "error"
                // hasError: true
            }
            SampleTextField {
                id: password
                Layout.fillWidth: true
                placeholderText: "密码"
                // floatingLabel: true
                // helperText: "error"
                // hasError: true
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
                    onClicked: { }
                }
            }

            Item {
                Layout.fillHeight: true
            }
        }
    }




}

