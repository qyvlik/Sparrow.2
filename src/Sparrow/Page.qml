// Qt 5.5.1
import QtQuick 2.5
import QtQuick.Layouts 1.1

import QtQuick.Window 2.0
import Sparrow.Private 2.0

Container {
    id: page
    objectName : "Sparrow.Page 2.0"

    implicitWidth:  dp * 360
    implicitHeight: dp * 640

    //! TODO
    glow.visible: false

    default property alias data: pageContent.data

    property Item header: null
    //! override content
    readonly property alias content: pageContent
    //! override content
    property Item footer: null

    //! reset padding
    property alias padding : pageContent.anchors

    readonly property alias navigation: page.__navigation
    readonly property alias navigationStack: page.__navigationStack
    readonly property alias navigationSwipe: page.__navigationSwipe

    readonly property alias canNavigateBack: page.__canNavigateBack
    property bool navigationBarEnabled: true

    readonly property alias __headerItemParent: headerParent
    readonly property alias __footerItemParent: footerParent

    property Item __navigation: null
    property Item __navigationSwipe: null
    property Item __navigationStack: null
    property bool __canNavigateBack: false                   // 意思是可以通过键盘返回键返回

    //! TODO
    Keys.onBackPressed: {
        //! TODO changed Navigation to PageManager
        if(page != page.navigation) {
//            if(page.navigationSwipe) {
//                //!TODO
//                page.navigationSwipe.pop();
//            }
            if(page.navigationStack) {
                page.navigationStack.pop();
                //console.log("Page pop from Stack", page);
            }
            else {
                event.accepted = false;
            }
            event.accepted = true;

        } else {
            event.accepted = false;
        }
    }

    //! TODO
    Keys.onEscapePressed: {
        //! TODO changed Navigation to PageManager
        if(page != page.navigation) {
//            if(page.navigationSwipe) {
//                //!TODO
//                page.navigationSwipe.pop();
//            }
            if(page.navigationStack) {
                page.navigationStack.pop();
                //console.log("Page pop from Stack", page);
            }
            else {
                event.accepted = false;
            }
            event.accepted = true;

        } else {
            event.accepted = false;
        }
    }

    Binding {
        objectName: "Sparrow.Page$Binding:'page.header.parent bind page.headerParent' 2.0"
        target: header
        property: "parent"
        value: headerParent
    }

    Binding {
        objectName: "Sparrow.Page$Binding:'page.footer.parent bind page.footerParent' 2.0"
        target: footer
        property: "parent"
        value: footerParent
    }

    Item {
        id: pageContent
        objectName: "Sparrow.Page$PageContent 2.0"

        //! must set binding page.clip
        clip: page.clip

        anchors {
            top: headerParent.bottom
            bottom: footerParent.top
            right: parent.right
            left: parent.left
        }

        //! [role parent property] Container
        property real alias:  page.dpScale
        readonly property alias dp: page.dp

        property alias overlay: page.overlay
        readonly property alias content: page.content
        property alias background: page.background
        readonly property alias glow: page.glow

        readonly property alias __overlayParent: page.__overlayParent
        readonly property alias __backgroundParent: page.__backgroundParent

        property alias contentClip: page.contentClip
        property alias padding : page.padding

        readonly property alias window : page.window
        //! [role parent property]

        //! [role parent property] Page
        readonly property alias navigation: page.__navigation
        readonly property alias navigationStack: page.__navigationStack
        readonly property alias navigationSwipe: page.__navigationSwipe

        readonly property alias canNavigateBack: page.__canNavigateBack
        property bool navigationBarEnabled: page.navigationBarEnabled


        readonly property alias __headerItemParent: page.__headerItemParent
        readonly property alias __footerItemParent: page.__footerItemParent

        property alias __navigation: page.__navigation
        property alias __navigationSwipe: page.__navigationSwipe
        property alias __navigationStack: page.__navigationStack
        property alias __canNavigateBack: page.__canNavigateBack                   // 意思是可以通过键盘返回键返回
        //! [role parent property]

    }

    Item {
        id: headerParent
        objectName: "Sparrow.Page$HeaderParent 2.0"
        width: page.width
        height: headerParent.childrenRect.height
        anchors.top: parent.top
        anchors.topMargin: 0
        clip: true
    }

    Item {
        id: footerParent
        objectName: "Sparrow.Page$FooterParent 2.0"
        height: footerParent.childrenRect.height
        width: page.width
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        clip: true
    }
}


