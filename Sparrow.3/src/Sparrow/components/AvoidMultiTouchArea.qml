import QtQuick 2.5

MouseArea {
    property real internal: 500
    property double __clickedTime: new Date().getTime()
    property double __clickedTimes: 0
    signal validClicked(var mouse)

    onClicked: {
        var old = __clickedTime;
        var current = new Date().getTime();
        var offest = current-old
        if(offest >= internal) {
            __clickedTimes = 0;
            validClicked(mouse);
        } else {
            __clickedTimes+=offest;
            if(__clickedTimes > 500) {
                __clickedTimes = 0;
                validClicked(mouse);
            }
        }
        __clickedTime = current;
    }
}
