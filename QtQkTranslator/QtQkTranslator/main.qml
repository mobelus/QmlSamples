import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

ApplicationWindow
{
	id: applicationWindow
	visible: true
	width: 640
	height: 480
	title: qsTr("Hello World")


	ComboBox {
		id: comboBox
		anchors {
			top: parent.top
			left: parent.horizontalCenter
			right: parent.right
			margins: 10
		}

		model: ["en_US", "ru_RU"]
		//model: ["en", "ru"]

		// При изменении текста, инициализируем установку перевода через С++ слой
		onCurrentTextChanged: {
			qmlTranslator.setTranslation(comboBox.currentText)
		}
	}

	Connections {
		target: qmlTranslator   // был зарегистрирован в main.cpp
		onLanguageChanged: {    // при получении сигнала изменения языка
			retranslateUi()     // инициализируем перевод интерфейса
		}
	}


	// Функция перевода интерфейса
	function retranslateUi() {
		applicationWindow.title = qsTr("Hello World")
		/*
		helloLabel.text = qsTr("Hello World")
		labelText.text = qsTr("The QTranslator class provides internationalization" +
							  "support for text output.An object of this class contains " +
							  "a set of translations from a source language to a target language. " +
							  "QTranslator provides functions to look up translations in a translation file. " +
							  "Translation files are created using Qt Linguist.")
		*/
	}

	// Запускаем перевод приложения, когда окно приложения было создано
	Component.onCompleted: {
		retranslateUi();
	}
	/*
	SwipeView
	{
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
