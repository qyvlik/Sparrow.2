import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.1

import Sparrow 3.0

AppWindow {

    width: 360 * dp * 2
    height: 640 * dp * 1.2

    Flow {
        anchors.fill: parent
        anchors.margins: 16 * dp

        SampleButton {
            text: "Button"
        }

        SampleCheckBox {
            id: checkBox
            text: "check Box"
        }

        RowLayout {
            width: parent.width
            Item {
                Layout.fillWidth: true
            }
            SampleButton {
                text: "Button"
            }

            SampleButton {
                text: "Button"
            }

            SampleCheckBox {
                text: "check Box"
            }

            SampleCheckBox {
                text: "check Box"
            }
            Item {
                Layout.fillWidth: true
            }

        }

    }

}

