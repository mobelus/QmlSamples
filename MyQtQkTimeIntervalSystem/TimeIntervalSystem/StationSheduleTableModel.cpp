#include "StationSheduleTableModel.h"

#include <QFile>
#include <QDebug>
#include <QDateTime>

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>


StationSheduleTableModel::StationSheduleTableModel(QObject *parent)
	: QAbstractTableModel(parent)
{
	elementsNum = static_cast<int>(DepartureTimeRole) - static_cast<int>(Qt::UserRole + 1); // ну или просто 5
	distanceNum = 4; // каждый следующий поезд через 4 строчки предыдущего поезда

    //_fileName = "./../TimeIntervalSystem/test.csv"; // Имя файла откуда считать данные
    //	restoreFromCsv();

    _fileName = "./../TimeIntervalSystem/time-interval-system.json"; // Имя файла откуда считать данные
    //restoreFromJson();
}

void StationSheduleTableModel::restoreFromJson()
{
    const bool ENABLE_DIAGNOSTIC_INFO = false;

    // Загрузка из CSV формата
    QFile file( _fileName );
    if ( !file.open(QFile::ReadOnly | QFile::Text) )
    {
        qDebug() << "File does not exist";
    }
    else
    {
        QString val;

        file.open(QIODevice::ReadOnly | QIODevice::Text);
        val = file.readAll();
        file.close();

        QJsonDocument d = QJsonDocument::fromJson(val.toUtf8());

        QJsonObject routesObj = d.object();
        QJsonValue value = routesObj.value(QString("time-interval-system"));
        if(ENABLE_DIAGNOSTIC_INFO) qWarning() << value;
        QJsonArray routesArr = value.toArray();

        for(int i = 0; i < routesArr.size(); i++)
        {
            QJsonObject routesItem = routesArr[i].toObject();

            QJsonValue routNum = routesItem["routeNumber"];
            bool b = false;
            int nRoutNum = routNum.toInt();
            QString qsRoutNum = QString::number(nRoutNum); //routNum.toString();

            if(ENABLE_DIAGNOSTIC_INFO) qWarning() << routNum.toInt();

            QJsonArray stopsArr = routesItem["stops"].toArray();
            for(int j = 0; j < stopsArr.size(); j++)
            {
                QJsonObject item = stopsArr[j].toObject();

                //QJsonValue station = item.value("station");
                QJsonValue station = item["station"];
                QJsonValue arrival = item["timeArrival"];
                QJsonValue departure = item["timeDeparture"];

                QString format = "yyyy-MM-ddThh:mm:ss.zzzZ"; // "hh:mm dd-MM-yyyy";

                QString qsStation = station.toString();
                QDateTime dtA = QDateTime::fromString(arrival.toString().trimmed(), format);
                QDateTime dtD = QDateTime::fromString(departure.toString().trimmed(), format);
                QString qsArrival   = dtA.toString( format );
                QString qsDeparture = dtD.toString( format );

                if(ENABLE_DIAGNOSTIC_INFO)
                {
                    qWarning() << qsStation << "\n";
                    qWarning() << qsArrival;
                    qWarning() << qsDeparture;
                }

                StationSheduleInfo st =
                    StationSheduleInfo (qsRoutNum, qsStation, qsArrival, qsDeparture);

                // THE MAGIC OF INSERTED DATA
                // AND THE FACT THAT THE VIEW HAS UPDATED WITH THE MODEL DATA
                // IS IN  beginInsertRows  and  endInsertRows  methods !!!
                beginInsertRows(QModelIndex(), 0, 0);

                _items.append( st );

                endInsertRows();

            }
            qWarning() << "\n";
        }
    }
}

void StationSheduleTableModel::restoreFromCsv()
{
    // Загрузка из CSV формата
    QFile file( _fileName );
    if ( !file.open(QFile::ReadOnly | QFile::Text) )
    {
        qDebug() << "File does not exist";
    }
    else
    {
        QTextStream in(&file);

        while (!in.atEnd())
        {
            QString line = in.readLine();
            QStringList item = line.split(";");
            StationSheduleInfo st =
                    StationSheduleInfo (item[0], item[1], item[2], item[3]);

            _items.append( st );
        }
        file.close();
    }
}



void StationSheduleTableModel::Insert( StationSheduleInfo &data )
{
  // my question is the 'first' and 'last' args of beginInsertRows
  beginInsertRows(QModelIndex(), 0, 0);

  _items.insert(_items.begin(), data);

  endInsertRows();
}




int StationSheduleTableModel::rowCount(const QModelIndex & parent) const
{
	Q_UNUSED(parent)
	return _items.count();
}

int StationSheduleTableModel::columnCount(const QModelIndex & parent) const
{
	Q_UNUSED(parent)
    return elementsNum;
}

QVariant StationSheduleTableModel::data(const QModelIndex & index, int role) const
{
	if (index.row() < 0 || index.row() >= _items.count())
		return QVariant();

	const StationSheduleInfo &item = _items[index.row()];

	if(false) { }
	else if (role == TrainNumberRole) //	return item.trainNum();
	{
		if( index.row() % distanceNum == 0)
			return item.trainNum();
	}
	else if (role == StationNameRole)
		return item.stationName();
	else if (role == ArivalTimeRole)
		return item.arivalTimeString();
	else if (role == DepartureTimeRole)
		return item.departureTimeString();

	return QVariant();
}



bool StationSheduleTableModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    int irow = index.row();
    int cnt  = _items.count();

    if ( irow < 0 || irow >= cnt)
        return false;

    StationSheduleInfo &item = _items[irow];

    if (false) { }
    else if (role == TrainNumberRole)   { item.setTrainNum   (  value.toInt()     ); emit dataChanged(index, index); return true; }
    else if (role == StationNameRole)   { item.setStationName(  value.toString()  ); emit dataChanged(index, index); return true; }
    else if (role == ArivalTimeRole)    { item.setArivalTime (  value.toDateTime()); emit dataChanged(index, index); return true; }
    else if (role == DepartureTimeRole) { item.setDepartureTime(value.toDateTime()); emit dataChanged(index, index); return true; }

    return false;
}


QHash<int, QByteArray> StationSheduleTableModel::roleNames() const
{
	// Имена столбцов используемые в QMLs (все привязки в qml через строки)
	QHash<int, QByteArray> roles;
	roles[TrainNumberRole]  = "modelTrainNumber";
	roles[StationNameRole]  = "modelStationName";
	roles[ArivalTimeRole]   = "modelArrivalTime";
	roles[DepartureTimeRole]= "modelDepartureTime";

	return roles;
}
