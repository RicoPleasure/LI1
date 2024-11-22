module Main where

import Desenhar
import Eventos
import Graphics.Gloss
import ImmutableTowers
import Tempo
import LI12425

janela :: Display
janela = InWindow "Immutable Towers" (1920, 1080) (0, 0)

customColor :: Int -> Int -> Int -> Int -> Color
customColor r g b a = makeColor (fromIntegral r / 255) 
                              (fromIntegral g / 255) 
                              (fromIntegral b / 255) 
                              (fromIntegral a / 255)
                              
fundo :: Color
fundo = customColor 160 220 220 255

fr :: Int
fr = 60

main :: IO ()
main = do
  putStrLn "Hello from Immutable Towers!"

  play janela fundo fr it desenha reageEventos reageTempo
  where
    it = ImmutableTowers {
      jogo = Jogo {
        baseJogo = Base {
          posicaoBase = (5,0)
        },
        portaisJogo = [ Portal {posicaoPortal = (3,9)} ],
        torresJogo = [],
        mapaJogo = [
          [Relva, Relva, Relva, Relva, Relva, Terra, Relva, Relva, Relva, Relva],
          [Relva, Relva, Relva, Relva, Relva, Terra, Relva, Relva, Relva, Relva],
          [Relva, Relva, Relva, Relva, Relva, Terra, Relva, Relva, Relva, Relva],
          [Agua, Agua, Agua, Agua, Relva, Terra, Terra, Terra, Agua, Agua],
          [Relva, Relva, Relva, Agua, Relva, Relva, Relva, Terra, Agua, Relva],
          [Relva, Relva, Relva, Agua, Terra, Terra, Terra, Terra, Agua, Relva],
          [Relva, Agua, Agua, Agua, Terra, Relva, Relva, Relva, Agua, Relva],
          [Relva, Agua, Relva, Relva, Terra, Relva, Relva, Relva, Agua, Agua],
          [Relva, Agua, Relva, Terra, Terra, Relva, Relva, Relva, Relva, Relva],
          [Relva, Agua, Relva, Terra, Relva, Relva, Relva, Relva, Relva, Relva]
        ],
        inimigosJogo = [],
        lojaJogo = undefined
        }
    }
