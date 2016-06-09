import QtQuick 2.5

Canvas {
    id: circularImage

    property url source
    property color borderColor: "black"
    property real borderWidth: 4

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

    onSourceChanged: {
        circularImage.loadImage(source)
    }
}
