#ifndef GAME_H
#define GAME_H

#include <QObject>

class Game : public QObject
{
    Q_OBJECT
public:
    explicit Game(QObject *parent = nullptr);

signals:

public slots:
    int newGame(int win_size_w, int win_size_h, int m_ring_start);
    int growth(int ring_size);
    bool checkMatch(int pl_r_size,int ring_size, int m_thick);
};

#endif // GAME_H
