//! [QtQuick之Canvas图像圆角遮罩]
//! (http://blog.csdn.net/esonpo/article/details/37762239)

import QtQuick 2.0
import Sparrow.Private 2.0

Container {

    width: dp * 64
    height: dp * 64
    property url source
    property color borderColor: "black"
    property real borderWidth: dp * 4

    Canvas {
        id: circularImage
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d");
            ctx.lineWidth = borderWidth;

            // store current context setup
            ctx.save()
            ctx.strokeStyle = borderColor;
            ctx.beginPath()
            ctx.arc(circularImage.width/2,
                    circularImage.height/2,
                    circularImage.width/2,
                    0,
                    Math.PI * 2, true);
            ctx.closePath();

            // create clip from triangle path
            ctx.clip();
            // drawImage(variant image, real dx, real dy, real dw, real dh)
            ctx.drawImage(source,
                          0, 0,
                          circularImage.width,
                          circularImage.height)
            ctx.closePath();
            ctx.stroke();
            ctx.restore();
        }

    }

    onSourceChanged: {
        circularImage.loadImage(source)
    }
    Component.onCompleted: {
        circularImage.loadImage(source)
    }

}


