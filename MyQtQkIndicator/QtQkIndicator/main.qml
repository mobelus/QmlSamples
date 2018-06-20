import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import QtQuick.Controls 1.4
import QtQuick.Extras 1.4

/*

import QtQuick.Layouts 1.0
import QtQuick.Window 2.1
import QtQuick.Dialogs 1.0
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
*/

ApplicationWindow
{
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle
    {
        color: "yellow"; width: parent.width; height: parent.height
        anchors.centerIn: parent
    }

    Item
    {
        id: playIndicator

        x : root.width / 2
        y : root.height / 2

        width: 100
        height: 100

        Timer
        {
            id: recordingFlashTimer
            running:true; repeat:true; interval:1000
        }

        Repeater
        {
            model: ListModel { ListElement {} }
            StatusIndicator
            {
                id: indicator
                color :  "green"
                width: playIndicator.width //100
                height: playIndicator.height //100
                Layout.alignment : Qt.AlignHCenter
                on : true

                Connections
                {
                    target: recordingFlashTimer
                    onTriggered: { indicator.active = !indicator.active }
                }
            }
        } // Repeater
    }


///////////////////////////////////////////////////////////////////////


/*
    Item
    {
        //id: statusIndicatorView
        id: playIndicator

        x : root.width / 2
        y : root.height / 2

        width: 100
        height: 100

        Timer
        {
            id: recordingFlashTimer
            running:true; repeat:true; interval:1000
        }

        Repeater
        {
            model:
            ListModel
            {
                //id: indicatorModel
                //    name: "Power"
                //    indicatorColor: "#35e02f"
                ListElement
                {
                    //name: "Recording"
                    //indicatorColor : "green" // "red"
                }
            }

            StatusIndicator
            {
                id: indicator
                color :  "green" // indicatorColor
                width: 100
                height: 100
                Layout.alignment : Qt.AlignHCenter
                on : true

                Connections
                {
                    target: recordingFlashTimer
                    onTriggered:
                    {
                        //if (name == "Recording")
                            indicator.active = !indicator.active
                    }
                }
            }
        } // Repeater
    }
//*/

///////////////////////////////////////////////////////////////////////


/*
    ControlView
    {
        id: statusIndicatorView
        darkBackground: false

        x: root.width / 2
        y: root.height / 2

        Timer
        {
            id: recordingFlashTimer
            running: true
            repeat: true
            interval: 1000
        }

        //ColumnLayout
        //{
        //    id: indicatorLayout
        //    width: 200 //statusIndicatorView.controlBounds.width * 0.25
        //    height: 300 //statusIndicatorView.controlBounds.height * 0.75
        //    anchors.centerIn: parent

        //    //background: Rectangle { color: "black" }
        //    Rectangle {
        //        Layout.alignment: Qt.AlignCenter
        //        color: "red"
        //        Layout.preferredWidth: 40
        //        Layout.preferredHeight: 40
        //    }

            Repeater
            {
                model:
                ListModel
                {
                    id: indicatorModel

                    //ListElement {
                    //    name: "Power"
                    //    indicatorColor: "#35e02f"
                    //}

                    ListElement {
                        name: "Recording"
                        indicatorColor: "red"
                    }
                }


//                ColumnLayout
//                {
//                    Layout.preferredWidth: indicatorLayout.width
//                    spacing: 0
//
//                    Rectangle {
//                        Layout.alignment: Qt.AlignCenter
//                        color: "blue"
//                        Layout.preferredWidth: 40
//                        Layout.preferredHeight: 40
//                    }

                    StatusIndicator
                    {
                        id: indicator
                        color: indicatorColor
                        Layout.preferredWidth: 50 //statusIndicatorView.controlBounds.width * 0.07
                        Layout.preferredHeight: Layout.preferredWidth
                        Layout.alignment: Qt.AlignHCenter
                        on: true

                        Connections
                        {
                            target: recordingFlashTimer
                            onTriggered: if (name == "Recording") indicator.active = !indicator.active
                        }
                    }

//                    ControlLabel
//                    {
//                        id: indicatorLabel
//                        text: name
//                        Layout.alignment: Qt.AlignHCenter
//                        Layout.maximumWidth: parent.width
//                        horizontalAlignment: Text.AlignHCenter
//                    }
//                }


            }
        //}
    }
*/

///////////////////////////////////////////////////////////////////////


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
*/

}
