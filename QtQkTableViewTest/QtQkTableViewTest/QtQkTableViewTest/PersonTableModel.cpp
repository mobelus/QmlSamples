#include "PersonTableModel.h"

#include <QFile>
#include <QDebug>

PersonTableModel::PersonTableModel(QObject *parent)
	: QAbstractTableModel(parent)
    , _fileName("C:/Users/Public/QtProjects/QtQkTableViewTest/QtQkTableViewTest/QtQkTableViewTest/test.csv") // Имя файла откуда считать данные
{
	restore();
}


int PersonTableModel::rowCount(const QModelIndex & parent) const
{
	Q_UNUSED(parent);
	return _items.count();
}


int PersonTableModel::columnCount(const QModelIndex & parent) const
{
	Q_UNUSED(parent);
	return 3;
}


QVariant PersonTableModel::data(const QModelIndex & index, int role) const
{
	if (index.row() < 0 || index.row() >= _items.count())
		return QVariant();

	const PersonInfo &item = _items[index.row()];
	if (role == UserIdRole)
		return item.getUserid();
	else if (role == NameRole)
		return item.getName();
	else if (role == PhoneRole)
		return item.getPhone();

	return QVariant();
}


void PersonTableModel::restore()
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
			_items.append( PersonInfo(item[0], item[1], item[2]) );
		}
		file.close();
	}
}


QHash<int, QByteArray> PersonTableModel::roleNames() const
{
	// Имена столбцов используемые в QMLs (все привязки в qml через строки)
	QHash<int, QByteArray> roles;
	roles[UserIdRole] = "modelUserId";
	roles[NameRole]   = "modelName";
	roles[PhoneRole]  = "modelPhone";
	return roles;
}

