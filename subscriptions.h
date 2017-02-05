#ifndef SUBSCRIPTIONS_H
#define SUBSCRIPTIONS_H

#include <QtCore/QtCore>


enum DataRefType {
    drFloat, drInt, drChar
};

struct DataRefStruct {
    QString         dataref;        // Datarefs from X-Plane
    float           tolerance;      // Update tolerance (deviation from previous value; 0 = every frame)
    DataRefType     dataType;       // As defined above (drFloat, drInt, drChar)
    QString         id;             // ID for gauge qml
    double          value;          // Last value
    QString         data;           // Last data string
};


#endif // SUBSCRIPTIONS_H
