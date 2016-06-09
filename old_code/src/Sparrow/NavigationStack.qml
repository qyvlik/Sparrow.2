import QtQuick 2.5
import QtQuick.Controls 1.4
import Sparrow 2.0
import Sparrow.Private 2.0

PageManager {
    id: navigationStack

    objectName: "Sparrow.NavigationStack 2.0"
    content.objectName: "Sparrow.NavigationStack$Content 2.0"
    __currentPage: stackView.currentItem


//    __navigationBarEnabled: navigationStack.__currentPage
//                             ? navigationStack.__currentPage.navigationBarEnabled
//                             : false

//    __canNavigateBack: __currentPage ? __currentPage.__canNavigateBack : false

    readonly property alias busy: stackView.busy
    default property Page initPage: null
    readonly property alias depth: stackView.depth

    Binding {
        objectName: "Sparrow.NavigationStack$Binding:'navigationStack.initPage.__navigation bind navigationStack.navigation' 2.0"
        target: initPage
        property: "__navigation"
        value: navigationStack.__navigation
    }

    Binding {
        objectName: "Sparrow.NavigationStack$Binding:'navigationStack.initPage.__navigationStack bind navigationStack' 2.0"
        target: initPage
        property: "__navigationStack"
        value: navigationStack
    }

    StackView {
        id: stackView
        objectName: "Sparrow.NavigationStack$StackView 2.0"

        anchors.fill: parent

        initialItem: navigationStack.initPage

        //! [role parent property] Container
        property real alias:  navigationStack.dpScale
        readonly property alias dp: navigationStack.dp

        property alias overlay: navigationStack.overlay
        readonly property alias content: navigationStack.content
        property alias background: navigationStack.background
        readonly property alias glow: navigationStack.glow

        readonly property alias __overlayParent: navigationStack.__overlayParent
        readonly property alias __backgroundParent: navigationStack.__backgroundParent

        // Don't set clip true
        // set contentClip true or false
        property alias contentClip: navigationStack.contentClip
        property alias padding : navigationStack.padding

        readonly property alias window : navigationStack.window
        //! [role parent property]

        //! [role parent property] PageManager
        readonly property bool navigationBarEnabled: navigationStack.navigationBarEnabled
        readonly property alias currentPage: navigationStack.currentPage
        readonly property alias pages: navigationStack.pages
        readonly property alias navigation: navigationStack.navigation
        //! [role parent property] PageManager

        delegate: StackViewDelegate {
            function transitionFinished(properties)
            {
                properties.exitItem.opacity = 1
            }

            pushTransition: StackViewTransition {
                PropertyAnimation {
                    target: enterItem
                    property: "opacity"
                    from: 0
                    to: 1
                }
                PropertyAnimation {
                    target: exitItem
                    property: "opacity"
                    from: 1
                    to: 0
                }
            }
        }
    }

    function clear() {
        stackView.clear();
    }

    //! TODO
    function push(aComponent, properties) {
        var n = navigationStack.navigation;

        properties = properties || {};
        properties["parent"] = navigationStack.__navigation;
        properties["__navigationStack"] = navigationStack;
        properties["focus"] = true;
        properties["__navigation"] = navigationStack.__navigation;

        var pushPage = stackView.push( { item: aComponent, properties:properties } );
        pushPage.__canNavigateBack = Qt.binding(function(){
            return stackView.depth > 1;
        });
        pushPage.forceActiveFocus();
        //! TODO 如何移交键盘焦点
        //        pushPage.Component.destruction.connect(function(){
        //            pushPage.Component.destruction.disconnect(arguments.callee);
        //            console.log(pushPage)
        //        });
        //        pushPage

    }

    function pop() {
        var popPage = stackView.pop();
        //! TODO
        if(currentPage ) {
            if(depth > 1) {
                currentPage.forceActiveFocus();
            } else {
                currentPage.navigation.forceActiveFocus();
            }
        }
    }


}

