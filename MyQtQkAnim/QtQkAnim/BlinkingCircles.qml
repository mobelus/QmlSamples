import QtQuick 2.0
import QtQuick.Controls 2.1

Item {
    id: itemWithBlinkingCircles

    property int propX:  350;
    property int propY:  350;
    property int propWidth:  50;
    property int propSizeMin:  50;
    property int propSizeMax:  200;
    property int propDurationMax:  1000;


    //property bool isObjCreated: false;
    //property alias setCreateObject: isObjCreated
    //onSetCreateObjectChanged:
    //{
    //}

    Component.onCompleted:
    {
        //if(isObjCreated)
        //{
            var component = Qt.createComponent("BlinkingCircle.qml");
            for (var i=0; i < (propSizeMax / propSizeMin); i++)
            {
            var object = component.createObject(itemWithBlinkingCircles, {
                  x: propX //root.width / 2 - width / 2
                , y: propY //root.height / 2 - height / 2
                , width: propWidth
                , sizeMin: propSizeMin
                , sizeMax: propSizeMax
                , durationMax: propDurationMax
                , index: i
                , timeoutBeforeStart: true
                })
            }
        //}
    }

    onVisibleChanged:
    {
        if(visible == false)
        {
            animHideItem.start();
        }
    }

    NumberAnimation
    {
        id: animHideItem
        target: itemWithBlinkingCircles;
        property: "opacity";
        from: 1
        to: 0.0
        duration: 1000
    }
}
