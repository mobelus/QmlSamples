#ifndef PERSONINFO_H
#define PERSONINFO_H

#include <QString>

class PersonInfo
{
public:
	PersonInfo(const QString& id, const QString& name, const QString& phone);

	QString getUserid() const;
	void setUserid(const QString &value);

	QString getName() const;
	void setName(const QString &value);

	QString getPhone() const;
	void setPhone(const QString &value);

private:
	QString _userid;
	QString _name;
	QString _phone;
};

#endif // PERSONINFO_H
