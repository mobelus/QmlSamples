#ifndef STATIONSHEDULETABLEMODEL_H
#define STATIONSHEDULETABLEMODEL_H

#include <QAbstractTableModel>

#include "StationSheduleInfo.h"

class StationSheduleTableModel : public QAbstractTableModel
{
	Q_OBJECT
public:
	enum TableItemRoles
    {     TrainNumberRole = Qt::UserRole + 1
		, StationNameRole
		, ArivalTimeRole
		, DepartureTimeRole
	};

	int elementsNum; // число всех строк в таблице
	int distanceNum; // расстояние до следующей строки которую надо показывать

	explicit StationSheduleTableModel(QObject *parent = nullptr);
	// Число строк и столбцов в модели
	int rowCount(const QModelIndex &parent = QModelIndex()) const;
	int columnCount(const QModelIndex & = QModelIndex()) const override;
	// Доступ к данным
	QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
	// Установка данных (*) по заданию не требовалась
    bool setData(const QModelIndex &index, const QVariant &value, int role);
    void Insert( StationSheduleInfo &data );

public slots:
	// Загрузить из файла
    void restoreFromCsv();
    void restoreFromJson();
    void resetData();

protected:
	QHash<int, QByteArray> roleNames() const override;

private:
    QVector<StationSheduleInfo> _items;
	QString _fileName;
};


#endif // STATIONSHEDULETABLEMODEL_H
