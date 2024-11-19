module Main where

import Desenhar
import Eventos
import Graphics.Gloss
import ImmutableTowers
import Tempo
import LI12425

janela :: Display
janela = InWindow "Immutable Towers" (1920, 1080) (0, 0)

fundo :: Color
fundo = white

fr :: Int
fr = 60

main :: IO ()
main = do
  putStrLn "Hello from Immutable Towers!"

  play janela fundo fr it desenha reageEventos reageTempo
  where
    it = ImmutableTowers {
      jogo = Jogo {
        baseJogo = undefined,
        portaisJogo = [],
        torresJogo = [],
        mapaJogo = [
          [Relva, Relva, Terra, Relva]
        ],
        inimigosJogo = [],
        lojaJogo = undefined
        }
    }
