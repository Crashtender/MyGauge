import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: mainAppWindow
    flags: Qt.FramelessWindowHint
    visible: true
    width: 400
    height: 400

    Gauge{}

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        onPressed: menuScreen.visible = true
    }

    Rectangle {
        id: menuScreen
        x: 0
        y: 0
        width: 400
        height: 400
        color: "#00000000"
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        visible: false

        Rectangle {
            id: rectangleMenuBackground
            width: 400
            height: 400
            color: "#b3000000"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            border.width: 5
        }

        Rectangle {
            id: rectangleInstructions
            height: 152
            color: "#00000000"
            anchors.right: parent.right
            anchors.rightMargin: 0
            anchors.left: parent.left
            anchors.leftMargin: 0

            Text {
                id: instrMove
                x: 22
                y: 30
                color: "#ffffff"
                text: qsTr("MOVE GAUGE: < arrow keys>")
                font.pixelSize: 16
            }

            Text {
                id: instrResize
                x: 22
                y: 55
                color: "#ffffff"
                text: "RESIZE GAUGE: <CTRL> +  < arrow keys>"
                font.pixelSize: 16
            }

        }

        Rectangle {
            id: rectangleHostIP
            x: 100
            y: 158
            width: 200
            height: 73
            color: "#ffffff"

            Text {
                id: textHostTitle
                x: 16
                y: 17
                text: qsTr("Host IP (local: 127.0.0.1)")
                font.pixelSize: 12
            }

            TextInput {
                id: textInputHostIP
                x: 16
                y: 37
                width: 169
                height: 28
                text: qsTr("127.0.0.1")
                selectionColor: "#00801c"
                inputMask: "999.999.999.999"
                echoMode: TextInput.Normal
                font.family: "Verdana"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: 16
            }

        }

        Button {
            id: buttonConnect
            x: 100
            y: 237
            width: 88
            height: 40
            text: qsTr("Connect")

            onClicked: {
                //TODO Connect to XPL
                menuScreen.visible = false
                screenMoveFunctions.focus = true
            }
        }


        Button {
            id: buttonClose
            x: 216
            y: 237
            width: 84
            height: 40
            text: qsTr("Close")

            onPressed: {
                menuScreen.visible = false
                screenMoveFunctions.focus = true
            }
        }

    }
    Item {
        id: screenMoveFunctions
        anchors.fill: parent
        focus: true
        Keys.onPressed:
        {   // MOVE THE SCREEN WITH ARROW KEYS
            if (event.key == Qt.Key_Left)
            {
                mainAppWindow.x --;
                event.accepted = true;
            }
            if (event.key == Qt.Key_Right)
            {
                mainAppWindow.x ++;
                event.accepted = true;
            }
            if (event.key == Qt.Key_Up)
            {
                mainAppWindow.y --;
                event.accepted = true;
            }
            if (event.key == Qt.Key_Down)
            {
                mainAppWindow.y ++;
                event.accepted = true;
            }

            // FAST MOVE THE SCREEN WITH SHIFT + ARROW KEYS
            if ((event.key == Qt.Key_Left) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setX(mainAppWindow.x -10);
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Right) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setX(mainAppWindow.x +10);
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Up) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setY(mainAppWindow.y -10);
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Down) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setY(mainAppWindow.y +10);
                event.accepted = true;
            }


            // RESIZE THE SCREEN WITH CRL + ARROW KEYS
            if ((event.key == Qt.Key_Left) && (event.modifiers & Qt.ControlModifier))
            {
                mainAppWindow.width --;
                mainAppWindow.x ++;
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Right) && (event.modifiers & Qt.ControlModifier))
            {
                mainAppWindow.width ++;
                mainAppWindow.x --;
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Up) && (event.modifiers & Qt.ControlModifier))
            {
                mainAppWindow.height --;
                mainAppWindow.y ++;
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Down) && (event.modifiers & Qt.ControlModifier))
            {
                mainAppWindow.height ++;
                mainAppWindow.y --;
                event.accepted = true;
            }



            // FAST RESIZE THE SCREEN WITH CRL + SHIFT + ARROW KEYS
            if ((event.key == Qt.Key_Left) && (event.modifiers & Qt.ControlModifier) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setWidth(mainAppWindow.width - 10);
                mainAppWindow.setX(mainAppWindow.x + 10);
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Right) && (event.modifiers & Qt.ControlModifier) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setWidth(mainAppWindow.width + 10);
                mainAppWindow.setX(mainAppWindow.x - 10);
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Up) && (event.modifiers & Qt.ControlModifier) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setHeight(mainAppWindow.height - 10);
                mainAppWindow.setY(mainAppWindow.y + 10);
                event.accepted = true;
            }
            if ((event.key == Qt.Key_Down) && (event.modifiers & Qt.ControlModifier) && (event.modifiers & Qt.ShiftModifier))
            {
                mainAppWindow.setHeight(mainAppWindow.height + 10);
                mainAppWindow.setY(mainAppWindow.y - 10);
                event.accepted = true;
            }

        }
    }
}
