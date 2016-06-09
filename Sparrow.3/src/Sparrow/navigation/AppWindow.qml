import QtQuick 2.5
import QtQuick.Controls 1.4
import QtQuick.Window 2.0

ApplicationWindow {
    property real dpScale:  1.5
    readonly property real dp: Math.max(Screen.pixelDensity * 25.4 / 160 * dpScale, 1)

    width: 360 * dp
    height: 640 * dp
}

