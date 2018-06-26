import QtQuick 2.2

// import "DIRECTORY_NAME"
import "./_template"
import "./Arm"
import "./Ampermeter"
import "./AmpermeterModern"
import "./AmpermeterCircle"
import "./AmpermeterButtonTest"
import "./ButtonDelay"
import "./ButtonToggle"
import "./ClockTumbler"
import "./ClockDigital"
import "./PlayIndicator"

import "./_core/Devices_logic.js" as Logic

Item
{
    id: root
    width: 2500
    height: 1500

    //*** SIMPLIEST EXAMPLE ***
    Template // from folder _Template
    {
    }

    //*** PLAY ***
    PlayIndicator
    {
        id: play_indicator
        objectName: "play_indicator"
        width: 100
        height: 100
        opacity: 1
    }

    //*** APM ***
    Arm
    {
        id: arm1
        objectName: "ARM_DSP1"
        logic: new Logic.Arm()
        x: 350
        width: 200
        height: 150
        captionText: "АРМ ДСП1"
    }

    //*** AMPERMETER ***
    Ampermeter
    {
        id: amper01
        objectName: "AMPER01"
        logic: new Logic.Ampermeter()
        x: 650
        valueMin: 0
        valueMax: 140
    }

    AmpermeterButtonTest { x: 681; y: 306; buttonCaption: "Accelerate 3"; someValue: 3; onClicked: { amper01.valueAmpers = someValue } }
    AmpermeterButtonTest { x: 821; y: 306; buttonCaption: "Accelerate 5"; someValue: 5; onClicked: { amper01.valueAmpers = someValue } }

    //*** AMPERMETER ***
    AmpermeterModern
    {
        id: amper02
        objectName: "AMPER02"
        logic: new Logic.Ampermeter()
        x: 1032
        y: 0
        valueMin: 0
        valueMax: 140
    }

    AmpermeterButtonTest { x: 1061; y: 306; buttonCaption: "Accelerate 3"; someValue: 3; onClicked: { amper02.valueAmpers = someValue } }
    AmpermeterButtonTest { x: 1200; y: 306; buttonCaption: "Accelerate 5"; someValue: 5; onClicked: { amper02.valueAmpers = someValue } }

    //*** AMPERMETER ***
    AmpermeterCircle
    {
        id: amper03
        objectName: "AMPER03"
        logic: new Logic.Ampermeter()
        x: 1412
        y: 0
        valueMin: 0
        valueMax: 140
    }

    AmpermeterButtonTest { x: 1440; y: 306; buttonCaption: "Accelerate 3"; someValue: 3; onClicked: { amper03.valueAmpers = someValue } }
    AmpermeterButtonTest { x: 1580; y: 306; buttonCaption: "Accelerate 5"; someValue: 5; onClicked: { amper03.valueAmpers = someValue } }


    //*** ClockTumbler ***
    ClockTumbler
    {
        id: clockTmblr
        objectName: "CLOCK_TMBLR"
        //logic: new Logic.Arm()
        x: 791
        y: 496
        width: 200
        height: 150
        //captionText: "АРМ ДСП1"
    }

    //*** ClockDigital ***
    ClockDigital
    {
        x: 1190
        y: 496
        width: 200
        height: 150
    }

    //*** Button Delay / Exit / get Playback ***
    ButtonDelay
    {
        x: 357
        y: 505
        width: 200
        height: 150
    }

    //*** Button Toggle / On/Off ***
    ButtonToggle
    {
        x: 48
        y: 505
        width: 200
        height: 150
    }


}

