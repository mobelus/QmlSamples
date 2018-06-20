import QtQuick 2.0

//Item {

/*
//    Item
//        {
            id: mainContainer
            height: 100
            width: 100
            x: 200
            y: 200

            Canvas
            {
                id: drawingCanvas
                anchors.fill: parent
                onPaint:
                {
                    var ctx = getContext("2d")

                    ctx.fillStyle = "white"
                    ctx.fillRect(0,0,drawingCanvas.width ,drawingCanvas.height )

                    ctx.lineWidth = 15
                    ctx.strokeStyle = "red"
                    ctx.beginPath()
                    ctx.moveTo(drawingCanvas.width / 2, 0)
                    ctx.lineTo((drawingCanvas.width / 2) + 10, 0)
                    //ctx.closePath()
                    ctx.stroke()
                }
            }
//        }
//*/




/*
    Canvas {
        x: 65
        y: 56
        width: 478; height: 282
        clip: false
        opacity: 1
        visible: true
        contextType: "2d"

        Path {
            id: myPath
            startX: 0; startY: 100

            PathCurve { x: 75; y: 75 }
            PathCurve { x: 200; y: 150 }
            PathCurve { x: 325; y: 25 }
            PathCurve { x: 400; y: 100 }
        }

        onPaint: {
            context.strokeStyle = Qt.rgba(.4,.6,.8);
            context.path = myPath;
            context.stroke();
        }
    }

//*/



/*

    Rectangle {
        id: app
        x: 64
        y: 39
        width: 360
        height: 360

        PathView {
            id: pathView
            objectName: "view"
            x: (app.width-pathView.width)/2
            y: 100
            width: 240
            height: 100

            model: testModel

            Rectangle {
                anchors.fill: parent
                color: "white"
                border.color: "black"
            }
            preferredHighlightBegin: 0.5
            preferredHighlightEnd: 0.5

            delegate: Rectangle {
                objectName: "wrapper"
                width: 100
                height: 100
                color: PathView.isCurrentItem ? "red" : "yellow"
                Text {
                    text: index
                    anchors.centerIn: parent
                }
                z: (PathView.isCurrentItem?1:0)
            }
            path: Path {
                id: path
                startX: -100+pathView.width/2
                startY: pathView.height/2
                PathLine {
                    id: line
                    x: 100+pathView.width/2
                    y: pathView.height/2
                }
            }
        }
    }

*/

/*
    Canvas {
        x: 65
        y: 56
        width: 478; height: 282
        clip: false
        opacity: 1
        visible: true
        contextType: "2d"

        onPaint: {
            context.strokeStyle = Qt.rgba(.4,.6,.8);
            context.path = myPath;
            context.stroke();
        }
    }


    Component.onCompleted:
    {
        /*
        var component = Qt.createComponent("SelfDestroyingRect.qml");
        for (var i=0; i<5; i++)
        {
            var object = component.createObject(container);
            object.x = (object.width + 10) * i;
        }
        */


/*
        // the triangle
        context.beginPath();
        context.moveTo(100, 100);
        context.lineTo(100, 300);
        context.lineTo(300, 300);
        context.closePath();

        var canvasElement = document.querySelector("#myCanvas");
        var context = canvasElement.getContext("2d");

        // the triangle
        context.beginPath();
        context.moveTo(100, 100);
        context.lineTo(100, 300);
        context.lineTo(300, 300);
        context.closePath();

        // the outline
        context.lineWidth = 10;
//        context.strokeStyle = '#666666';
//        context.stroke();

        // the fill color
//        context.fillStyle = "#FFCC00";
//        context.fill();

    }


*/

/*

                id: mainContainer
                height: 300
                width: 300
                x: 10
                y: 10

                Canvas
                {
                    id: drawingCanvas
                    anchors.fill: parent
                    onPaint:
                    {
                        var ctx = getContext("2d")

//                        ctx.fillStyle = "white"
//                        ctx.fillRect(0,0,drawingCanvas.width ,drawingCanvas.height )
                        ctx.lineWidth = 15
                        ctx.strokeStyle = "red"

                        ctx.beginPath()
                        ctx.moveTo(100, 100);
                        ctx.lineTo(100, 300);
                        ctx.lineTo(300, 300);
                        ctx.closePath();

                        ctx.stroke()
                    }
                }




}
*/



Item
{
    width: 300
    height: 300

    Canvas
    {
    //    id: drawingCanvas
        anchors.fill: parent
        onPaint:
        {
        var ctx = getContext("2d")

//                        ctx.fillStyle = "white"
//                        ctx.fillRect(0,0,drawingCanvas.width ,drawingCanvas.height )
        ctx.lineWidth = 15
        ctx.strokeStyle = "red"

        ctx.beginPath()
        ctx.moveTo(100, 100);
        ctx.lineTo(100, 300);
        ctx.lineTo(300, 300);
        ctx.closePath();

        ctx.stroke()
        }
    }
}
