#include "datarefhandler.h"
#include "settings.cpp"
#include "subscriptions.cpp"

DatarefHandler::DatarefHandler(QObject *parent)
{
    // Create connection to ExtPlane and register new client
    connection = new ExtPlaneConnection();
    client = new ExtPlaneClient(this, instrumentCompany + "_" + instrumentType, connection);
    connection->registerClient(client);

    connection->connectTo(ipHost, 51000);

    //Set update frequency (seconds) on the X-Plane side
    connection->setUpdateInterval(updateFreqHost);

    // Count the datarefs that are enlisted for subscription
    int nDataRefs = sizeof(subscriptionList)/sizeof(subscriptionList[0]);

    // Subscribe all enlisted datarefs and create a Hash lookup for quick data access
    for (int i=0; i < nDataRefs ;i++){
        client->subscribeDataRef(subscriptionList[i].dataref, subscriptionList[i].tolerance);
        dataRefLookup.insert(subscriptionList[i].dataref, subscriptionList[i]);
    }

    // Connect client datarefs to handler slots below
    connect(client, SIGNAL(refChanged(QString, double)),
            this, SLOT(refChanged(QString, double)));
    connect(client, SIGNAL(refChanged(QString, QString)),
            this, SLOT(refChanged(QString, QString)));

}


void DatarefHandler::refChanged(QString name, double value) {
    DataRefStruct   ref = dataRefLookup[name];
    ref.value = value;
    emit newDouble(ref.id, ref.value);
}

void DatarefHandler::refChanged(QString name, QString string){
    DataRefStruct   ref = dataRefLookup[name];
    ref.data = string;
    emit newData(name, string);
}

