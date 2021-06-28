import QtQuick 2.0
import QtQuick.Layouts 1.12

Rectangle {
    id: gameplay
    width: 600
    height: 400
    color: "#FADADD"

    signal winner()
    signal lose()


    function newGame() {
        m_ring.width = 1
        m_ring.height = m_ring.width

        p_ring.width = game.newGame(parent.width, parent.height, m_ring.border.width)
        p_ring.height = p_ring.width
    }


   function checkMatch() {
       var done = game.checkMatch(p_ring.radius,
                        m_ring.radius, m_ring.border.width)
       if (done){
           winner()
       }
       else
           lose()
    }

    function growth() {
        m_ring.width = game.growth(m_ring.width)
        m_ring.height = game.growth(m_ring.height)
                return m_ring.width
    }


    MainRing {
        id: m_ring
        anchors.centerIn: parent
    }

    PlayerRing {
        id: p_ring
        anchors.centerIn: parent
    }

    MouseArea {
        anchors.fill: parent
        onClicked: checkMatch()
    }

}
