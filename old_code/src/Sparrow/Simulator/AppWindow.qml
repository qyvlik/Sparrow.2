import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

import Sparrow 2.0
import Sparrow.Private 2.0

ApplicationWindow {
    id: mainWindow

    width: dp * 360
    height: dp * 640

    property alias inputMethod: inputMethod
    property alias header: page.header
    property alias footer: page.footer
    default property alias data: page.data

    //! [role parent property] Container
    readonly property Item container: page
    readonly property Window window : page.window
    property alias padding : page.padding
    property alias contentClip: page.contentClip
    property Item background: page.background
    property Item overlay: page.overlay
    readonly property alias dp: page.dp
    property alias dpScale: page.dpScale
    //! [role parent property]

    //! [role parent property] Page
    readonly property alias navigationStack: page.__navigationStack
    readonly property alias __headerItemParent: page.__headerItemParent
    readonly property alias __footerItemParent: page.__footerItemParent
    property alias navigationBarEnabled: page.navigationBarEnabled
    readonly property alias canNavigateBack: page.canNavigateBack
    //! [role parent property]

    Page {
        id: page
        width: mainWindow.width
        height: mainWindow.height

        footer: Item {
            id: inputMethodParent
            width: page.width
            height: 0
            Behavior on height {
                NumberAnimation { duration: 300 }
            }
            SimilarKeyboard {
                id: inputMethod
                width: parent.width
                height: parent.height
                anchors.bottom: parent.bottom
                anchors.bottomMargin: -inputMethod.height

                Behavior on anchors.bottomMargin {
                    NumberAnimation { duration: 300 }
                }
                function show() {
                    inputMethodParent.height = page.height * 0.3;
                    inputMethod.anchors.bottomMargin = 0;
                }
                function hide() {
                    inputMethodParent.height =0;
                    inputMethod.anchors.bottomMargin = -inputMethod.height;
                }
                onKeyPressed : {
                    if(typeof mainWindow.activeFocusItem.insert == "function") {
                        mainWindow.activeFocusItem.insert(mainWindow.activeFocusItem.cursorPosition, key);
                    } else {
                        console.log("ERROR")
                    }
                }
            }

            //Tracker {}
        }

    }
}

