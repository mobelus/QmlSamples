import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    id: root

    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

/*
    Rectangle
    {
        id: container;
        width: 700
        height: 700

        function goForIt(parent) {
            parent.x = (Math.floor(Math.random()*600));
            parent.y = (Math.floor(Math.random()*600));
            bounceAnimation.start();
        }

        Image {
            id: head;
            source: "/image/leaf.png";
            x: 0
            y: 0
            height: 80;
            width: 90;
            MouseArea {
                anchors.fill: parent
                onClicked: goForIt(parent);
            }
            Behavior on x {
                PropertyAnimation {
                    target: head;
                    properties: "x";
                    duration: 1000;
                }
            }
            Behavior on y {
                PropertyAnimation {
                    target: head;
                    properties: "y";
                    duration: 1000;
                }
            }

            transform: Scale {
                id: scaleTransform
                property real scale: 1
                xScale: scale
                yScale: scale
            }

            SequentialAnimation {
                id: bounceAnimation
                loops: 1
                PropertyAnimation {
                    target: scaleTransform
                    properties: "scale"
                    from: 1.0
                    to: 2.0
                    duration: 500
                }
                PropertyAnimation {
                    target: scaleTransform
                    properties: "scale"
                    from: 2.0
                    to: 1.0
                    duration: 500
                }
            }
        }
    }
*/

    Rectangle
    {
        id: boxUnder
        //x: boxOver.x
        //y: boxOver.y
        x: root.width / 2 - width / 2
        y: root.height / 2 - height / 2

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

        property double sizingKoeff: 2.0

        //*
        NumberAnimation on width
        {
            from: 0;
            to: 100;
            duration: 1000;
            loops: Animation.Infinite
        }


        //NumberAnimation on opacity
        OpacityAnimator on opacity
        {
            from: 0.0
            to: 1.0
            duration: 1000
            loops: Animation.Infinite
        }


        //*/

        ColorAnimation on color
        {
            from: "green"
            to: "red"
            duration: 8000
        }





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

    }
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




}
