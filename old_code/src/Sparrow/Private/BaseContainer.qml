// Qt 5.5.1

import QtQuick 2.5
import QtQuick.Window 2.0

Item {
    id: basePage
    property Window __window
    onWindowChanged: {
        // QQuickView -> QQuickWindow -> QWindow -> Window -> ApplicationWindow -> PageStackWindow
        //console.debug(window);
        __window = window;
    }
}

