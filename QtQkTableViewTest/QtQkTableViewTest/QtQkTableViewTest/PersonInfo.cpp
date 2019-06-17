#include "PersonInfo.h"

PersonInfo::PersonInfo(const QString& id, const QString& name, const QString& phone)
	: _userid(id)
	, _name(name)
	, _phone(phone)
{
}

QString PersonInfo::getUserid() const
{
	return _userid;
}

void PersonInfo::setUserid(const QString &value)
{
	_userid = value;
}

QString PersonInfo::getName() const
{
	return _name;
}

void PersonInfo::setName(const QString &value)
{
	_name = value;
}

QString PersonInfo::getPhone() const
{
	return _phone;
}

void PersonInfo::setPhone(const QString &value)
{
	_phone = value;
}
