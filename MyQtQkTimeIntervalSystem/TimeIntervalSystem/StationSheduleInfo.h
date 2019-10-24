#ifndef STATIONSHEDULEINFO_H
#define STATIONSHEDULEINFO_H

#include <QString>
#include <QDateTime>



class StationSheduleInfo
{
public:
	StationSheduleInfo();
	StationSheduleInfo
	(
              const QString& tarin
			, const QString& station
			, const QString& arive
			, const QString& departure
			);

	int trainNum() const;
	void setTrainNum(int trainNum);

	QString stationName() const;
	void setStationName(const QString &stationName);

	QString departureTimeString() const;
	QDateTime arivalTime() const;
	void setArivalTime(const QDateTime &arivalTime);

	QString arivalTimeString() const;
	QDateTime departureTime() const;
	void setDepartureTime(const QDateTime &departureTime);

private:
    QString _format;

    int _trainNum;
	QString _stationName;
	QDateTime _arivalTime;
	QDateTime _departureTime;

};

#endif // STATIONSHEDULEINFO_H
