import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12


Window {
    id: w
    minimumWidth: 600
    maximumWidth: 600
    width: 600

    minimumHeight: cl.height
    maximumHeight: cl.height
    height: cl.height
    visible: true
    title: qsTr("Circles")

function lose_borders (){
toolbar.lose()
timer.stop()
}
function rewipe(count){
    count = 0
    timer.interval = 40
    gameplay.newGame()
    timer.start()
    return count
}

    ColumnLayout {
        id: cl
        anchors.centerIn: parent
        spacing: 2
        Gameplay { 
            id: gameplay
                onWinner: {
                    toolbar.winner()
                    timer.stop()
                }
                onLose: {
                    toolbar.lose()
                    timer.stop()
                    timer.interval = 40
                }
        }
        Timer {
                id: timer
                interval: 30
                running: true
                repeat: true

               onTriggered: {
                    var measure = gameplay.growth()
                    if (measure >= gameplay.width ||
                            measure >= gameplay.height){
                        lose_borders()
                        }
                    }

                }

        Toolbar {
            id: toolbar
            property int count: 0
            onNewGame: {
                count++
                timer.interval-=4
                gameplay.newGame()
                timer.start()
            }
            onQuitApp: Qt.quit()
            onTrueVictory: rewipe(count)
        }

    }
}

