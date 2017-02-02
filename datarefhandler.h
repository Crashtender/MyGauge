#ifndef DATAREFHANDLER_H
#define DATAREFHANDLER_H

#include <QObject>
#include <QtCore>
#include <QDebug>

#include "../ExtPlane/client/extplane-client-qt/extplaneconnection.h"
#include "../ExtPlane/client/extplane-client-qt/extplaneclient.h"
#include "subscriptions.h"

class DatarefHandler : public QObject
{
    Q_OBJECT

public:
    DatarefHandler(QObject *parent = 0);

public slots:
    void refChanged(QString, double);
    void refChanged(QString, QString);
    //void refChanged(QString, QStringList);

private:
    ExtPlaneConnection *connection;
    ExtPlaneClient *client;
    QHash <QString, DataRefStruct> dataRefLookup;


signals:
    void newDouble(QString name, double value);
    void newData(QString name, QString string);
};

#endif // DATAREFHANDLER_H
