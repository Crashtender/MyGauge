#include "datarefhandler.h"
#include "subscriptions.cpp"

DatarefHandler::DatarefHandler(QObject *parent)
{
    // Create connection to ExtPlane and register new client
    connection = new ExtPlaneConnection();
    client = new ExtPlaneClient(this, "myGauge", connection);
    connection->registerClient(client);

    connection->connectTo("127.0.0.1", 51000); // 192.168.0.3
    connection->setUpdateInterval(0.032);

    //subscriptions = new Subscriptions(this);

    // Count the datarefs that are enlisted for subscription
    int nDataRefs = sizeof(subscriptionList)/sizeof(subscriptionList[0]);
    qDebug() << "Total subscriptions: " << nDataRefs;

    for (int i=0; i < nDataRefs ;i++){
        client->subscribeDataRef(subscriptionList[i].dataref, subscriptionList[i].tolerance);
        dataRefLookup.insert(subscriptionList[i].dataref, subscriptionList[i]);
    }

    // Connect datarefs to the client
    connect(client, SIGNAL(refChanged(QString, double)),
            this, SLOT(refChanged(QString, double)));
    connect(client, SIGNAL(refChanged(QString, QString)),
            this, SLOT(refChanged(QString, QString)));

}


void DatarefHandler::refChanged(QString name, double value) {
    DataRefStruct   ref = dataRefLookup[name];
    if (ref.value == value) return;
    ref.value = value;
    //emit newPitch(value);
    emit newDouble(ref.id, ref.value);
}

void DatarefHandler::refChanged(QString name, QString string){
    DataRefStruct   ref = dataRefLookup[name];
    if (ref.data == string) return;
    ref.data = string;
    emit newData(name, string);
}
