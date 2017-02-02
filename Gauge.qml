import QtQuick 2.0

Item {
    id: main
    width: 400
    height: 400
    objectName: "myGauge"
    clip: true
    anchors.fill: parent

    // Setting all dataref variable names
    property double pitch
    property double roll
    property double updateMills

    Connections{
        target: datarefHandler

        onNewPitch:{
            pitch = value
        }

        onNewDouble:{
            main[name] = value
        }

        onNewData:{
            main[name] = string
        }
    }

    Item {
        id: horizon
        width: parent.height*3
        height: parent.height*3
        rotation: - main.roll
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: 5*main.pitch
        anchors.horizontalCenter: parent.horizontalCenter
        smooth: true
        antialiasing: true

        Rectangle {
            id: air
            width: parent.width
            height: parent.height/2
            color: "#567cff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
        }

        Rectangle {
            id: horizonLine
            width: parent.width
            height: parent.height/200
            color: "#ffffff"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            smooth: true
            antialiasing: true
        }

        Rectangle {
            id: ground
            y: 200
            width: parent.width
            height: parent.height/2
            color: "#d27400"
            anchors.horizontalCenterOffset: 0
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 0
            anchors.horizontalCenter: parent.horizontalCenter
            smooth: true
            antialiasing: true
        }


    }


    Rectangle {
        id: indicator
        width: parent.width/2
        height: parent.height
        color: "#00000000"
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Rectangle {
            id: left
            y: 125
            width: parent.width/3
            height: parent.height/100
            color: "#ffff00"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 0
        }

        Rectangle {
            id: right
            x: 153
            y: 125
            width: parent.width/3
            height: parent.height/100
            color: "#ffff00"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 0
        }
    }
}
