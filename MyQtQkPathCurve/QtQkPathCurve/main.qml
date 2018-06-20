import QtQuick 2.6
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    /*
    MainForm {
        anchors.fill: parent
        mouseArea.onClicked: {
            console.log(qsTr('Clicked on background. Text: "' + textEdit.text + '"'))
        }
    }
    */
/*
    Test
    {




    }
*/


//    id: mainContainer
//    height: 300
//    width: 300
//    x: 10
//    y: 10




//  Test {}

    Item
    {
        id: line_1_To_Arm
        property string lineState: "off_state"

        LineNetwork { x: 83; y: 65; xc_1: 100; yc_1: 100; xc_2: 100; yc_2: 200; size: 10; state: line_state }
        LineNetwork { x: 83; y: 194; xc_1: 100; yc_1: 100; xc_2: 200; yc_2: 100; size: 10; state: line_state }
    }





}
