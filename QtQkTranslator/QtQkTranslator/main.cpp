#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QtQml>

#include "qmltranslator.h"


#include <QtGui>
//#include <QtDeclarative>

class TranslationTest : public QObject
{
	Q_OBJECT
	Q_PROPERTY(QString emptyString READ getEmptyString NOTIFY languageChanged)

public:
	TranslationTest() {
		translator1 = new QTranslator(this);
		translator2 = new QTranslator(this);
	}

	QString getEmptyString() {
		return "";
	}

	Q_INVOKABLE void selectLanguage(QString language) {
		if(language == QString("fr")) {
			translator1->load("t1_fr", ".");
			qApp->installTranslator(translator1);
		}

		if(language == QString("sp")) {
			translator2->load("t1_sp", ".");
			qApp->installTranslator(translator2);
		}

		if(language == QString("en")) {
			qApp->removeTranslator(translator1);
			qApp->removeTranslator(translator2);
		}

		emit languageChanged();
	}

signals:
	void languageChanged();

private:
	QTranslator *translator1;
	QTranslator *translator2;
};


int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);

	// Создаём объект для работы с переводами ...
	QmlTranslator qmlTranslator;

	QQmlApplicationEngine engine;
	// и регистрируем его в качестве контекста в Qml слое
	engine.rootContext()->setContextProperty("qmlTranslator", &qmlTranslator);
	engine.load(QUrl(QLatin1String("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();

	//QApplication app(argc, argv);
	/*
	TranslationTest myObj;
	view.rootContext()->setContextProperty("rootItem", (QObject*)&myObj);
	view.setSource(QUrl::fromLocalFile("main.qml"));
	view.show();
	return app.exec();
*/

}


