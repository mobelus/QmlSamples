import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    id: root

    height: width

    property int sizingKoeff: 1
    property int sizeMax: 200
    property int sizeMin: 40

    property int numRings: (sizeMax / sizeMin)
    property int durationMax: 3000
    property int durationRing: (durationMax / numRings)
    property int durationPause: durationRing * index

    property int index: 1

    property alias timeoutBeforeStart: animStartBefore.running

    onTimeoutBeforeStartChanged:
    {
        if (animStartBefore.running())
        {
            animStartBefore.stop()
            animStartBefore.start()
        }
    }

    Component.onCompleted:
    {
        console.log(x)
        console.log(y)
        console.log(index)
        console.log(durationPause)
        console.log(timeoutBeforeStart)
    }


    Rectangle
    {
        id: boxBlinking
        radius: parent.width / 2

        width: parent.width
        height: parent.height

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter

        color: "blueviolet"
        opacity: 1

        /*
        property int sizingKoeff: 1
        property int sizeMax: sizeOfItem //200
        property int sizeMin: 40

        property int numRings: (sizeMax / sizeMin)
        property int durationMax: 3000
        property int durationRing: (durationMax / numRings)
        property int durationPause: durationPauseOfItem
        */

        /*
        PropertyAnimation
        {
            properties: "width,height";
            //easing.type: Easing.InOutQuad
            from: 0;
            to: (boxBlinking.sizeMax * boxBlinking.sizingKoeff);
            duration: boxBlinking.durationMax;
            loops: Animation.Infinite
        }
        //*/
/*
        NumberAnimation on width
        {
            from: 0;
            to: sizeMax * sizingKoeff //(boxBlinking.sizeMax * boxBlinking.sizingKoeff);
            duration: durationMax //boxBlinking.durationMax;
            loops: Animation.Infinite
        }

        NumberAnimation on height
        {
            from: 0;
            to: sizeMax * sizingKoeff //(boxBlinking.sizeMax * boxBlinking.sizingKoeff);
            duration: durationMax // boxBlinking.durationMax;
            loops: Animation.Infinite
        }

        NumberAnimation on radius
        {
            from: 0;
            to: (sizeMax * sizingKoeff) / 2 //(boxBlinking.sizeMax * boxBlinking.sizingKoeff) / 2;
            duration: durationMax //boxBlinking.durationMax;
            loops: Animation.Infinite
        }

        NumberAnimation on opacity
        {
            from: 0.0
            to: 1.0
            duration: durationMax //boxBlinking.durationMax
            loops: Animation.Infinite
        }
//*/

        SequentialAnimation on opacity
        {
            running: timeoutBeforeStart
            id: animStartBefore

            NumberAnimation {
                from: 0
                to: 1
                duration: durationPause //1000
            }

/*          ColorAnimation
            {
                from: "green"
                to: "red"
                //duration: durationPause
                duration: 1000
            }
*/
            onStopped:
            {
                animMain.start();
            }
        }

        //SequentialAnimation
        ParallelAnimation
        {
            id: animMain

            running: false
            loops: Animation.Infinite

            NumberAnimation
            {
                target: boxBlinking;
                property: "width";
                from: 0;
                to: sizeMax * sizingKoeff //(boxBlinking.sizeMax * boxBlinking.sizingKoeff);
                duration: durationMax //boxBlinking.durationMax;
            }

            NumberAnimation
            {
                target: boxBlinking;
                property: "height";
                from: 0;
                to: sizeMax * sizingKoeff //(boxBlinking.sizeMax * boxBlinking.sizingKoeff);
                duration: durationMax // boxBlinking.durationMax;
            }

            NumberAnimation
            {
                target: boxBlinking;
                property: "radius";
                from: 0;
                to: (sizeMax * sizingKoeff) / 2;
                duration: durationMax;
            }

            NumberAnimation
            {
                target: boxBlinking;
                property: "opacity";
                from: 0.0
                to: 1.0
                duration: durationMax //boxBlinking.durationMax
            }
        }
    }
}
