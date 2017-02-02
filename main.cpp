#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "datarefhandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;

    DatarefHandler drHandler;

    QQmlContext *context = engine.rootContext();
    context->setContextProperty("datarefHandler", &drHandler);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
