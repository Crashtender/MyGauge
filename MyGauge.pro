QT += qml quick network

CONFIG += c++11

SOURCES += main.cpp \
    ../ExtPlane/client/extplane-client-qt/simulateddatarefs/alternatingsimulateddataref.cpp \
    ../ExtPlane/client/extplane-client-qt/simulateddatarefs/fixedsimulateddataref.cpp \
    ../ExtPlane/client/extplane-client-qt/simulateddatarefs/simulateddataref.cpp \
    ../ExtPlane/client/extplane-client-qt/clientdataref.cpp \
    ../ExtPlane/client/extplane-client-qt/clientdatarefprovider.cpp \
    ../ExtPlane/client/extplane-client-qt/extplaneclient.cpp \
    ../ExtPlane/client/extplane-client-qt/extplaneconnection.cpp \
    ../ExtPlane/client/extplane-client-qt/simulatedextplaneconnection.cpp \
    subscriptions.cpp \
    datarefhandler.cpp \
    settings.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

SUBDIRS += \
    ../ExtPlane/client/extplane-client-qt/extplane-client-qt.pro

HEADERS += \
    ../ExtPlane/client/extplane-client-qt/simulateddatarefs/alternatingsimulateddataref.h \
    ../ExtPlane/client/extplane-client-qt/simulateddatarefs/fixedsimulateddataref.h \
    ../ExtPlane/client/extplane-client-qt/simulateddatarefs/simulateddataref.h \
    ../ExtPlane/client/extplane-client-qt/clientdataref.h \
    ../ExtPlane/client/extplane-client-qt/clientdatarefprovider.h \
    ../ExtPlane/client/extplane-client-qt/extplaneclient.h \
    ../ExtPlane/client/extplane-client-qt/extplaneconnection.h \
    ../ExtPlane/client/extplane-client-qt/simulatedextplaneconnection.h \
    datarefhandler.h \
    subscriptions.h

DISTFILES += \
    Gauge.qml

FORMS +=
