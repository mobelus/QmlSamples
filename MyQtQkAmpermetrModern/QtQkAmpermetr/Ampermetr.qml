import QtQuick 2.0
import QtQuick.Extras 1.4


Item
{
    property bool accelerating: false

    Keys.onSpacePressed: accelerating = true
    Keys.onReleased: {
        if (event.key === Qt.Key_Space) {
            accelerating = false;
            event.accepted = true;
        }
    }

    width: 300 //controlBounds.width
    height: 300 //controlBounds.height


    CircularGauge
    {
        id: gauge
        minimumValue: 0   //customizerItem.minimumValue
        //maximumValue: 300 //customizerItem.maximumValue

        value: accelerating ? maximumValue : 0
        width: parent.width
        height: parent.height

        anchors.centerIn: parent


        //style: styleMap[customizerItem.currentStylePath]

        // This stops the styles being recreated when a new one is chosen.

//        property var styleMap:
//        {
//            var styles = {};
//            for (var i = 0; i < customizerItem.allStylePaths.length; ++i)
//            {
//                var path = customizerItem.allStylePaths[i];
//                styles[path] = Qt.createComponent(path, gauge);
//            }
//            styles;
//        }
//

        // Called to update the style after the user has edited a property.

        //Connections
        //{
            //target: customizerItem
            //onMinimumValueAngleChanged: __style.minimumValueAngle = customizerItem.minimumValueAngle
            //onMaximumValueAngleChanged: __style.maximumValueAngle = customizerItem.maximumValueAngle
            //onLabelStepSizeChanged: __style.tickmarkStepSize = __style.labelStepSize = customizerItem.labelStepSize
        //}

        Behavior on value
        {
            NumberAnimation
            {
                easing.type: Easing.OutCubic
                duration: 6000
            }
        }
    }

}
