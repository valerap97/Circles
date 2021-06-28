import QtQuick 2.12
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

RowLayout {
    signal newGame()
    signal quitApp()
    signal trueVictory()

    Button {
        id: newGameButton
        text: "New Game"
        onClicked: newGame()

    }

    Rectangle{
        id: levelField
        Layout.fillWidth: true
        color: "black"
        property int countdown: 0
        Text {
            id: level
            text: "Level " +  levelField.countdown
            font.pointSize: 14
            anchors.centerIn: parent
        }
    }

Button {
    id:quitButton
    text: "Quit"
    onClicked: quitApp()
    }

Shortcut{
    context: Qt.ApplicationShortcut
    sequence: ["Ctrl+N"]
    onActivated: newGame()
}
Shortcut{
    context: Qt.ApplicationShortcut
    sequence: [StandardKey.Close, "Ctrl+Q"]
    onActivated: quitApp()
}

function winner(){
    if (levelField.countdown !== 5)
    messagewin.visible = true
    else
    messagevictory.visible = true
    }


function lose(){
    messagelose.visible = true
    }



Dialog {
    id: messagelose
    visible: false
    title: "Circles"
    contentItem:
    ColumnLayout{
        spacing: 2
        Rectangle {
            color: "salmon"
            implicitWidth: 450
            implicitHeight: 50
                Text {
                text: "You lose!"
                anchors.centerIn: parent
                }
            }
        RowLayout{
            spacing: 2
            Button{
                Layout.fillWidth: true
                text: "New game"
                palette {
                        button: "salmon"
                    }
                onClicked: {
                    levelField.countdown = 0
                    level.text = "Level " +  levelField.countdown
                    messagelose.visible=false
                    newGame()
                }
            }
            Button{
                Layout.fillWidth: true
                text: "Quit"
                palette {
                        button: "salmon"
                    }
                onClicked: {
                    messagelose.visible=false
                    quitApp()
                }
            }
        }
    }
}
Dialog {
    id: messagewin
    visible: false
    title: "Circles"
    contentItem:
    ColumnLayout{
        spacing: 2
        Rectangle {
            color: "palegreen"
            implicitWidth: 450
            implicitHeight: 50
                Text {
                text: "Congratulations! You win"
                anchors.centerIn: parent
                }
            }
        RowLayout{
            spacing: 2
            Button{
                Layout.fillWidth: true
                text: "New game"
                palette {
                        button: "palegreen"
                    }
                onClicked: {
                    levelField.countdown++
                    level.text = "Level " +  levelField.countdown
                    messagewin.visible=false
                    newGame()
                }
            }
            Button{
                Layout.fillWidth: true
                text: "Quit"
                palette {
                        button: "palegreen"
                    }
                onClicked: {
                    messagewin.visible=false
                    quitApp()
                }
            }
        }
    }
}

Dialog {
    id: messagevictory
    visible: false
    title: "Circles"
    contentItem:
    ColumnLayout{
        spacing: 2
        Rectangle {
            color: "orange"
            implicitWidth: 450
            implicitHeight: 50
                Text {
                text: "Congratulations! You beat the game!"
                anchors.centerIn: parent
                }
            }
        RowLayout{
            spacing: 2
            Button{
                Layout.fillWidth: true
                text: "New game"
                palette {
                        button: "orange"
                    }
                onClicked: {
                    levelField.countdown = 0
                    level.text = "Level " +  levelField.countdown
                    messagevictory.visible=false
                    trueVictory()
                }
            }
            Button{
                Layout.fillWidth: true
                text: "Quit"
                palette {
                        button: "orange"
                    }
                onClicked: {
                    messagevictory.visible=false
                    quitApp()
                }
            }
        }
    }
}
}
