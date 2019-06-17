import QtQuick 2.6
import QtQuick.Window 2.2

import QtQuick.Controls 2.2
import QtQuick.Controls 1.4

import PersonTableModel 0.1

Window
{
	id: root
	visible: true
	width: 500
	height: 300
	title: qsTr("Qml TableView Test App")

	TableView
	{
		anchors.fill: parent

		TableViewColumn
		{
			role: "modelUserId" // Эти роли (строковые значения) совпадают с названиями ролей в C++ модели
			title: "UserId"
		}

		TableViewColumn
		{
			role: "modelName"
			title: "Name"
		}

		TableViewColumn
		{
			role: "modelPhone"
			title: "Phone"
		}

		// Устанавливаем модель в TableView
		model: PersonTableModel { }
	}
}
