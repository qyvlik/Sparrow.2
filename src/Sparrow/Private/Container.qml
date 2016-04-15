// Qt 5.5.1
import QtQuick 2.5
import QtQuick.Window 2.0
import QtGraphicalEffects 1.0

/*
  Container {
      padding,
      background,
      overlay,
      glow
  }
*/
Item {
    id: container

    objectName: "Sparrow.Private.Container 2.0"

    width: implicitWidth
    height: implicitHeight

    implicitWidth: dp * 36
    implicitHeight: dp * 36

    property real dpScale:  1.5
    readonly property real dp: Math.max(Screen.pixelDensity * 25.4 / 160 * dpScale, 1)

    default property alias data: contentContainer.data

    property Item overlay: null
    readonly property alias content: contentContainer
    property Item background: null
    readonly property alias glow: glowAccess

    readonly property alias __overlayParent: overlayParent
    readonly property alias __backgroundParent: backgroundParent

    // Don't set clip true
    // set contentClip true or false
    property alias contentClip: contentContainer.clip
    property alias padding : contentContainer.anchors

    readonly property Window window : contentContainer.__window

    Binding {
        objectName: "Sparrow.Private.Container$Binding:'container.background.parent bind container.backgroundParent' 2.0"
        target: background
        property: "parent"
        value: backgroundParent
    }

    Binding {
        objectName: "Sparrow.Private.Container$Binding:'container.overlay.parent bind container.overlayParent' 2.0"
        target: overlay
        property: "parent"
        value: overlayParent
    }

    GlowAccess {
        id: glowAccess
        cached:             false
        glowRadius:         dp * elevation
        cornerRadius:       glowRadius + dp * elevation * 8
        spread:             0.2
        elevation:          2
    }

    RectangularGlow {
        id: glowEffect
        anchors.fill:           container
        cached:                 glowAccess.cached
        color:                  glowAccess.color
        cornerRadius:           glowAccess.cornerRadius
        glowRadius:             glowAccess.glowRadius
        spread:                 glowAccess.spread
        visible:                glowAccess.visible
    }

//readonly property alias shadow: shadowAccess
//    Rectangle {
//        id: shadowEntry
//        width: baseContainer.width
//        height: baseContainer.height
//        color: shadowAccess.color
//        visible: false
//    }

//    ShadowAccess {
//        id: shadowAccess
//        cached :            false
//        color :             "black"
//        fast :              false
//        horizontalOffset :  0.0
//        radius :            elevation > 16 ? 16 : elevation
//        samples :           radius * 2
//        spread :            0.0
//        transparentBorder : true
//        verticalOffset :    1 * dp
//        elevation:          1.0
//    }

//    DropShadow {
//        anchors.fill: parent
//        anchors.margins: -dp * 10
//        source: shadowEntry
//        visible: shadowAccess.visible

//        cached :            shadowAccess.cached
//        color :             shadowAccess.color
//        fast :              shadowAccess.fast
//        horizontalOffset :  shadowAccess.horizontalOffset
//        radius :            shadowAccess.radius
//        samples :           shadowAccess.samples
//        spread :            shadowAccess.spread
//        transparentBorder : shadowAccess.transparentBorder
//        verticalOffset :    shadowAccess.verticalOffset
//    }

    Item {
        id: backgroundParent
        objectName: "Sparrow.Private.Container$BackgroundParent 2.0"
        anchors.fill: parent
    }

    BaseContainer {
        id: contentContainer
        objectName: "Sparrow.Private.Container$BaseContainer 2.0"

        anchors.fill: parent

        clip: container.clip

        //! 设置默认属性后，当默认属性中的孩子控件通过 parent 访问一些方法或者属性时
        //! 就要提前做好映射。

        //! [role parent property] Container
        property real alias:  container.dpScale
        readonly property alias dp: container.dp

        property alias overlay: container.overlay
        readonly property alias content: container.content
        property alias background: container.background
        readonly property alias glow: container.glow

        readonly property alias __overlayParent: container.__overlayParent
        readonly property alias __backgroundParent: container.__backgroundParent

        // Don't set clip true
        // set contentClip true or false
        property alias contentClip: container.contentClip
        property alias padding : container.padding

        readonly property alias window : container.window
        //! [role parent property]


    }

    Item {
        id: overlayParent
        objectName: "Sparrow.Private.Container$OverlayParent 2.0"
        anchors.fill: parent
    }


}
