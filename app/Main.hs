{-|
Module      : Main
Description : Módulo principal para inicialização do Jogo e handling do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Módulo principal, onde com ajuda do Gloss é inicializado o Jogo e onde estão as definições principais do Jogo
-}
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

it :: ImmutableTowers
it = ImmutableTowers {
      jogo = Jogo {
        baseJogo = Base {
          vidaBase = 100,
          posicaoBase = (5,0),
          creditosBase = 10
        },
        portaisJogo = [ Portal {posicaoPortal = (3,9)}, Portal {posicaoPortal = (3,3)}],
        torresJogo = [ Torre {posicaoTorre = (2,2)}, Torre {posicaoTorre = (6,6)} ] ,
        mapaJogo = [
          [r, r, r, r, r, t, r, r, r, r],
          [r, r, r, r, r, t, r, r, r, r],
          [r, r, r, r, r, t, r, r, r, r],
          [a, a, a, r, r, t, t, t, a, a],
          [r, r, a, r, r, r, r, t, a, r],
          [r, r, a, r, t, t, t, t, a, r],
          [r, a, a, r, t, r, r, r, a, r],
          [r, a, r, r, t, r, r, r, a, a],
          [r, a, r, t, t, r, r, r, r, r],
          [r, a, r, t, r, r, r, r, r, r]
        ],
        inimigosJogo = [
          Inimigo {posicaoInimigo = (1,2),
                   direcaoInimigo = Norte,
                   vidaInimigo = 100,
                   velocidadeInimigo = 10,
                   ataqueInimigo = 99,
                   butimInimigo = 200,
                   projeteisInimigo = [ Projetil {
                    tipoProjetil = Fogo,
                    duracaoProjetil = Finita 3
                   }]
                   }
        ],
        lojaJogo = undefined
        }
    }
    where
      t = Terra
      r = Relva
      a = Agua


main :: IO ()
main = do
  putStrLn "Hello from Immutable Towers!"

  play janela fundo fr it desenha reageEventos reageTempo
    