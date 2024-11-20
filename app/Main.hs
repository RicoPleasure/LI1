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
        baseJogo = undefined,
        portaisJogo = [],
        torresJogo = [],
        mapaJogo = [
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Relva, Relva, Relva, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Relva, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Relva, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra],
          [Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra, Terra]
        ],
        inimigosJogo = [],
        lojaJogo = undefined
        }
    }
