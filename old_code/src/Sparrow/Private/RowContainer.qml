import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Container {

    id: rowContainer
    objectName: "Sparrow.Private.RowContainer 2.0"

    default property alias data: rowLayout.data

    property alias spacing: rowLayout.spacing
    property alias layoutDirection: rowLayout.layoutDirection

    RowLayout {
        id: rowLayout
        objectName: "Sparrow.Private.RowContainer$RowLayout 2.0"

        anchors.fill: parent

        //! [role parent property] Container
        property real alias:  rowContainer.dpScale
        readonly property alias dp: rowContainer.dp

        property alias overlay: rowContainer.overlay
        readonly property alias content: rowContainer.content
        property alias background: rowContainer.background
        readonly property alias glow: rowContainer.glow

        readonly property alias __overlayParent: rowContainer.__overlayParent
        readonly property alias __backgroundParent: rowContainer.__backgroundParent

        // Don't set clip true
        // set contentClip true or false
        property alias contentClip: rowContainer.contentClip
        property alias padding : rowContainer.padding

        readonly property alias window : rowContainer.window
        //! [role parent property]
    }
}

