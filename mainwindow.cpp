#include <QVariant> // Necessário para KF5 
#include <QStringList>
#include <KPluginMetaData>
#include <KCMultiDialog>
#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent): QMainWindow(parent), ui(new Ui::MainWindow){
    ui->setupUi(this);
}

MainWindow::~MainWindow(){
    delete ui;
}

void MainWindow::on_pushButton_clicked(){
#if QT_VERSION >= QT_VERSION_CHECK(6, 0, 0)
    QList<KPluginMetaData> plugins = KPluginMetaData::findPlugins("plasma/kcms/systemsettings");
#else
    QVector<KPluginMetaData> plugins = KPluginMetaData::findPlugins("plasma/kcms/systemsettings");
#endif

    if (plugins.isEmpty()) {
        qDebug() << "Nenhum plugin encontrado!";
        return;
    }

    KPluginMetaData meta = plugins.first();

    KCMultiDialog *dlg = new KCMultiDialog;
    dlg->addModule(meta);
    ui->widget->layout()->addWidget(dlg);
}

