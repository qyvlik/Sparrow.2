import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

import Sparrow.Private 2.0

/*
  Navigation 值管理 NavigationItem 的孩子
  不管理 NavigationItem 的孩子的孩子
*/

Page {
    id: navigation

    objectName: "Sparrow.Navigation 2.0"

    //! overwrite content.objectName
    content.objectName: "Sparrow.Navigation$PageContent 2.0"

    //! overwrite __canNavigateBack
    __canNavigateBack: false
    __navigation: navigation
    __navigationSwipe: null
    __navigationStack: null

    header: NavigationBar { id: navigationBar_ }

    Behavior on __headerItemParent.height { NumberAnimation { } }

    navigationBarEnabled: __currentPage
                          ?  __currentPage.navigationBarEnabled
                          :  false


    default property alias navigationItems: navigationPrivate.__navigationItems

    property Drawer drawer: null
    readonly property alias navigationBar: navigationBar_

    //! list<Page>
    readonly property alias pages: navigationPrivate.__pages
    readonly property alias currentIndex: navigation.__currentIndex
    readonly property alias currentPage: navigation.__currentPage
    readonly property int count: navigationItems.length
    property int __currentIndex: 0
    property int __preCurrentIndex: 0

    //! TODO Type Fix
    property Container __currentPage: null

    focus: true
    //! TODO KEY navigation
    Keys.onEscapePressed: {
        if(drawerlayer.isShow) {
            //console.log("drawerlayer.isShow:", drawerlayer.isShow)
            drawerlayer.hide();
        } else {
            //! TODO
            if(currentPage.canNavigateBack
                    && currentPage.objectName === "Sparrow.NavigationStack 2.0") {
                currentPage.forceActiveFocus();
                currentPage.pop();
                return;
            } else {
                __setCurrentIndex(0);
            }

        }
        event.accepted = true;
    }

    //! TODO KEY navigation
    Keys.onBackPressed: {
        if(drawerlayer.isShow) {
            //console.log("drawerlayer.isShow:", drawerlayer.isShow)
            drawerlayer.hide();
        } else {
            //! TODO
            if(currentPage.canNavigateBack
                    && currentPage.objectName === "Sparrow.NavigationStack 2.0") {
                currentPage.forceActiveFocus();
                currentPage.pop();
                return;
            } else {
                __setCurrentIndex(0);
            }

        }
        event.accepted = true;
    }

    Binding {
        objectName: "Sparrow.Navigation$Binding 'navigationBar_.parent.height bind navigationBar_.parent.childrenRect.height or 0' 2.0"
        target: navigationBar_.parent
        property: "height"
        value: navigationBarEnabled && navigationBar_.parent
               ? navigationBar_.parent.childrenRect.height
               : 0
    }

    // Drawer Operator
    Binding {
        objectName: "Sparrow.Navigation$Binding 'navigation.drawer.__navigation bind navigation' 2.0"
        target: drawer
        property: "__navigation"
        value: navigation
    }

    Binding {
        objectName: "Sparrow.Navigation$Binding 'navigation.drawer.parent bind drawerParent' 2.0"
        target: drawer
        property: "parent"
        value: drawerParent
    }

    Binding {
        target: drawer
        objectName: "Sparrow.Navigation$Binding 'navigation.drawer.__model bind navigationPrivate.__pagesInfo' 2.0"
        property: "__model"
        value: navigationPrivate.__pagesInfo
    }

    Connections {
        id: conneciton
        target: drawer
        onSelect: {
            __setCurrentIndex(index);
            drawerlayer.hide();
        }
    }

    // Drawer Operator

    QtObject {
        id: navigationPrivate
        objectName: "Sparrow.Navigation$NavigationPrivate 2.0"
        property var __pagesInfo: []
        property var __pages: []
        // 拿到所有的 NavigationItem
        // 设置 NavigationItem 的 parent
        // 设置 NavigationItem 所带 Page 的 visible
        property list<NavigationItem> __navigationItems
        on__NavigationItemsChanged: {
            __pagesInfo.length = 0;
            for(var iter in __navigationItems) {
                // 设置正确的 parent
                __navigationItems[iter].parent = navigation.content;
                __navigationItems[iter].page.visible = false;
                var pageInfo = {
                    "pageTitle":  __navigationItems[iter].title,
                    "pageIcon":  __navigationItems[iter].icon,
                    "pageIndex": iter,
                    "page":  __navigationItems[iter].page,
                };
                __pagesInfo.push(pageInfo);
            }
            if(__navigationItems[__currentIndex]) {
                __navigationItems[__currentIndex].page.visible = true;
                // 记得初始化第一个页面
                __currentPage = __navigationItems[__currentIndex].page;
            }
            __pagesInfoChanged();
        }
    }

    Binding {
        objectName: "Sparrow.Navigation$Binding:'navigation.pages bind navigation.content.children' 2.0"
        target: navigationPrivate
        property: "__pages"
        value: {
            var pages_ = [];
            for(var iter in content.children) {
                var page = content.children[iter];
                if(page.objectName === "Sparrow.Page 2.0"
                        || page.objectName === "Sparrow.NavigationStack 2.0"
                        || page.objectName === "Sparrow.NavigationSwipe 2.0")
                {
                    pages_.push(page);
                }
            }
            return pages_;
        }
    }

    overlay: Item {
        id: drawerlayer
        objectName: "Sparrow.Navigation$DrawerLayer 2.0"

        anchors.fill: parent
        clip: true
        visible: drawer != null

        readonly property bool isShow: dragItem.x == 0

        onIsShowChanged: {
            if(isShow) {
                navigation.forceActiveFocus();
            }
        }

        Rectangle {
            anchors.fill: parent
            color: "black"
            opacity: 0.5 - Math.abs(dragItem.x/dragItem.hideX)
        }

        function show() {
            dragItem.x = 0;
        }

        function hide() {
            dragItem.x = dragItem.hideX;
        }

        MouseArea {
            id: dragItem
            preventStealing: false
            height: parent.height
            width: parent.width
            readonly property real hideX: -(width*0.95)
            x: hideX
            drag.target: dragItem
            drag.axis: Drag.XAxis
            drag.maximumX: 0
            drag.minimumX: hideX
            //! [关键]
            // 如果在 MouseArea 上还有一个 ListView 的话，设置为 true 即可
            drag.filterChildren: true

            Behavior on x { NumberAnimation { duration: 300 } }

            onReleased: {
                if(x > hideX / 2) {
                    drawerlayer.show();
                } else {
                    drawerlayer.hide();
                }
            }

            Container {
                id: drawerParent
                objectName: "Sparrow.Navigation$DrawerLayer$DrawerParent 2.0"
                content.objectName: "Sparrow.Navigation$DrawerLayer$DrawerParent$Container 2.0"
                glow.visible: false
                width: parent.width
                height: parent.height
            }
        }

        MouseArea {
            width: parent.width <= parent.height ? parent.width * 0.2 : parent.width * 0.6
            height: parent.height
            anchors.right: parent.right
            visible: dragItem.x === 0
            onClicked: {
                if(dragItem.x === 0) dragItem.x = dragItem.hideX ;
            }
        }
    }

    function showDrawer() {
        drawerlayer.show();
    }

    function hideDrawer() {
        drawerlayer.hide();
    }

    //! TODO
    function __setCurrentIndex(index) {
        __preCurrentIndex = __currentIndex;
        __currentIndex = index;
    }

    on__CurrentIndexChanged: {
        navigationPrivate.__pagesInfo[__preCurrentIndex]["page"].visible = false;
        navigationPrivate.__pagesInfo[__currentIndex]["page"].visible = true;
        try {
            navigationPrivate.__pagesInfo[__currentIndex]["page"].forceActiveFocus();
        } catch(e) {
            console.log(e)
        }

        //! TODO
        __currentPage = navigationPrivate.__pagesInfo[__currentIndex]["page"];
    }

    //! TODO
    function isCurrentPage(page) {
        return false;
    }

    //! TODO
    //! Bug
    function removeNavigationItem(index) {
        var navigationItems_ = [];
        for(var iter in navigationPrivate.__navigationItems) {
            if(iter === index) {
                continue;
            } else {
                navigationItems_.push(navigationPrivate.__navigationItems[iter]);
            }
        }
        navigationPrivate.__navigationItems = navigationItems_;
    }

    //! TODO
    //! Bug
    function insertNavigationItem (index, component) {
        var navigationItem_ = component.createObject(navigation);
        if(navigationItem_) {

            var navigationItems_ = [];
            var length = navigationPrivate.__navigationItems.length + 1;
            var flag = false;           // insert ?
            for(var iter = 0; iter < length; iter++) {
                if(iter === index) {
                    navigationItems_.push(navigationItem_);
                    flag = true;
                } else {
                    if(flag) {
                        navigationItems_.push(navigationPrivate.__navigationItems[iter-1]);
                    } else {
                        navigationItems_.push(navigationPrivate.__navigationItems[iter]);
                    }
                }
            }
            navigationPrivate.__navigationItems = navigationItems_;
            //! Set __currentPage
            //console.debug("insertNavigationItem: ", navigationItems_);
            navigationItem_.page.visible = false
        } else {
            console.log(component.errorString());
        }

        return navigationItem_;
    }

}

