#ifndef SUBSCRIPTIONS_H
#define SUBSCRIPTIONS_H

#include <QtCore/QtCore>


enum DataRefType {
    drFloat, drInt, drChar
};

struct DataRefStruct {
    QString         dataref;        // As can be found on http://xplane.anzui.de/dataref-search/
    float           tolerance;      // Update tolerance (0: every frame)
    DataRefType     dataType;       // As defined above (drFloat, drInt, drChar)
    QString         id;             // ID for gauge qml
    double          value;          // Last value
    QString         data;           // Last data string
};


#endif // SUBSCRIPTIONS_H
