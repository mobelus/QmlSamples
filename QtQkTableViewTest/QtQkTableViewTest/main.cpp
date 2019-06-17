#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include "PersonTableModel.h"

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	PersonTableModel personTableModel;

	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;

	// VERSION 1 (see main.qml)
	// Передаём в QML движок укзатель на класс с моделью
	engine.rootContext()->setContextProperty("personTableModel", &personTableModel);

	// VERSION 2 (see main.qml)
	qmlRegisterType<PersonTableModel>("PersonTableModel", 0, 1, "PersonTableModel");

	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;


	return app.exec();
}
