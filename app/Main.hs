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
import Graphics.Gloss.Interface.IO.Game
import Graphics.Gloss.Juicy
import ImmutableTowers
import LI12425
import Tempo
import System.Directory
import Utils.Utilitarios


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

it :: Estado
it = Estado {
  cena = MenuInicial Jogar,
  immutableTowers = ImmutableTowers {
      jogo = Jogo {
        baseJogo = Base {
          vidaBase = 100,
          posicaoBase = (5,0),
          creditosBase = 350
        },
        portaisJogo = [ Portal {posicaoPortal = (3,10)}],
        torresJogo = [ Torre {posicaoTorre = (2,2), projetilTorre = Projetil {tipoProjetil = Fogo}}, 
                       Torre {posicaoTorre = (6,6), projetilTorre = Projetil {tipoProjetil = Resina}},
                       Torre {posicaoTorre = (6,2), projetilTorre = Projetil {tipoProjetil = Gelo}} ] ,
        mapaJogo = [
          [r, r, r, r, r, t, r, r, r, r, r],
          [r, r, r, r, r, t, r, r, r, r, r],
          [r, r, r, r, r, t, r, r, r, r, r],
          [a, a, a, r, r, t, t, t, a, a, r],
          [r, r, a, r, r, r, r, t, a, r, r],
          [r, r, a, r, t, t, t, t, a, r, r],
          [r, a, a, r, t, r, r, r, a, r, r],
          [r, a, r, r, t, r, r, r, a, a, r],
          [r, a, r, t, t, r, r, r, r, r, r],
          [r, a, r, t, r, r, r, r, r, r, r],
          [r, a, r, t, r, r, r, r, r, r, r]
        ],
        inimigosJogo = [
          Inimigo {posicaoInimigo = (3,10),
                   direcaoInimigo = Norte,
                   vidaInimigo = 100,
                   velocidadeInimigo = 2,
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
    }
    where
      t = Terra
      r = Relva
      a = Agua
    
path :: String
path = "app/assets/images/"

loadImage :: FilePath -> IO Picture
loadImage filePath = do
  maybeImg <- loadJuicyPNG filePath
  case maybeImg of
    Just img -> return img
    Nothing -> error ("Failed to load image: " ++ filePath)

main :: IO ()
main = do

  l01 <- loadImage $ path ++ "loja/loja01.png"
  l02 <- loadImage $ path ++ "loja/loja02.png"
  l03 <- loadImage $ path ++ "loja/loja03.png"
  r <- loadImage $ path ++ "terreno/grass.png"
  t <- loadImage $ path ++ "terreno/dirt.png"
  a <- loadImage $ path ++ "terreno/water.png"
  bg <- loadImage $ path ++ "fundo/bg1.png"
  base <- loadImage $ path ++ "estruturas/base/base.png"
  tf01 <- loadImage $ path ++ "estruturas/torre/fogo/torre-fogo.png"
  tg01 <- loadImage $ path ++ "estruturas/torre/gelo/torre-gelo.png"
  tr01 <- loadImage $ path ++ "estruturas/torre/resina/torre-resina.png"
  p01 <- loadImage $ path ++ "estruturas/portal/portal.png"
  i01 <- loadImage $ path ++ "estruturas/inimigos/inimigo.png"
  ms <- loadImage $ path ++ "menu/start.png"
  mo <- loadImage $ path ++ "menu/options.png"
  mq <- loadImage $ path ++ "menu/quit.png"
  ot <- loadImage $ path ++ "menu/themes.png"
  oa <- loadImage $ path ++ "menu/audio.png"
  ob <- loadImage $ path ++ "menu/back.png"
  paused <- loadImage $ path ++ "pause/paused.png"
  rb <- loadImage $ path ++ "terreno/grass-blocked.png"
  tb <- loadImage $ path ++ "terreno/dirt-blocked.png"
  ab <- loadImage $ path ++ "terreno/water-blocked.png"
  rf <- loadImage $ path ++ "terreno/grass-free.png"
  tf <- loadImage $ path ++ "terreno/dirt-free.png"
  af <- loadImage $ path ++ "terreno/water-free.png"


  let sprites = [[l01, l02, l03], [r, t, a], [bg], [base], [tf01, tg01, tr01], [p01], [i01], [ms, mo, mq, ot, oa, ob], [paused], [rb, tb, ab], [rf, tf, af]]
  playIO janela fundo fr it (desenha sprites) reageEventos reageTempo