import QtQuick 2.0
import QtQuick.Layouts 1.12

GridLayout {
    id: gl

    width: 600
    height: 480

    columns: 10
    rows: 10

    columnSpacing: 0
    rowSpacing: 0

    SmallCircle {

    }

    /* После окончания игры - новая */
    Component.onCompleted: {
        newGame()
    }
}


