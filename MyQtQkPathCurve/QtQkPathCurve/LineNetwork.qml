import QtQuick 2.0

Item {

    property int xc_1: 100
    property int yc_1: 100

    property int xc_2: 100
    property int yc_2: 200

    property int size: 10
    property string lineColor: "red"

    state: "off_state"

    width: if (xc_1 == xc_2) { size }
           else {
               if(Math.abs(xc_1) > Math.abs(xc_2) ) { Math.abs(xc_1) - Math.abs(xc_2) }
               if(Math.abs(xc_1) < Math.abs(xc_2) ) { Math.abs(xc_2) - Math.abs(xc_1) }
           }

    height: if(yc_1 == yc_2) { size }
            else {
                if(Math.abs(yc_1) > Math.abs(yc_2) ) { Math.abs(yc_1) - Math.abs(yc_2) }
                if(Math.abs(yc_1) < Math.abs(yc_2) ) { Math.abs(yc_2) - Math.abs(yc_1) }
            }

    x:{ if(xc_1 == xc_2) { xc_1 - size/2 }
        else { xc_1 }
    }

    y:{ if(yc_1 == yc_2) { yc_1 - size/2 }
        else { yc_1 }
    }

    Rectangle
    {
        id: line
        color: lineColor
        width: parent.width
        height: parent.height
        //x: parent.x
        //y: parent.y
    }

    states:
    [
        State
        {
            name: "off_state"
            PropertyChanges { target: line; color: "red" }
        },
        State
        {
            name: "on_state"
            PropertyChanges { target: line; color: "green" }
        }
    ]

/*
    transitions:
        [
        Transition {
            from: "1"
            to: "2"

            ColorAnimation {
                duration: 200
            }
        },
        Transition {
            from: "2"
            to: "1"

            ColorAnimation {
                duration: 2000
            }
        }
    ]
*/
}
