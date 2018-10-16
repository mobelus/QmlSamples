import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow
{
	id: root
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")

	property bool isFrameless: false

	flags: (root.isFrameless) ? (Qt.FramelessWindowHint) : (Qt.Window)

	Button { text: "EnableFrameless"
		x: 192; y: 0; width: 100; height: 40
		MouseArea { onClicked: root.isFrameless = !root.isFrameless; anchors.fill: parent; }
	}


	//
	Button { text: "Close"
		x: 540; y: 0; width: 100; height: 40
		MouseArea { onClicked: Qt.quit(); anchors.fill: parent; }
	}

	//
	Button { text: "Resize"
		x: 427; y: 0; width: 100; height: 40
		MouseArea { /*onClicked: ???;*/ anchors.fill: parent; }
	}

	Button { text: "show"
		x: 427; y: 54; width: 100; height: 40
		MouseArea { onClicked: root.show(); anchors.fill: parent; }
	}

	Button { text: "showNormal"
		x: 427; y: 107; width: 100; height: 40
		MouseArea { onClicked: root.showNormal(); anchors.fill: parent; }
	}

	Button { text: "showMinimized"
		x: 427; y: 162; width: 100; height: 40
		MouseArea { onClicked: root.showMinimized(); anchors.fill: parent; }
	}

	Button { text: "showMaximized"
		x: 427; y: 220; width: 100; height: 40
		MouseArea { onClicked: root.showMaximized(); anchors.fill: parent; }
	}

	Button { text: "showFullScreen"
		x: 427; y: 276; width: 100; height: 40
		MouseArea { onClicked: root.showFullScreen(); anchors.fill: parent; }
	}

	//
	Button { text: "Hide"
		x: 313; y: 0; width: 100; height: 40
		MouseArea { onClicked: root.hide(); anchors.fill: parent; }
	}

}
