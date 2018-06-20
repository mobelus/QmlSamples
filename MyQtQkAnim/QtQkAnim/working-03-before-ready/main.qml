import QtQuick 2.6
import QtQuick.Window 2.2
import QtQuick.Controls 2.1

import "componentCreation.js" as MyScript

Window {
    id: root

    visible: true
    width: 800
    height: 800
    title: qsTr("Hello World")

    Timer {
        id: timer
    }

    function delay_time(delayTime) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.start();
    }

    function delay(delayTime, cb) {
        timer.interval = delayTime;
        timer.repeat = false;
        timer.triggered.connect(cb);
        timer.start();
    }


    Button
    {
        id: btnWarning
        text: "Start Warning!"

        property int clickTimes: 0
        y: 100
        x: root.width - width

        onClicked:
        {
            if(btnWarning.clickTimes % 2 == 0)
            {
                var component = Qt.createComponent("BlinkingCircle.qml");
                for (var i=0; i<1; i++)
                {

                    var object = component.createObject(container, {
                        x: root.width / 2 - width / 2
                        , y: root.height / 2 - height / 2
                        , width: 50
                        , sizingKoeff: 1
                        , sizeMax: 200
                        , sizeMin: 40
                        , durationMax: 3000
                        , index: i

                        , timeoutBeforeStart: true
                                                        })
                        //boxBlinking.animStartAfter


                    //delay(1000, function() { print("And I'm printed after 1 second!") } )
                    //  Каждому объекту при создании задаём время сколько анимация должна запаузиться
                    // PauseAnimation { duration: 100 }

                    //object.durationPauseOfItem = (object.durationRing) * i
                }

                btnWarning.text = "STOP Warning !!!!"
            }
//            else
//            {
//                btnWarning.text = "Start Warning !!!!"
//            }
//            btnWarning.clickTimes++;
        }
    }

    Item {
        id: containerWarning
        anchors.fill: parent
        //width: root.width
        //height: root.height
    }




    Button
    {
        id: btnError
        text: "Start Error!"

        property int clickTimes: 0
        y: 0
        x: root.width - width

        onClicked:
        {
            if(btnError.clickTimes % 2 == 0)
            {
                // start erroring

                var component = Qt.createComponent("SelfDestroyingRect.qml");
                for (var i=0; i<5; i++)
                {
                    var object = component.createObject(container)
                    delay(1000, function() { print("And I'm printed after 1 second!") } )
                    object.x = (object.width + 10) * i
                }

                btnError.text = "STOP Error !!!!"
            }
            else
            {
                // stop erroring

                btnError.text = "Start Error !!!!"
            }
            btnError.clickTimes++;
        }

    }

    Item {
        id: container
        width: 500; height: 100
    }





/*
    Text{ x: 0;   y: 50;   text: "rMax " + boxUnder.sizeMax;}
    Text{ x: 0;   y: 60;   text: "rMin " + boxUnder.sizeMin;}
    Text{ x: 0;   y: 70;   text: "numRings " + boxUnder.numRings;}
    Text{ x: 0;   y: 80;   text: "durationMax " + boxUnder.durationMax;}
    Text{ x: 0;   y: 90;   text: "durationRing " + boxUnder.durationRing;}
    //Text{ x: 0;   y: 100;  text: "rMax " + boxUnder.rMax;}
*/

/*
    Rectangle {
        id: rectangle
        color: "yellow"
        anchors.fill: parent
        anchors.margins: 100
        opacity: 0

// https://stackoverflow.com/questions/28507619/how-to-create-delay-function-in-qml

        Behavior on opacity {
            NumberAnimation {
                duration: 500
            }
        }
    }
*/

    Component.onCompleted: {


        print("I'm printed right away 1 ..")
        delay(1000, function() {
            print("And I'm printed after 1 second 1 !")
            rectangle.opacity = 1
        })
/*
        print("I'm printed right away 2 ..")
         delay(1000, function() {
             print("And I'm printed after 1 second 2 !")
             rectangle.opacity = 0
        })

        print("I'm printed right away 3 ..")
         delay(1000, function() {
             print("And I'm printed after 1 second 3 !")
             rectangle.opacity = 1
        })
*/
    }


    // https://stackoverflow.com/questions/27547894/qml-adding-content-dynamically-to-a-sequentialanimation

/*
    Component
    {
        id: component
        SequentialAnimation
        {
            id: seq
            property string color
            PropertyAction {target: boxUnder; property: "color"; value: seq.color}
            PauseAnimation { duration: 500 }
        }
    }
*/

/*
    BlinkingCircle
    {
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2
        width: 50

        sizingKoeff: 1
        sizeMax: 200
        sizeMin: 40
        durationMax: 3000
        durationPause: 5000

        timeoutBeforeStart: true
        //boxBlinking.animStartAfter
    }
//*/



    // http://doc.qt.io/qt-5/qml-qtquick-propertyanimation.html
    Rectangle {
        id: rct
        width: 100; height: 100
        y: 400
        color: "blue"

        states: State {
            name: "moved"
            PropertyChanges { target: rct; x: 50 }
        }

        transitions: Transition {
            PropertyAnimation { properties: "x,y"; easing.type: Easing.InOutQuad }
        }
    }


    // https://stackoverflow.com/questions/20514679/how-to-write-a-number-animation-on-the-mouse-button-press-event-in-qml

    Rectangle
    {
      id: rect_click
      width: 100; height: 100
      y: 250
      color: "black"

       MouseArea
       {
        anchors.fill: parent

        onPressed:
        {
            animation_unique.start()
        }

        NumberAnimation
        {
            id: animation_unique
            target: rect_click
            property: "x"
            to: 50;
            duration: 1000
        }
      }
    }




    // https://searchcode.com/codesearch/view/37099871/

    // RECTANGLE WITH A LEAF
    Rectangle {
        id: rect
        width: 120
        height: 200
        color: "white"

        Image {
            id: img
            source: "/image/leaf.png"
            x: 60-width/2
            y: 200-img.height
            SequentialAnimation on y {
                loops: Animation.Infinite
                NumberAnimation {
                    to: 0; duration: 500
                    easing.type: "InOutQuad"
                }
                NumberAnimation {
                    to: 200-img.height
                    easing.type: "OutBounce"
                    duration: 2000
                }
                PauseAnimation {
                    duration: 1000
                }
            }
        }
    }


/*
    Rectangle
    {
        id: boxUnder
        //x: boxOver.x
        //y: boxOver.y
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2
        radius: 25

        //width: boxOver.width
        //height: boxOver.height
        width: 50
        height: 50
        color: "green"
        opacity: 1

        property int someIntNumber
        property double someDoubleNumber
        property string someString
        property url someUrl

        property int sizingKoeff: 1
        property int sizeMax: 200
        property int sizeMin: 40
        //property int durationMax: 3000

        //property int rMax: 3000
        //property int rMin: 500
        property int numRings: (sizeMax / sizeMin)
        //property int numRings: (rMax / rMin)
        property int durationMax: 3000
        property int durationRing: (durationMax / numRings)
        property int durationPause: 0

        NumberAnimation on radius
        {
            from: 0;
            to: (boxUnder.sizeMax * boxUnder.sizingKoeff) / 2;
            duration: boxUnder.durationMax;
            loops: Animation.Infinite
        }

        NumberAnimation on width
        {
            from: 0;
            to: (boxUnder.sizeMax * boxUnder.sizingKoeff);
            duration: boxUnder.durationMax;
            loops: Animation.Infinite
        }

        NumberAnimation on height
        {
            from: 0;
            to: (boxUnder.sizeMax * boxUnder.sizingKoeff);
            duration: boxUnder.durationMax;
            loops: Animation.Infinite
        }

        //NumberAnimation on opacity
        OpacityAnimator on opacity
        {
            from: 0.0
            to: 1.0
            duration: boxUnder.durationMax
            loops: Animation.Infinite
        }

    }
*/

    /*
    NumberAnimation on width {
        from: width
        to: width * 2
        duration: 10000
        loops: Animation.Infinite
    }

    NumberAnimation on height {
        from: height
        to: height * 2
        duration: 10000
        loops: Animation.Infinite
    }
    */

    /*
    NumberAnimation on x
    {
        to: root.width //500
        duration: 10000
    }

    NumberAnimation on y
    {
        to: root.height //500
        duration: 10000
    }
    */

    /*
    RotationAnimation on rotation
    {
        from: 0
        to: 360
        duration: 1000
        loops: Animation.Infinite
    }
    */

    /*      NumberAnimation on x
            {
                from: 0;
                to: boxUnder.sz;
                duration: 1000;
                loops: Animation.Infinite
            }
    */



/*
    Rectangle
    {
        id: boxOver
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2

        width: 50
        height: 50
        color: "green"
        opacity: 0.0
    }
*/

    /*
    NumberAnimation
    {
        id: animOpacity
        target: box
        running: true

        properties: "opacity"

        from: 1.0
        to: 0.0
        duration: 1000
        loops: Animation.Infinite
    }
    */

/*
    MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }
    }
*/


    Canvas {
                  id: triangle
                  antialiasing: true

                  x: 100
                  y: 100

                  property int triangleWidth: 100
                  property int triangleHeight: 100
                  property color strokeStyle:  "black" //"#ffffff"
                  property color fillStyle: "black" //"#ffffff"
                  property int lineWidth: 3
                  property bool fill: false
                  property bool stroke: true
                  property real alpha: 1.0
                  states: [
                      State {
                          name: "pressed"; when: ma1.pressed
                          PropertyChanges { target: triangle; fill: true; }
                      }
                  ]

                  onLineWidthChanged:requestPaint();
                  onFillChanged:requestPaint();
                  onStrokeChanged:requestPaint();

                  signal clicked()

                  onPaint: {
                      var ctx = getContext("2d");
                      ctx.save();
                      ctx.clearRect(0,0,triangle.width, triangle.height);
                      ctx.strokeStyle = triangle.strokeStyle;
                      ctx.lineWidth = triangle.lineWidth
                      ctx.fillStyle = triangle.fillStyle
                      ctx.globalAlpha = triangle.alpha
                      ctx.lineJoin = "round";
                      ctx.beginPath();
                      // put rectangle in the middle
                      ctx.translate( (0.5 *width - 0.5*triangleWidth), (0.5 * height - 0.5 * triangleHeight))
                      // draw the rectangle
                      ctx.moveTo(0,triangleHeight/2 ); // left point of triangle
                      ctx.lineTo(triangleWidth, 0);
                      ctx.lineTo(triangleWidth,triangleHeight);

                      ctx.closePath();
                      if (triangle.fill)
                          ctx.fill();
                      if (triangle.stroke)
                          ctx.stroke();
                      ctx.restore();
                  }

                  MouseArea{
                      id: ma1
                      anchors.fill: parent
                      onClicked: parent.clicked()
                  }
    }

}
