// code from
import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Switch {
    id: control

    /*!
       The switch color. By default this is the app's accent color
     */
    property color color: "#2196f3"

    /*!
       Set to \c true if the switch is on a dark background
     */
    property bool darkBackground

    width: 40 * dp
    height: 22 * dp

    style: SwitchStyle {
        handle: Rectangle {
            width: control.height
            height: control.height
            radius: height / 2
            color: control.enabled ? control.checked ? control.color
                                                               : darkBackground ? "#BDBDBD"
                                                                                : "#FAFAFA"
                                             : darkBackground ? "#424242"
                                                              : "#BDBDBD"
        }

        groove: Item {
            width: control.height * 2
            height: control.height

            Rectangle {
                anchors.centerIn: parent
                width: parent.width - (2)
                height: control.height * 0.8
                radius: height / 2
                color: control.enabled ? control.checked ? alpha(control.color, 0.5)
                                                         : darkBackground ? Qt.rgba(1, 1, 1, 0.26)
                                                                          : Qt.rgba(0, 0, 0, 0.26)
                                       : darkBackground ? Qt.rgba(1, 1, 1, 0.12)
                                                        : Qt.rgba(0, 0, 0, 0.12)

                function alpha(color, alpha) {
                    var realColor = Qt.darker(color, 1)
                    realColor.a = alpha
                    return realColor
                }

                Behavior on color {
                    ColorAnimation {
                        duration: 200
                    }
                }
            }
        }
    }
}
