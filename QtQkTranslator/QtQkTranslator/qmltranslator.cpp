#include "qmltranslator.h"
#include <QGuiApplication>

QmlTranslator::QmlTranslator(QObject *parent) : QObject(parent)
{

}

void QmlTranslator::setTranslation(QString translation)
{
	//m_translator.load("://QmlLanguage_" + translation, "."); // Загружаем перевод
	//m_translator.load("://QmlLanguage_" + translation, "."); // Загружаем перевод
	m_translator.load(":/QmlLanguage_" + translation, "."); // Загружаем перевод
	qApp->installTranslator(&m_translator);                 // Устанавливаем его в приложение
	emit languageChanged();                                 // Сигнализируем об изменении текущего перевода
}
