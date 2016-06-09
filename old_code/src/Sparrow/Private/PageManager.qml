import QtQuick 2.0
import Sparrow 2.0

Container {
    id: pageManager
    objectName: "Sparrow.Private.PageManager 2.0"
    content.objectName: "Sparrow.Private.PageManager$Container 2.0"

    readonly property alias navigationBarEnabled: pageManager.__navigationBarEnabled
    readonly property alias currentPage: pageManager.__currentPage
    readonly property alias pages: pageManager.__pages
    readonly property alias navigation: pageManager.__navigation
    readonly property alias canNavigateBack: pageManager.__canNavigateBack

    property Page __currentPage: null
    //! TODO Fix Type Item
    //! 这里不能使用 Navigation 类型
    property Item __navigation: null
    property list<Page> __pages
    property bool __navigationBarEnabled: pageManager.__currentPage && pageManager.__currentPage.navigationBarEnabled
    property bool __canNavigateBack:  pageManager.__currentPage ? pageManager.__currentPage.__canNavigateBack : false

    //! TODO KEY navigation
    onActiveFocusChanged: {
        if(activeFocus && currentPage && currentPage.canNavigateBack) {
            currentPage.forceActiveFocus();
        } else if(activeFocus && navigation) {
            // 要把焦点返还给 Navigation

            //console.log("back key focus to navigation")
            navigation.forceActiveFocus();
        }
    }

    function __qmlListPropertyInsert(qmllistproperty, index, item) {
        if(index > qmllistproperty.length) return qmllistproperty;
        var  qmllistproperty_ = [];
        var length = qmllistproperty.length + 1;

        var flag = false;           // insert ?
        for(var iter = 0; iter < length; iter++) {
            if(iter === index) {
                 qmllistproperty_.push(item);
                flag = true;
            } else {
                if(flag) {
                     qmllistproperty_.push(qmllistproperty[iter-1]);
                } else {
                     qmllistproperty_.push(qmllistproperty[iter]);
                }
            }
        }
        return qmllistproperty_;
    }


    function __qmlListPropertyRemove(qmllistproperty, index) {
        if(index > qmllistproperty.length-1) return qmllistproperty;
        var  qmllistproperty_ = [];
        for(var iter in qmllistproperty) {
            if(iter === index) {
                continue;
            } else {
                 qmllistproperty_.push(qmllistproperty[iter]);
            }
        }
        return qmllistproperty_;
    }

}

