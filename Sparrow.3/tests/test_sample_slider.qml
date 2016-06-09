import QtQuick 2.5
import Sparrow 3.0

AppWindow {

    width: 360 * dp * 2
    height: 640 * dp * 1.2

    Ticker {
        id: ticker
        Component.onCompleted: {
            ticker.tick(100, function(){
                if(progressBar.value < 1) {
                    progressBar.value += 0.01;
                } else {
                    progressBar.value = 0;
                }
            });
        }
    }

    SampleSlider {
        id: progressBar
        anchors.centerIn: parent
    }

}

