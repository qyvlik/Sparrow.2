import QtQuick 2.5
import Sparrow 3.0

AvoidMultiTouchArea {

    property alias icon: icon.text
    property alias color: icon.color
    property alias font: icon.font

    Ripple { clip: false }
    
    SampleText {
        id: icon
        anchors.centerIn: parent
        font.family: FontAwesome.family
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: "white"
    }
}
