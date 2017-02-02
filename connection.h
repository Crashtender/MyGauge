#ifndef CONNECTION_H
#define CONNECTION_H

#include <QObject>

#include "../ExtPlane/client/extplane-client-qt/extplaneconnection.h"
#include "../ExtPlane/client/extplane-client-qt/extplaneclient.h"

class Connection : public QObject
{
    Q_OBJECT
public:
    explicit Connection(QObject *parent = 0);

signals:

public slots:
};

#endif // CONNECTION_H
