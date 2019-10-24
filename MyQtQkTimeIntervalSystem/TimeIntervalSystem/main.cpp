#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include <QQmlContext>

#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>
#include <QJsonArray>
#include <QVector>
#include <QPair>


#include "StationSheduleTableModel.h"


void regexpTest()
{

   QString jsonText = "uuZ{\"trainNumber\": 10, \"change\": [{\"TS436P.State\": \"1\"}, {\"TS434P.State\": \"1\"}, {\"TS432P.State\": \"1\"}], \"datetime\": \"2019-10-14T17:34:29.722849\"}uuZ";

   //jsonText.left()
   int leftSemicol = jsonText.indexOf('{');
   int rightSemicol = jsonText.lastIndexOf('}');
   QString jsonStr = jsonText.mid(leftSemicol, ((jsonText.size() - leftSemicol) - (jsonText.size() - rightSemicol)) + 1);

   QJsonDocument doc = QJsonDocument::fromJson( jsonStr.toUtf8() );
   QJsonObject obj = doc.object();
   QJsonValue trnNum = obj.value("trainNumber");
   QJsonValue dt = obj.value("datetime");

   QString strTrainNum = trnNum.toString();
   int nTrainNum = trnNum.toInt();
   QString strDateTime = trnNum.toString();
   QDateTime dtDateTime = QDateTime::fromString(trnNum.toString());

   QJsonArray changesArr = obj.value(QString("change")).toArray();
   QStringList cnahgesStrList;
   QVector<QPair<int, QString>> vec;

   for(int j = 0; j < changesArr.size(); j++)
   {
//        cnahgesStrList.push_back( changesArr[j].toString() );
        //QPair<int, QString> pr();
        //cnahgesStrList.push_back( changesArr[j].toString() );

       //QJsonValue v = changesArr[j].toValue();

      QString ss =  changesArr[j].toString();
      //QString ss =  changesArr[j].toString();

       QJsonValue v =  changesArr.at(j);

       QString g = v.toString();
       int n = v.toInt();
       n = n;
   }

   int z = 0;
/*
   QRegExp regExp = ;
           "////api//1.1//occupation";

{
"trainNumber": 11,
"change":
    [
    "TS213P.State=1",
    "TS211P.State=1",
    "TS179P.State=1",
    "TS177P.State=1"
    ],
"datetime": "2019-10-11T18:30:40.239352"
}

*/

}

int main(int argc, char *argv[])
{
    QStringList strRequest;
    strRequest.push_back("//api/1.1/ocup");
    strRequest.push_back("//api/1.1/ocup");

    QString qsApi = ("//api/");
    QString qsVer = strRequest[1].mid( qsApi.size(), strRequest[1].size() - qsApi.size() );
    int dotPos = qsVer.indexOf("."), slashPos = qsVer.indexOf("/");
    QString qsMin = qsVer.mid(0, dotPos);
    QString qsMax = qsVer.mid(dotPos + 1, (slashPos - dotPos) - 1);
    int requestedApiVersion[2]{ qsMin.toInt(), qsMax.toInt() };


    QString s("1234567890");
    s = s.mid(3, s.length() - 3); // all after first 3
    s = s.left(3); // first 3
    s = s.right(3); // last 3


    regexpTest();

	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

	//PersonTableModel personTableModel;
	StationSheduleTableModel stationSheduleTableModel;

	QGuiApplication app(argc, argv);

	QQmlApplicationEngine engine;

	engine.rootContext()->setContextProperty("stationSheduleTableModel", &stationSheduleTableModel);

	engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
	if (engine.rootObjects().isEmpty())
		return -1;

	return app.exec();
}
