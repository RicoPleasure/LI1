module ImmutableTowers where

import LI12425 (Jogo, Cena)

data ImmutableTowers = ImmutableTowers {
    jogo :: Jogo,
    cena :: Cena, 
    tema :: Int
}