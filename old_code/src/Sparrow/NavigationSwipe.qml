import QtQuick 2.5
import QtQuick.Controls 1.4
import Sparrow 2.0
import Sparrow.Private 2.0

PageManager {
    id: navigationSwipe

    implicitHeight: dp * 640
    implicitWidth: dp * 360

    objectName: "Sparrow.NavigationSwipe 2.0"
    content.objectName: "Sparrow.NavigationSwipe$Container 2.0"

    __currentPage: view.model[view.currentIndex]
    //! overwrite
    __canNavigateBack: false
    property alias currentIndex: view.currentIndex

    default property alias _page: navigationSwipe.__pages

    on__PagesChanged: {
        for(var iter in __pages) {
            __pages[iter].__navigation = Qt.binding(function(){
                return navigationSwipe.navigation;
            });
            __pages[iter].__navigationSwipe = navigationSwipe;
            __pages[iter].parent = navigationSwipe.content;
            __pages[iter].visible = false;
        }
    }

    ListView {
        id: view
        anchors.fill: parent

        model: navigationSwipe.__pages

        currentIndex: 0
        preferredHighlightBegin: 0
        preferredHighlightEnd: 0
        highlightMoveDuration: 250
        highlightRangeMode: ListView.StrictlyEnforceRange
        snapMode: ListView.SnapOneItem
        boundsBehavior: ListView.StopAtBounds
        orientation: ListView.Horizontal

        delegate: navigationSwipDelegate

        Component {
            id: navigationSwipDelegate
            Item {
                id: swipeItem
                width: view.width
                height: view.height
                property bool swipeItemDeath: false
                property Page page: view.model[index]

                Binding {
                    when: !swipeItem.swipeItemDeath
                    target: swipeItem.page
                    property:"visible"
                    value: !swipeItem.swipeItemDeath
                }
                Binding {
                    when: !swipeItem.swipeItemDeath
                    target: swipeItem.page
                    property:"parent"
                    value: swipeItem
                }

                Binding {
                    when: !swipeItem.swipeItemDeath
                    target: swipeItem.page
                    property: "implicitWidth"
                    value: swipeItem.width
                }

                Binding {
                    when: !swipeItem.swipeItemDeath
                    target: swipeItem.page
                    property: "implicitHeight"
                    value: swipeItem.height
                }

                Component.onDestruction: {
                    swipeItem.swipeItemDeath = true;
                    //! 设置 Page 的 parent
                    try {
                        swipeItem.page = navigationSwipe.content;
                        swipeItem.page.visible = false;
                    } catch(e) {

                    }
                }
            }
        }
        Component.onCompleted: positionViewAtIndex(0, ListView.Beginning)
    }

    //! TODO
    function insertPage(index, componet) {
    }

    //! TODO
    function remove(index) {

    }

}

