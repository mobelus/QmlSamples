import QtQuick 2.3
import QtQuick.Controls 1.2
import QtQuick.Controls.Styles 1.2

//import QtQuick 2.7
//import QtQuick.Controls 2.0
//import QtQuick.Controls.Styles 1.2

import QtQuick.Layouts 1.3
import QtQuick.Window 2.0



//*
ApplicationWindow
{
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")



/*
    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1 {
        }

        Page {
            Label {
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


    Rectangle {
        anchors.fill: parent
        color: "black"
    }


    /*
    CustomBusyIndicator {
        id: busy
        width: 400
        height: 400
    }
    */


    Row
    {
        spacing: 20
        CustomBusyIndicator {
            id: busy
            width: 400
            height: 400
        }
        Rectangle {
            id:settings
            width: 400
            height: 400
            color: "black"

            Column {
                spacing: 10
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.leftMargin: 20
                Row {
                    spacing: 10
                    Label {
                        text: "Lines"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: linesSlider

                        minimumValue: 3
                        maximumValue: 100

                        value: 11
                        stepSize: 1
                        onValueChanged: {
                            busy.bLines = value
                        }
                    }
                    Label {
                        text: busy.bLines = linesSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Length"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: lenghtSlider
                        minimumValue: 1
                        maximumValue: 100
                        value: 10
                        stepSize: 1
                        onValueChanged: {
                            busy.bLength = value
                        }
                    }
                    Label {
                        text: busy.bLength = lenghtSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Width"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: widthSlider
                        minimumValue: 1
                        maximumValue: 100
                        value: 5
                        stepSize: 1
                        onValueChanged: {
                            busy.bWidth = value
                        }
                    }
                    Label {
                        text: busy.bWidth = widthSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Radius"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: radiusSlider
                        minimumValue: 1
                        maximumValue: 100
                        value: 11
                        stepSize: 1
                        onValueChanged: {
                            busy.bRadius = value
                        }
                    }
                    Label {
                        text: busy.bRadius = radiusSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Corner"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: cornerSlider
                        minimumValue: 0
                        maximumValue: 1
                        value: 1
                        stepSize: 0.01
                        onValueChanged: {
                            busy.bCorner = value
                        }
                    }
                    Label {
                        text: busy.bCorner = cornerSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Speed"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: speedSlider
                        minimumValue: 10
                        maximumValue: 800
                        stepSize: 10
                        value: 100
                        onValueChanged: {
                            busy.bSpeed = value
                        }
                    }
                    Label {
                        text: busy.bSpeed = speedSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Trail"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: trailSlider
                        minimumValue: 0
                        maximumValue: 1
                        value: 0.5
                        stepSize: 0.01
                        onValueChanged: {
                            busy.bTrail = value
                        }
                    }
                    Label {
                        text: busy.bTrail = trailSlider.value
                        color: "white"
                    }
                }
                Row {
                    CheckBox {
                        id:checkboxClockWise
                        checked: true
                        onCheckedChanged: {
                            busy.bClockWise = checked
                        }
                    }
                    Label {
                        text: "Clockwise"
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Opacity"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: opacitySlider
                        minimumValue: 0
                        maximumValue: 1
                        value: 1
                        stepSize: 0.01
                        onValueChanged: {
                            busy.bOpacity = value
                        }
                    }
                    Label {
                        text: busy.bOpacity = opacitySlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Color"
                        color: "white"
                        width: 80
                    }
                    TextField {
                        id:colorTextField
                        text: "#7B756B"
                        onTextChanged: {
                            busy.bColor =  text
                        }
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Highlight"
                        color: "white"
                        width: 80
                    }
                    TextField {
                        id:highlightColorTextField
                        text: "white"
                        onTextChanged: {
                            busy.bHighlightColor =  text
                        }
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Background"
                        color: "white"
                        width: 80
                    }
                    TextField {
                        id:backgroundColorTextField
                        text: "black"
                        onTextChanged: {
                            busy.bBgColor =  text
                        }
                    }
                }
            }
        }
    }



}


/*
ApplicationWindow
{
    title: qsTr("Hello World")
    width: 400 * 2
    height: 400


    Rectangle {
        anchors.fill: parent
        color: "black"
    }

    Row
    {
        spacing: 20
        CustomBusyIndicator {
            id: busy
            width: 400
            height: 400
        }
        Rectangle {
            id:settings
            width: 400
            height: 400
            color: "black"

            Column {
                spacing: 10
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.leftMargin: 20
                Row {
                    spacing: 10
                    Label {
                        text: "Lines"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: linesSlider

                        minimumValue: 3
                        maximumValue: 100

                        value: 11
                        stepSize: 1
                        onValueChanged: {
                            busy.bLines = value
                        }
                    }
                    Label {
                        text: busy.bLines = linesSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Length"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: lenghtSlider
                        minimumValue: 1
                        maximumValue: 100
                        value: 10
                        stepSize: 1
                        onValueChanged: {
                            busy.bLength = value
                        }
                    }
                    Label {
                        text: busy.bLength = lenghtSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Width"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: widthSlider
                        minimumValue: 1
                        maximumValue: 100
                        value: 5
                        stepSize: 1
                        onValueChanged: {
                            busy.bWidth = value
                        }
                    }
                    Label {
                        text: busy.bWidth = widthSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Radius"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: radiusSlider
                        minimumValue: 1
                        maximumValue: 100
                        value: 11
                        stepSize: 1
                        onValueChanged: {
                            busy.bRadius = value
                        }
                    }
                    Label {
                        text: busy.bRadius = radiusSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Corner"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: cornerSlider
                        minimumValue: 0
                        maximumValue: 1
                        value: 1
                        stepSize: 0.01
                        onValueChanged: {
                            busy.bCorner = value
                        }
                    }
                    Label {
                        text: busy.bCorner = cornerSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Speed"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: speedSlider
                        minimumValue: 10
                        maximumValue: 800
                        stepSize: 10
                        value: 100
                        onValueChanged: {
                            busy.bSpeed = value
                        }
                    }
                    Label {
                        text: busy.bSpeed = speedSlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Trail"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: trailSlider
                        minimumValue: 0
                        maximumValue: 1
                        value: 0.5
                        stepSize: 0.01
                        onValueChanged: {
                            busy.bTrail = value
                        }
                    }
                    Label {
                        text: busy.bTrail = trailSlider.value
                        color: "white"
                    }
                }
                Row {
                    CheckBox {
                        id:checkboxClockWise
                        checked: true
                        onCheckedChanged: {
                            busy.bClockWise = checked
                        }
                    }
                    Label {
                        text: "Clockwise"
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Opacity"
                        color: "white"
                        width: 80
                    }
                    Slider {
                        id: opacitySlider
                        minimumValue: 0
                        maximumValue: 1
                        value: 1
                        stepSize: 0.01
                        onValueChanged: {
                            busy.bOpacity = value
                        }
                    }
                    Label {
                        text: busy.bOpacity = opacitySlider.value
                        color: "white"
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Color"
                        color: "white"
                        width: 80
                    }
                    TextField {
                        id:colorTextField
                        text: "#7B756B"
                        onTextChanged: {
                            busy.bColor =  text
                        }
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Highlight"
                        color: "white"
                        width: 80
                    }
                    TextField {
                        id:highlightColorTextField
                        text: "white"
                        onTextChanged: {
                            busy.bHighlightColor =  text
                        }
                    }
                }
                Row {
                    spacing: 10
                    Label {
                        text: "Background"
                        color: "white"
                        width: 80
                    }
                    TextField {
                        id:backgroundColorTextField
                        text: "black"
                        onTextChanged: {
                            busy.bBgColor =  text
                        }
                    }
                }
            }
        }
    }


}
*/

