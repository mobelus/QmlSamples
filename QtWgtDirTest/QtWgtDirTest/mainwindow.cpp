#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <QDir>
#include <QDateTime>

MainWindow::MainWindow(QWidget *parent) :
	QMainWindow(parent),
	ui(new Ui::MainWindow)
{
	QDateTime dt = QDateTime::currentDateTime();
	QDir dr; dr.mkdir("C:/Users/Public/_EMU/_Dis_" + dt.toString("dd.MM.yyyy-hh:mm:ss.z"));

	ui->setupUi(this);
}

MainWindow::~MainWindow()
{
	delete ui;
}
