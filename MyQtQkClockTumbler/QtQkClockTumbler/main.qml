import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Extras 1.4


ApplicationWindow
{
    id: root
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")



    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: time.text = Date().toString()
    }

    Text { id: time }


    Text
    {
        id: timeTumbler
        x: root.width / 2
        text: "___TIME___"
    }

    Item
    {
        id: clockTumbler

        x: root.width / 2
        y: root.height / 2

        property date dateTime

        Timer
        {
            interval: 500; running: true; repeat: true
            onTriggered: clockTumbler.dateTime = new Date();
        }

        Timer
        {
            id : timer
            interval: 1000; running: true; repeat: true
            readonly property int indxHour: 0
            readonly property int indxMin:  1
            readonly property int indxSec:  2

            onTriggered:
            {
                tumbler.setCurrentIndexAt(indxHour, clockTumbler.dateTime.getHours().toString());
                tumbler.setCurrentIndexAt(indxMin,  clockTumbler.dateTime.getMinutes().toString());
                tumbler.setCurrentIndexAt(indxSec,  clockTumbler.dateTime.getSeconds().toString());
            }
        }

        Tumbler
        {
            id: tumbler
            anchors.centerIn: parent

            // TODO: Use FontMetrics with 5.4
            Label {
                id: characterMetrics
                font.bold: true
                font.pixelSize: textSingleton.font.pixelSize * 1.25
                font.family: openSans.name
                visible: false
                text: "M"
            }

            readonly property real delegateTextMargins: characterMetrics.width * 1.5

            TumblerColumn
            {
                id: hourColumn
                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 24; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }
            }

            TumblerColumn
            {
                id: minuteColumn
                width: characterMetrics.width * 3 + tumbler.delegateTextMargins
                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 60; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }

                //onCurrentIndexChanged: tumblerDayColumn.updateModel()
            }

            TumblerColumn
            {
                id: secondColumn
                width: characterMetrics.width * 4 + tumbler.delegateTextMargins

                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 60; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }
            }
        } // Tumbler
    }


//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
/*
    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: time.text = Date().toString()
    }

    Text { id: time }


    Text
    {
        id: timeTumbler
        x: root.width / 2
        text: "___TIME___"
    }

    Item
    {
        id: clockTumbler
        //darkBackground: false

        x: root.width / 2
        y: root.height / 2

        property date dateTime

        readonly property int indxHour: 0
        readonly property int indxMin:  1
        readonly property int indxSec:  2

        Timer {
            interval: 500; running: true; repeat: true
            onTriggered:
            {
//                timeTumbler.text = Date().toString()
//                timeTumbler.text = Date().getHours()
                  clockTumbler.dateTime = new Date();
            }
        }

        function addZero(i) {
            if (i < 10) {
                i = "0" + i;
            }
            return i;
        }

        Timer
        {
            id : timer
            interval: 1000; running: true; repeat: true
            onTriggered:
            {
                //var td = new Date();
                //timeTumbler.text = d.getSeconds().toString();

                //var d = new Date();
                //tumbler.setCurrentIndexAt(0, d.getHours().toString());
                //tumbler.setCurrentIndexAt(1,  d.getMinutes().toString());
                //tumbler.setCurrentIndexAt(2,  d.getSeconds().toString());

                tumbler.setCurrentIndexAt(0, clockTumbler.dateTime.getHours().toString());
                tumbler.setCurrentIndexAt(1,  clockTumbler.dateTime.getMinutes().toString());
                tumbler.setCurrentIndexAt(2,  clockTumbler.dateTime.getSeconds().toString());


//                //clockTumbler.dateTime = new Date;
//                clockTumbler.dateTime = Date();
//
//
//                var component = Qt.createComponent("SelfDestroyingRect.qml");
//                var object = component.createObject(container);
//                object.x = (object.width + 10) * 0;

                //timeTumbler.text = Date().getSeconds().toString();

                var d = new Date();
                //d = Date();
                //var s = addZero(d.getSeconds());
//                timeTumbler.text = d.toString();
                timeTumbler.text = d.getSeconds().toString();

                /*
                //function myFunction()
                //{
                //    var d = new Date();
                //    d = Date();
                //    var h = addZero(d.getHours());
                //    var m = addZero(d.getMinutes());
                //    var s = addZero(d.getSeconds());
                //    x.innerHTML = h + ":" + m + ":" + s;
                //}
            }
        }

        Tumbler
        {
            id: tumbler
            anchors.centerIn: parent

            // TODO: Use FontMetrics with 5.4
            Label {
                id: characterMetrics
                font.bold: true
                font.pixelSize: textSingleton.font.pixelSize * 1.25
                font.family: openSans.name
                visible: false
                text: "M"
            }

            readonly property real delegateTextMargins: characterMetrics.width * 1.5

            TumblerColumn
            {
                id: hourColumn
                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 24; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }


                //ClockDigitalSpinner { max: 24;
                //    value: clockTumbler.dateTime.getHours();
                //    //value: //var h =
                      //  Math.floor(seconds / 3600);
                //}

            }

            TumblerColumn
            {
                id: minuteColumn
                width: characterMetrics.width * 3 + tumbler.delegateTextMargins
                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 60; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }

                //onCurrentIndexChanged: tumblerDayColumn.updateModel()
            }

            TumblerColumn
            {
                id: secondColumn
                width: characterMetrics.width * 4 + tumbler.delegateTextMargins

                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 60; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }
            }
//////////////////////////////////////////////////////////////////////////////////
        }
    }
*/

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


/*

    Timer {
        interval: 500; running: true; repeat: true
        onTriggered: time.text = Date().toString()
    }

    Text { id: time }


    Text
    {
        id: timeTumbler
        x: root.width / 2
        text: "___TIME___"
    }

    Item
    {
        id: clockTumbler
        //darkBackground: false

        x: root.width / 2
        y: root.height / 2

        property date dateTime

        readonly property int indxHour: 0
        readonly property int indxMin:  1
        readonly property int indxSec:  2


//        //property alias city: cityLabel.text
//        property int hours
//        property int minutes
//        property int seconds
//        property real shift
//        property bool night: false
//        property bool internationalTime: true //Unset for local time
//
//        function timeChanged() {
//            var date = new Date;
//            hours = internationalTime ? date.getUTCHours() + Math.floor(clock.shift) : date.getHours()
//            night = ( hours < 7 || hours > 19 )
//            minutes = internationalTime ? date.getUTCMinutes() + ((clock.shift % 1) * 60) : date.getMinutes()
//            seconds = date.getUTCSeconds();
//        }
//
//        Timer {
//            interval: 100; running: true; repeat: true;
//            onTriggered: clock.timeChanged()
//        }


            Timer
            {
                id : timer
                interval: 1000; running: true; repeat: true
                onTriggered:
                {
                    //clockTumbler.dateTime = new Date;
                    clockTumbler.dateTime = Date();

                    tumbler.setCurrentIndexAt(indxHour, clockTumbler.dateTime.getHours());
                    tumbler.setCurrentIndexAt(indxMin,  clockTumbler.dateTime.getMinutes());
                    tumbler.setCurrentIndexAt(indxSec,  clockTumbler.dateTime.getSeconds());

                    var component = Qt.createComponent("SelfDestroyingRect.qml");
                    var object = component.createObject(container);
                    object.x = (object.width + 10) * 0;

                    timeTumbler.text = Date().getSeconds().toString();
                }
            }


        Tumbler {
            id: tumbler
            anchors.centerIn: parent

            // TODO: Use FontMetrics with 5.4
            Label {
                id: characterMetrics
                font.bold: true
                font.pixelSize: textSingleton.font.pixelSize * 1.25
                font.family: openSans.name
                visible: false
                text: "M"
            }

            readonly property real delegateTextMargins: characterMetrics.width * 1.5
            //readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

            TumblerColumn
            {
                id: hourColumn
                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 24; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }


                //ClockDigitalSpinner { max: 24;
                //    value: clockTumbler.dateTime.getHours();
                //    //value: //var h =
                      //  Math.floor(seconds / 3600);
                //}


//                function updateModel() {
//                    var previousIndex = tumblerDayColumn.currentIndex;
//                    var newDays = tumbler.days[monthColumn.currentIndex];
//
//                    if (!model) {
//                        var array = [];
//                        for (var i = 0; i < newDays; ++i) {
//                            array.push(i + 1);
//                        }
//                        model = array;
//                    } else {
//                        // If we've already got days in the model, just add or remove
//                        // the minimum amount necessary to make spinning the month column fast.
//                        var difference = model.length - newDays;
//                        if (model.length > newDays) {
//                            model.splice(model.length - 1, difference);
//                        } else {
//                            var lastDay = model[model.length - 1];
//                            for (i = lastDay; i < lastDay + difference; ++i) {
//                                model.push(i + 1);
//                            }
//                        }
//                    }
//
//                    tumbler.setCurrentIndexAt(0, Math.min(newDays - 1, previousIndex));
//                }




//                id: tumblerDayColumn
//
//                function updateModel() {
//                    var previousIndex = tumblerDayColumn.currentIndex;
//                    var newDays = tumbler.days[monthColumn.currentIndex];
//
//                    if (!model) {
//                        var array = [];
//                        for (var i = 0; i < newDays; ++i) {
//                            array.push(i + 1);
//                        }
//                        model = array;
//                    } else {
//                        // If we've already got days in the model, just add or remove
//                        // the minimum amount necessary to make spinning the month column fast.
//                        var difference = model.length - newDays;
//                        if (model.length > newDays) {
//                            model.splice(model.length - 1, difference);
//                        } else {
//                            var lastDay = model[model.length - 1];
//                            for (i = lastDay; i < lastDay + difference; ++i) {
//                                model.push(i + 1);
//                            }
//                        }
//                    }
//
//                    tumbler.setCurrentIndexAt(0, Math.min(newDays - 1, previousIndex));
//                }

            }

            TumblerColumn
            {
                id: minuteColumn
                width: characterMetrics.width * 3 + tumbler.delegateTextMargins
                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 60; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }

                //onCurrentIndexChanged: tumblerDayColumn.updateModel()

//                id: monthColumn
//                width: characterMetrics.width * 3 + tumbler.delegateTextMargins
//                model: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
//                onCurrentIndexChanged: tumblerDayColumn.updateModel()

            }

            TumblerColumn
            {
                id: secondColumn
                width: characterMetrics.width * 4 + tumbler.delegateTextMargins

                model: ListModel
                {
                    Component.onCompleted: {
                        for (var i = 0; i < 60; ++i)
                        { append( {value: i.toString()} ); }
                    }
                }


//                model: ListModel {
//                    Component.onCompleted: {
//                        for (var i = 2000; i < 2100; ++i) {
//                            append({value: i.toString()});
//                        }
//                    }
//                }

            }
//////////////////////////////////////////////////////////////////////////////////
        }
    }
//*/


//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


/*
    Item
    {
        id: tumblerView
        //darkBackground: false

        x: root.width / 2
        y: root.height / 2

        Tumbler {
            id: tumbler
            anchors.centerIn: parent

            // TODO: Use FontMetrics with 5.4
            Label {
                id: characterMetrics
                font.bold: true
                font.pixelSize: textSingleton.font.pixelSize * 1.25
                font.family: openSans.name
                visible: false
                text: "M"
            }

            readonly property real delegateTextMargins: characterMetrics.width * 1.5
            readonly property var days: [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

            TumblerColumn {
                id: tumblerDayColumn

                function updateModel() {
                    var previousIndex = tumblerDayColumn.currentIndex;
                    var newDays = tumbler.days[monthColumn.currentIndex];

                    if (!model) {
                        var array = [];
                        for (var i = 0; i < newDays; ++i) {
                            array.push(i + 1);
                        }
                        model = array;
                    } else {
                        // If we've already got days in the model, just add or remove
                        // the minimum amount necessary to make spinning the month column fast.
                        var difference = model.length - newDays;
                        if (model.length > newDays) {
                            model.splice(model.length - 1, difference);
                        } else {
                            var lastDay = model[model.length - 1];
                            for (i = lastDay; i < lastDay + difference; ++i) {
                                model.push(i + 1);
                            }
                        }
                    }

                    tumbler.setCurrentIndexAt(0, Math.min(newDays - 1, previousIndex));
                }
            }
            TumblerColumn {
                id: monthColumn
                width: characterMetrics.width * 3 + tumbler.delegateTextMargins
                model: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
                onCurrentIndexChanged: tumblerDayColumn.updateModel()
            }
            TumblerColumn {
                width: characterMetrics.width * 4 + tumbler.delegateTextMargins
                model: ListModel {
                    Component.onCompleted: {
                        for (var i = 2000; i < 2100; ++i) {
                            append({value: i.toString()});
                        }
                    }
                }
            }
        }
    }
//*/

//////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////


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
    */

}
