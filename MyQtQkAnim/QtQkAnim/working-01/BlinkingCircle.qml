import QtQuick 2.0
import QtQuick.Controls 2.1

Item {

    property int sizingKoeff: 1
    property int sizeMax: 200
    property int sizeMin: 40

    property int numRings: (sizeMax / sizeMin)
    property int durationMax: 3000
    property int durationRing: (durationMax / numRings)
    property int durationPause: 0

    height: width

    Rectangle
    {
        //id: boxBlinking
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

        NumberAnimation on radius
        {
            from: 0;
            to: (sizeMax * sizingKoeff) / 2 //(boxBlinking.sizeMax * boxBlinking.sizingKoeff) / 2;
            duration: durationMax //boxBlinking.durationMax;
            loops: Animation.Infinite
        }

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
//*
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
//*/
        NumberAnimation on opacity
        {
            from: 0.0
            to: 1.0
            duration: durationMax //boxBlinking.durationMax
            loops: Animation.Infinite
        }
    }
}
