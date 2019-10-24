import QtQuick 2.6
import QtQuick.Window 2.2

import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.2

Window
{
	id: root
	visible: true
    width: 650; height: 400
	title: qsTr("Load schedule Info From JsonFile to Table")

	TableView
	{
		id: tableView
        x: 64
        y: 0
        width: 586
        height: 347

        //anchors.fill: parent

		TableViewColumn
		{
			id: numberRoute
			role: "modelTrainNumber" // Эти роли совпадают с названиями ролей в C++ модели
			title: "Маршрут №"
			width: 80
		}

		TableViewColumn
		{
			id: station
			role: "modelStationName"
			title: "Станция"
			width: 120
		}

		TableViewColumn
		{
			id: arrival
			role: "modelArrivalTime"
			title: "Время прибытия"
			width: 120
		}

		TableViewColumn
		{
			id: departure
			role: "modelDepartureTime"
			title: "Время отправления"
			width: 120
		}

		model:  stationSheduleTableModel

		style: TableViewStyle
		{
			backgroundColor : "#FFD7DADA"

			headerDelegate: Rectangle
			{
				height: textItem.implicitHeight * 1.2
				width: textItem.implicitWidth
				color: "lightsteelblue"

				Text
				{
					id: textItem
					anchors.fill: parent
					verticalAlignment: Text.AlignVCenter
					horizontalAlignment: styleData.textAlignment
					anchors.leftMargin: 12
					text: styleData.value
					elide: Text.ElideRight
                    color: textColor
                    renderType: Text.NativeRendering
                }
            }
        }
    }

 Button {
     id: button
     x: 15
     y: 363
     text: qsTr("Load schedule")

     onClicked:
     {
         stationSheduleTableModel.restoreFromJson();

         /*
         stationSheduleTableModel.resetData();
         stationSheduleTableModel.submit();
         //stationSheduleTableModel.resetInternalData();
         //*/
         //tableView.model = stationSheduleTableModel;
         //stationSheduleTableModel.select();
     }
 }
}
