import QtQuick 2.0
import QtQuick.Layouts 1.1

/*
ClockDigitalDisplay
{
    // in
    showTime: true
    showHours: true

    timerTextBackgroundColor: "blue"
    timerTextColor:  "white"

    timerTextSize: 50
    // from out
    //seconds: 0
}
*/

Item
{
    id : root
    width: displayRectangle.width
    height: displayRectangle.height

    property bool showTime: true
    property bool showHours: true

    property alias running: timer.running
    property date dateTime
    property int seconds: 0

    property int timerTextHrsLeft:  (dateTime.getHours()   < 0) ? 0 : (dateTime.getHours()   / 10 )
    property int timerTextHrsRight: (dateTime.getHours()   < 0) ? 0 : (dateTime.getHours()   % 10 )
    property int timerTextMinLeft:  (dateTime.getMinutes() < 0) ? 0 : (dateTime.getMinutes() / 10 )
    property int timerTextMinRight: (dateTime.getMinutes() < 0) ? 0 : (dateTime.getMinutes() % 10 )
    property int timerTextSecLeft:  (dateTime.getSeconds() < 0) ? 0 : (dateTime.getSeconds() / 10 )
    property int timerTextSecRight: (dateTime.getSeconds() < 0) ? 0 : (dateTime.getSeconds() % 10 )

    property color timerDisplayColor: "black"
    property color timerTextBackgroundColor: "blue"
    property color timerTextColor:  "white"

    property int timerTextSize: 50

    readonly property int timerTextRectWidth: root.timerTextSize / 2
    readonly property int timerTextRectHeight: root.timerTextSize

    function refreshTime()
    {
        root.dateTime = new Date;
        hrsLeft.text  = root.showTime ? String(root.timerTextHrsLeft)  : "1";
        hrsRight.text = root.showTime ? String(root.timerTextHrsRight) : "2";
        minLeft.text  = root.showTime ? String(root.timerTextMinLeft)  : "3";
        minRight.text = root.showTime ? String(root.timerTextMinRight) : "4";
        secLeft.text  = root.showTime ? String(root.timerTextSecLeft)  : "5";
        secRight.text = root.showTime ? String(root.timerTextSecRight) : "6";
    }



    Timer
    {
        id : timer
        interval: 500; running: true; repeat: true

        Component.onCompleted:
        {
            refreshTime();
        }

        onTriggered: // dateTime = new Date;
        {
            refreshTime();
        }

    }

    Rectangle
    {
        id: displayRectangle
        width: spinnerLayout.width * 1.1
        height: spinnerLayout.height * 1.5
        color : root.timerDisplayColor

        RowLayout
        {
            id : spinnerLayout
            spacing: 5

            height: secRight.height
            width: root.showHours
                   ? (secRight.width * 8) + (spinnerLayout.spacing * 8)
                   : (secRight.width * 5) + (spinnerLayout.spacing * 5)

            anchors.centerIn: parent

            //////////////////////////////////////////

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                visible : root.showHours

                Text
                {
                id: hrsLeft
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                visible : root.showHours

                Text
                {
                id: hrsRight
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                visible : root.showHours

                Text
                {
                text: ":";
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            //////////////////////////////////////////

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                Text
                {
                id: minLeft
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                Text
                {
                id: minRight
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                Text
                {
                text: ":";
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            //////////////////////////////////////////

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                Text
                {
                id: secLeft
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

            Rectangle
            {
                width: root.timerTextRectWidth
                height: root.timerTextRectHeight
                color: root.timerTextBackgroundColor

                Text
                {
                id: secRight
                font.pixelSize: root.timerTextSize;
                color: root.timerTextColor;
                anchors.centerIn: parent
                }
            }

        //////////////////////////////////////////

        }
    }
}

