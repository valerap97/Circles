#include "game.h"
#include <cstdlib>
#include <ctime>

Game::Game(QObject *parent) : QObject(parent)
{

}

int Game::newGame(int win_size_w, int win_size_h, int m_ring_start)
{
    srand(time(NULL));
    int curr_ring_size, win_size;
    if (win_size_w <= win_size_h)
        win_size = win_size_w;
    else
        win_size = win_size_h;
    curr_ring_size = 100*(rand()%(win_size/100)) + m_ring_start;

    return curr_ring_size;

}
int Game::growth(int ring_size){
        ring_size+=4;
    return ring_size;

}
bool Game::checkMatch(int pl_r_size,int ring_size, int m_thick){
bool match = false;
if (pl_r_size >= (ring_size -  m_thick) &&
        pl_r_size <= ring_size)
    match = true;

return match;
}





