#include "StationSheduleInfo.h"

//#include "common.h"

StationSheduleInfo::StationSheduleInfo()
{

}

StationSheduleInfo::StationSheduleInfo
(
          const QString& tarin
		, const QString& station
		, const QString& arive
		, const QString& departure
        ) //:
{
    _format = "yyyy-MM-ddThh:mm:ss.zzzZ";

    _trainNum   =  (tarin  .toInt());
	_stationName=  (station  );
	_arivalTime =  (QDateTime::fromString(     arive.trimmed(), _format) );
	_departureTime=(QDateTime::fromString( departure.trimmed(), _format) );
}


int StationSheduleInfo::trainNum() const
{
	return _trainNum;
}

void StationSheduleInfo::setTrainNum(int trainNum)
{
	_trainNum = trainNum;
}

QString StationSheduleInfo::stationName() const
{
	return _stationName;
}

void StationSheduleInfo::setStationName(const QString &stationName)
{
	_stationName = stationName;
}

//
QString StationSheduleInfo::arivalTimeString() const
{
	return _arivalTime.toString( _format );
}

QDateTime StationSheduleInfo::arivalTime() const
{
	return _arivalTime;
}

void StationSheduleInfo::setArivalTime(const QDateTime &arivalTime)
{
	_arivalTime = arivalTime;
}

//
QString StationSheduleInfo::departureTimeString() const
{
	return _departureTime.toString( _format );
}

QDateTime StationSheduleInfo::departureTime() const
{
	return _departureTime;
}

void StationSheduleInfo::setDepartureTime(const QDateTime &departureTime)
{
	_departureTime = departureTime;
}
