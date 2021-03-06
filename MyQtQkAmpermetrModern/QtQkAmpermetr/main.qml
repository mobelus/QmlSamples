import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.0

ApplicationWindow
{
    id: root_app
    visible: true
    width: 800
    height: 800
    title: qsTr("Hello World")

    Text {
    }


    Button
    {
        id: accelerate
        onPressedChanged:{
            //id_ampermetr_mini.accelerating = pressed
            //id_ampermetr.accelerating = pressed
            //id_ampermetr_test.accelerating = pressed
            my_gauge_item.accelerating = pressed
        }

        Text
        {
            text: "Accelerate"
            color: "blue"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    //*
    Button
    {
        x: 300

        id: accelerate_40
        onClicked:
        {
            //id_ampermetr_test = pressed
            //id_ampermetr_test.value = 40
            //my_gauge_item.accelerating = pressed
            my_gauge_item.valueAmpers = 40
        }

        Text
        {
            text: "Accelerate 40"
            color: "blue"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    //*/

    Button
    {
        x: 400

        id: accelerate_3
        onClicked:
        {
            //id_ampermetr_test = pressed
            //id_ampermetr_test.value = 40
            //my_gauge_item.accelerating = pressed
            my_gauge_item.valueAmpers = 3
        }

        Text
        {
            text: "Accelerate 3"
            color: "blue"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }

    Button
    {
        x: 500

        id: accelerate_5
        onClicked:
        {
            //id_ampermetr_test = pressed
            //id_ampermetr_test.value = 40
            //my_gauge_item.accelerating = pressed
            my_gauge_item.valueAmpers = 5
        }

        Text
        {
            text: "Accelerate 5"
            color: "blue"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }


    Button
    {
        x: 600

        id: accelerate_8
        onClicked:
        {
            //id_ampermetr_test = pressed
            //id_ampermetr_test.value = 40
            //my_gauge_item.accelerating = pressed
            my_gauge_item.valueAmpers = 8
        }

        Text
        {
            text: "Accelerate 8"
            color: "blue"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }



    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    /*    ///////////////////////////
    Item
    {
        id: my_gauge_item

        property bool accelerating: false
        property int valueAmpers: 0

        Keys.onSpacePressed: my_gauge_item.accelerating = true
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                my_gauge_item.accelerating = false;
                event.accepted = true;
            }
        }

        width: 300 //controlBounds.width
        height: 300 //controlBounds.height

        x: root_app.width/4
        y: root_app.height/4

        //        Rectangle
        //        {
        //            width: parent.width
        //            height: parent.height
        //            clip: true;
        //            radius: 30
        //            color: "red"
        //
        //            Rectangle
        //            {
        //                rotation: 45; x: parent.radius*1.5; y: parent.radius;
        //                width: parent.width; height: parent.height; radius: parent;
        //                gradient: Gradient {
        //                    GradientStop { position: 0.0; color: "#ffffff" }
        //                    GradientStop { position: 0.5; color: "#000000" }
        //                    GradientStop { position: 1.0; color: "#F0F0F0" }
        //                }
        //            }
        //        }


        // Image
        // {
        //     id: black_main_box
        //     source: "./images/ampermeter-round-background.png"
        //     fillMode: Image.PreserveAspectFit
        //     //width: parent.width
        //     //height: parent.height
        //     anchors.centerIn: parent
        // }


        Image
        {
            id: white_indicator_box
            source: "./images/ampermeter-round-background.png"
            //source: "./images/background-light.png"
            fillMode: Image.PreserveAspectFit
            //width: parent.width
            //height: parent.height
            anchors.centerIn: parent

            //FontLoader { id: locotechFont; source: "C:/_RZD_WORK/TASKS/2018-Iter-06/LOCO-FONT/ofont.ru_Magistral C.ttf" }
            Text {
                id: valueText
                x: 94
                y: 219
                text: "A"
                anchors.verticalCenterOffset: -35
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                //font.family: locotechFont.name
                font.family: "Helvetica"
                font.pointSize: 24
                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.bottom: id_needle.bottom / 2
                color: "black"

            }
        }

        CircularGauge
        {
            id: circularGauge
            minimumValue: 0
            maximumValue: 5 //10

            width: white_indicator_box.width * 0.75
            height: white_indicator_box.height * 0.75

            //x: black_main_box.x + white_indicator_box.width * 0.15;
            //y: black_main_box.y + white_indicator_box.height * 0.15;
            anchors.centerIn: white_indicator_box

            value: parent.valueAmpers

            style: CircularGaugeStyle
            {
                id: circularGaugeStyle
                minimumValueAngle: -70
                maximumValueAngle: +70
                labelStepSize: 1 // 2
                tickmarkStepSize: 1

                tickmarkLabel: Text
                {
                    font.pixelSize: Math.max(12, outerRadius*0.1)
                    text: styleData.value
                    color: "black"
                    //styleData.value>=80 ? "steelblue" : "lightsteelblue"
                    antialiasing: true
                }   // tickmarkLabel

                needle:
                    Image
                {
                    id: needleImage
                    source: "qrc:/images/ampermeter-round-needle.png"
                    //transformOrigin: Item.Bottom

                    // scale: {
                    //     var distanceFromLabelToRadius = labelInset / 2;
                    //     var idealHeight = outerRadius - distanceFromLabelToRadius;
                    //     var originalImageHeight = needleImage.sourceSize.height;
                    //     idealHeight / originalImageHeight;
                    // }

                }

                tickmark: Rectangle
                {
                    implicitWidth: outerRadius //*0.02
                    implicitHeight: outerRadius //*0.06
                    antialiasing: true
                    color: "black"
                    width: outerRadius * 0.01
                    height: outerRadius * 0.06
                    //color: styleData.value>=80 ? "steelblue" : "lightsteelblue"
                }   // tickmark

                minorTickmark: Rectangle
                {
                    visible: styleData.value<80
                    implicitWidth: outerRadius*0.01
                    implicitHeight: outerRadius*0.03
                    antialiasing: true
                    color: "red"
                }   // minorTickmark


            }

            Behavior on value
            {
                NumberAnimation
                {
                    easing.type: Easing.OutCubic; duration: 500
                }
            }

        }

        // CIRCULAR_GAUGE

    }

    //*/



    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

/*
    Rectangle {
        id: root
        property Gradient borderGradient
        property int borderWidth: 0

        x:300
        y:300
        
        width:200
        height:200

        Loader {
            id: loader
            active: borderGradient
            anchors.fill: parent
            sourceComponent: border
        }

        Component.onCompleted: console.log(loader.active)

        Component {
            id: id_border
            Item {
                Rectangle {
                    id: borderFill
                    radius: root.radius
                    anchors.fill: parent
                    gradient: root.borderGradient
                    visible: false
                }

                Rectangle {
                    id: mask
                    radius: root.radius
                    border.width: root.borderWidth
                    anchors.fill: parent
                    color: 'transparent'
                    visible: false   // otherwise a thin border might be seen.
                }

                OpacityMask {
                    id: opM
                    anchors.fill: parent
                    source: borderFill
                    maskSource: mask
                }
            }
        }
    }
//*/


    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

//*    ///////////////////////////
    Item
    {
        id: my_gauge_item

        property bool accelerating: false
        property int valueAmpers: 0

        Keys.onSpacePressed: my_gauge_item.accelerating = true
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                my_gauge_item.accelerating = false;
                event.accepted = true;
            }
        }

        width: 300 //controlBounds.width
        height: 300 //controlBounds.height

        x: root_app.width/4
        y: root_app.height/4

//        Rectangle
//        {
//            width: parent.width
//            height: parent.height
//            clip: true;
//            radius: 30
//            color: "red"
//
//            Rectangle
//            {
//                rotation: 45; x: parent.radius*1.5; y: parent.radius;
//                width: parent.width; height: parent.height; radius: parent;
//                gradient: Gradient {
//                    GradientStop { position: 0.0; color: "#ffffff" }
//                    GradientStop { position: 0.5; color: "#000000" }
//                    GradientStop { position: 1.0; color: "#F0F0F0" }
//                }
//            }
//        }

        Image
        {
            id: black_main_box
            source: "./images/ampermeter-modern-background.png"
            fillMode: Image.PreserveAspectFit
            //width: parent.width
            //height: parent.height
            anchors.centerIn: parent
        }

        Image
        {
            id: white_indicator_box
            source: "./images/ampermeter-modern-background-light.png"
            fillMode: Image.PreserveAspectFit
            //width: parent.width
            //height: parent.height
            anchors.centerIn: parent
        }

        CircularGauge
        {
            id: circularGauge
            minimumValue: 0
            maximumValue: 5 //10

            width: white_indicator_box.width * 1.3
            height: white_indicator_box.height * 1.3

            x: black_main_box.x + white_indicator_box.width * 0.15;
            y: black_main_box.y + white_indicator_box.height * 0.15;

            value: parent.valueAmpers

            style: CircularGaugeStyle
            {
                id: circularGaugeStyle
                minimumValueAngle: -90
                maximumValueAngle: +0
                labelStepSize: 1 // 2
                tickmarkStepSize: 1

                tickmarkLabel: Text
                {
                    font.pixelSize: Math.max(12, outerRadius*0.1)
                    text: styleData.value
                    color: "black"
                           //styleData.value>=80 ? "steelblue" : "lightsteelblue"
                    antialiasing: true
                }   // tickmarkLabel

                needle:
                Image
                {
                    id: needleImage
                    source: "qrc:/images/ampermeter-modern-needle.png"
                    //transformOrigin: Item.Bottom

                   // scale: {
                   //     var distanceFromLabelToRadius = labelInset / 2;
                   //     var idealHeight = outerRadius - distanceFromLabelToRadius;
                   //     var originalImageHeight = needleImage.sourceSize.height;
                   //     idealHeight / originalImageHeight;
                   // }

                }

                tickmark: Rectangle
                {
                    implicitWidth: outerRadius//*0.02
                    implicitHeight: outerRadius//*0.06
                    antialiasing: true
                    color: "black"
                    width: outerRadius * 0.01
                    height: outerRadius * 0.06
                    //color: styleData.value>=80 ? "steelblue" : "lightsteelblue"
                }   // tickmark

                minorTickmark: Rectangle
                {
                    visible: styleData.value<80
                    implicitWidth: outerRadius*0.01
                    implicitHeight: outerRadius*0.03
                    antialiasing: true
                    color: "red"
                }   // minorTickmark


            }

            //FontLoader { id: locotechFont; source: "C:/_RZD_WORK/TASKS/2018-Iter-06/LOCO-FONT/ofont.ru_Magistral C.ttf" }
            Text {
                id: valueText
                text: "A"
                font.family: "Helvetica"
                //font.family: locotechFont.name
                font.pointSize: 24
                //anchors.horizontalCenter: parent.horizontalCenter
                //anchors.bottom: id_needle.bottom / 2
                color: "black"
            }


            Behavior on value
            {
                NumberAnimation
                {
                    easing.type: Easing.OutCubic; duration: 500
                }
            }

        } // CIRCULAR_GAUGE

    }

//*/


    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////




    /*    ///////////////////////////
    Item
    {
        id: my_gauge_item

        property bool accelerating: false
        property int valueAmpers: 0

        Keys.onSpacePressed: my_gauge_item.accelerating = true
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                my_gauge_item.accelerating = false;
                event.accepted = true;
            }
        }

        width: 300 //controlBounds.width
        height: 300 //controlBounds.height

        x: root_app.width/4
        y: root_app.height/4


        Rectangle
        {
            id: black_main_box
            color: "black"
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            radius: 10
        }

        Rectangle
        {
            id: white_indicator_box
            color: "white"
            width: parent.width * 0.8
            height: parent.height * 0.5
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.07
            radius: 10
        }

        CircularGauge
        {
            id: id_ampermetr_test
            anchors.horizontalCenter: parent.horizontalCenter
            y: white_indicator_box.height / 2
            //anchors.top: white_indicator_box.anchors.top
            //anchors.topMargin: white_indicator_box.anchors.topMargin * 2
            //anchors.bottom: 2 * white_indicator_box.bottom
            width: white_indicator_box.width * 1.3
            height: white_indicator_box.height * 1.3


            property bool accelerating: parent.accelerating

            Keys.onSpacePressed: accelerating = true
            Keys.onReleased: {
                if (event.key === Qt.Key_Space) {
                    accelerating = false;
                    event.accepted = true;
                }
            }

            minimumValue: 0
            maximumValue: outerRadius

            //value: accelerating ? maximumValue : 0
            value: parent.valueAmpers

            style: CircularGaugeStyle
            {
                //labelInset: ""
                labelInset: (-20)//* (outerRadius * 0.001) //-20
                labelStepSize: 10// * outerRadius * 0.001 //10
                tickmarkInset: (-10)// * (outerRadius * 0.001) //-10
                minorTickmarkInset: (-10)// * (outerRadius * 0.001)

                //tickmarkInset: outerRadius * 0.0003
                //minorTickmarkInset: outerRadius * 1.0003

                function degreesToRadians(degrees)
                { return degrees*(Math.PI/180); } //degreesToRadians

                minimumValueAngle: -70
                maximumValueAngle: +70
                // tickmarkLabel: null

                tickmark: Rectangle
                {
                    //visible: styleData.value<80||styleData.value%10==0

                    implicitWidth: outerRadius*0.02
                    implicitHeight: outerRadius*0.06

                    antialiasing: true


                    color: "green"
                    width: outerRadius * 0.01
                    height: outerRadius * 0.03
                    //color: styleData.value>=80 ? "steelblue" : "lightsteelblue"
                }   // tickmark

                minorTickmark: Rectangle
                {
                    visible: styleData.value<80

                    implicitWidth: outerRadius*0.01
                    implicitHeight: outerRadius*0.03

                    antialiasing: true

                    color: "red"
                    //color: "lightsteelblue"
                }   // minorTickmark

                tickmarkLabel: Text
                {
                    font.pixelSize: Math.max(12, outerRadius*0.1)
                    text: styleData.value
                    color: "black"
                           //styleData.value>=80 ? "steelblue" : "lightsteelblue"
                    antialiasing: true
                }   // tickmarkLabel

                needle:
                Rectangle
                {
                    id: id_needle
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: Qt.rgba(0.66, 0.3, 0, 1)
                    //minimumValueAngle: -90
                    //maximumValueAngle: 90
                }
            }

            Text {
                id: valueText
                text: "A"
                font.family: "Helvetica"
                font.pointSize: 24
                anchors.horizontalCenter: parent.horizontalCenter
                y: white_indicator_box.height * 0.3
                //anchors.bottom: id_needle.bottom / 2
                color: "black"
            }

            Behavior on value
            {
                NumberAnimation
                {
                    //easing.type: Easing.OutCubic; duration: 6000
                }
            }
        }


    }

*/


    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////



    /*
    Item
    {
        id: my_gauge_item

        property bool accelerating: false
        property int valueAmpers: 0

        Keys.onSpacePressed: my_gauge_item.accelerating = true
        Keys.onReleased: {
            if (event.key === Qt.Key_Space) {
                my_gauge_item.accelerating = false;
                event.accepted = true;
            }
        }

        width: 300 //controlBounds.width
        height: 300 //controlBounds.height

        x: root_app.width/4
        y: root_app.height/4

        CircularGauge
        {
            id: my_gauge
            minimumValue: 0
            maximumValue: 300
            //value: my_gauge_item.accelerating ? maximumValue : 0
            value: valueAmpers

            Behavior on value
            {
                NumberAnimation
                {
                    easing.type: Easing.OutCubic
                    duration: 6000
                }
            }
            //////////////////////////
            style: CircularGaugeStyle
            {
                id: root
                tickmarkStepSize: 10
                minorTickmarkCount: 2
                labelStepSize: 40
                tickmarkInset: outerRadius * 0.06
                minorTickmarkInset: tickmarkInset
                labelInset: outerRadius * 0.23

                background: //Image { source: "qrc:/images/background-light.png" }
                    Rectangle {
                        width: 200
                        height: 200
                        color: "blue"
                    }

                needle: Image {
                    id: needleImage
                    source: "qrc:/images/needle-light.png"
                    transformOrigin: Item.Bottom
                    scale: {
                        var distanceFromLabelToRadius = labelInset / 2;
                        var idealHeight = outerRadius - distanceFromLabelToRadius;
                        var originalImageHeight = needleImage.sourceSize.height;
                        idealHeight / originalImageHeight;
                    }
                }

                foreground: Item {
                    Image {
                        anchors.centerIn: parent
                        source: "qrc:/images/center-light.png"
                        scale: (outerRadius * 0.25) / sourceSize.height
                    }
                }

                tickmark: Rectangle {
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.04
                    color: "#999"
                }

                minorTickmark: Rectangle {
                    implicitWidth: outerRadius * 0.01
                    antialiasing: true
                    implicitHeight: outerRadius * 0.02
                    color: "#bbb"
                }

                tickmarkLabel: Text {
                    font.family: "Helvetica neue"
                    font.pixelSize: Math.max(6, outerRadius * 0.1)
                    text: styleData.value
                    color: "#333"
                }
            }
            //////////////////////////
        }
    }
//*/


    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////
    /////////////////////////////////////////////////////////////////////////////

    /*
        CircularGauge
        {
            id: id_ampermetr_test

            property bool accelerating: false

            Keys.onSpacePressed: accelerating = true
            Keys.onReleased: {
                if (event.key === Qt.Key_Space) {
                    accelerating = false;
                    event.accepted = true;
                }
            }

            minimumValue: 0
            maximumValue: 300

            value: accelerating ? maximumValue : 0

            style: CircularGaugeStyle
            {
                maximumValueAngle: 90
                //labelInset: ""

                needle:
                {
                    Rectangle
                    {
                    y: outerRadius * 0.15
                    implicitWidth: outerRadius * 0.03
                    implicitHeight: outerRadius * 0.9
                    antialiasing: true
                    color: Qt.rgba(0.66, 0.3, 0, 1)
                    //minimumValueAngle: -90
                    //maximumValueAngle: 90
                    }
                }
            }


            Behavior on value
            {
                NumberAnimation
                {
                    easing.type: Easing.OutCubic
                    duration: 6000
                }
            }
        }
    //*/




    /*
    CircularGauge
    {
        scale: 0.5

        style: CircularGaugeLightStyle
        {
            minimumValueAngle: -90
            maximumValueAngle: 90
        }
    }
*/


    /*
    CircularGauge
    {
        style: CircularGaugeLightStyle
        {
            minimumValueAngle: -90
            maximumValueAngle: 90
        }
    }
*/


    /*
    CircularGauge
    {
        x: root_app.width/4
        y: root_app.height/4

        style: CircularGaugeStyle
        {
            id: root
            tickmarkStepSize: 10
            minorTickmarkCount: 2
            labelStepSize: 40
            tickmarkInset: outerRadius * 0.06
            minorTickmarkInset: tickmarkInset
            labelInset: outerRadius * 0.23

            background: Image {
                source: "qrc:/images/background-light.png"
            }

            needle: Image {
                id: needleImage
                source: "qrc:/images/needle-light.png"
                transformOrigin: Item.Bottom
                scale: {
                    var distanceFromLabelToRadius = labelInset / 2;
                    var idealHeight = outerRadius - distanceFromLabelToRadius;
                    var originalImageHeight = needleImage.sourceSize.height;
                    idealHeight / originalImageHeight;
                }
            }

            foreground: Item {
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/center-light.png"
                    scale: (outerRadius * 0.25) / sourceSize.height
                }
            }

            tickmark: Rectangle {
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.04
                color: "#999"
            }

            minorTickmark: Rectangle {
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.02
                color: "#bbb"
            }

            tickmarkLabel: Text {
                font.family: "Helvetica neue"
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: styleData.value
                color: "#333"
            }
        }
    }
//*/

    /*
    CircularGauge
    {
        x: root_app.width/4
        y: root_app.height/4

        CircularGaugeStyle {
            id: root
            tickmarkStepSize: 10
            minorTickmarkCount: 1
            labelStepSize: 20
            tickmarkInset: outerRadius * 0.06
            minorTickmarkInset: tickmarkInset
            labelInset: outerRadius * 0.23

            background: Image {
                source: "qrc:/images/background.png"
            }

            needle: Image {
                id: needleImage
                transformOrigin: Item.Bottom
                source: "qrc:/images/needle.png"
                scale: {
                    var distanceFromLabelToRadius = labelInset / 2;
                    var idealHeight = outerRadius - distanceFromLabelToRadius;
                    var originalImageHeight = needleImage.sourceSize.height;
                    idealHeight / originalImageHeight;
                }
            }

            foreground: Item {
                Image {
                    anchors.centerIn: parent
                    source: "qrc:/images/center.png"
                    scale: (outerRadius * 0.25) / sourceSize.height
                }
            }

            tickmark: Rectangle {
                implicitWidth: outerRadius * 0.02
                antialiasing: true
                implicitHeight: outerRadius * 0.05
                color: "#888"
            }

            minorTickmark: Rectangle {
                implicitWidth: outerRadius * 0.01
                antialiasing: true
                implicitHeight: outerRadius * 0.02
                color: "#444"
            }

            tickmarkLabel: Text {
                font.pixelSize: Math.max(6, outerRadius * 0.1)
                text: styleData.value
                color: "white"
            }
        }
    }
*/


    /*
    CircularGauge
    {

        //style: styleMap[0] //["CircularGaugeLightStyle.qml"]
        style: CircularGaugeStyle {
            needle: Rectangle {
                y: outerRadius * 0.15
                implicitWidth: outerRadius * 0.03
                implicitHeight: outerRadius * 0.9
                antialiasing: true
                color: Qt.rgba(0.66, 0.3, 0, 1)
            }
        }
        property alias currentStylePath: stylePicker.currentStylePath

        readonly property string currentStylePath: "123"
        property string mapName : "CircularGaugeLightStyle.qml"
        property var styleMap: {
            var styles = {};
            for (var i = 0; i < customizerItem.allStylePaths.length; ++i) {
                var path = customizerItem.allStylePaths[i];
                styles[path] = Qt.createComponent(path, gauge);
            }
            styles;
        }


    }
//*/

    /*
    AmpermetrMini
    {
        id: id_ampermetr_mini
        x: root_app.width/5
        y: root_app.height/5
    }
//*/

    /*
    Ampermetr
    {
        id: id_ampermetr
        x: root_app.width/4
        y: root_app.height/4
    }
//*/


    /*
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1
        {
        }

        Page
        {
            Label
            {
                text: qsTr("Second page")
                anchors.centerIn: parent
            }



        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("First")
        }
        TabButton {
            text: qsTr("Second")
        }
    }
//*/

}
