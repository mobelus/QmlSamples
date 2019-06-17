#ifndef PERSONTABLEMODEL_H
#define PERSONTABLEMODEL_H

#include <QAbstractTableModel>

#include "PersonInfo.h"

class PersonTableModel : public QAbstractTableModel
{
	Q_OBJECT
public:
	enum TableItemRoles { UserIdRole = Qt::UserRole + 1, NameRole, PhoneRole };

	explicit PersonTableModel(QObject *parent = nullptr);
	// Число строк и столбцов в модели
	int rowCount(const QModelIndex &parent = QModelIndex()) const;
	int columnCount(const QModelIndex & = QModelIndex()) const override;
	// Доступ к данным
	QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
	// Установка данных (*) по заданию не требовалась
	//bool setData(const QModelIndex &index, const QVariant &value, int role);

public slots:
	// Загрузить из файла
	void restore();

protected:
	QHash<int, QByteArray> roleNames() const override;

private:
	QList<PersonInfo> _items;
	QString _fileName;
};


#endif // PERSONTABLEMODEL_H
