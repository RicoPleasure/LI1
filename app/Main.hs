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
import Tempo
import ImmutableTowers
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
fr = 30

it :: ImmutableTowers
it = ImmutableTowers {cena = MenuInicial Jogar ,tema = 0}
    
loadImage :: FilePath -> IO Picture
loadImage filePath = do
  maybeImg <- loadJuicyPNG filePath
  case maybeImg of
    Just img -> return img
    Nothing -> error ("Failed to load image: " ++ filePath)

path :: String
path = "app/assets/images/"

main :: IO ()
main = do

  {- Tema Base -}

  l01 <- loadImage (path ++ "loja/loja01.png")
  l02 <- loadImage (path ++ "loja/loja02.png")
  l03 <- loadImage (path ++ "loja/loja03.png")
  r01 <- loadImage (path ++ "terreno/grass.png")
  d01 <- loadImage (path ++ "terreno/dirt.png")
  w01 <- loadImage (path ++ "terreno/water.png")
  v01 <- loadImage (path ++ "terreno/vazio.png")
  bg1 <- loadImage (path ++ "fundo/bg1.png")
  b01 <- loadImage (path ++ "estruturas/base/base.png")
  t01 <- loadImage (path ++ "estruturas/torre/fogo/torre-fogo.png")
  t02 <- loadImage (path ++ "estruturas/torre/gelo/torre-gelo.png")
  t03 <- loadImage (path ++ "estruturas/torre/resina/torre-resina.png")
  p01 <- loadImage (path ++ "estruturas/portal/portal.png")
  i01 <- loadImage (path ++ "estruturas/inimigos/inimigo.png")
  m01 <- loadImage (path ++ "menu/start.png")
  m02 <- loadImage (path ++ "menu/options.png")
  m03 <- loadImage (path ++ "menu/quit.png")
  m04 <- loadImage (path ++ "menu/themes.png")
  m05 <- loadImage (path ++ "menu/audio.png")
  m06 <- loadImage (path ++ "menu/back.png")
  m07 <- loadImage (path ++ "menu/continue.png")
  m08 <- loadImage (path ++ "menu/newgame.png")
  m09 <- loadImage (path ++ "menu/levels.png")
  m10 <- loadImage (path ++ "menu/creator.png")
  m11 <- loadImage (path ++ "menu/level1.png")
  m12 <- loadImage (path ++ "menu/level2.png")
  m13 <- loadImage (path ++ "menu/level3.png")
  m14 <- loadImage (path ++ "menu/level4.png")
  m15 <- loadImage (path ++ "menu/level5.png")
  p02 <- loadImage (path ++ "pause/paused.png")
  p03 <- loadImage (path ++ "pause/quit-editor-save.png")
  g02 <- loadImage (path ++ "terreno/grass-blocked.png")
  d02 <- loadImage (path ++ "terreno/dirt-blocked.png")
  w02 <- loadImage (path ++ "terreno/water-blocked.png")
  g03 <- loadImage (path ++ "terreno/grass-free.png")
  d03 <- loadImage (path ++ "terreno/dirt-free.png")
  w03 <- loadImage (path ++ "terreno/water-free.png")
  g04 <- loadImage (path ++ "terreno/grass-editor.png")
  d04 <- loadImage (path ++ "terreno/dirt-editor.png")
  w04 <- loadImage (path ++ "terreno/water-editor.png")

  {- Tema Natal -}
  r02 <- loadImage (path ++ "terreno/grass-2.png")
  d05 <- loadImage (path ++ "terreno/dirt-2.png")
  w05 <- loadImage (path ++ "terreno/water-2.png")
  bg2 <- loadImage (path ++ "fundo/bg2.png")

  let temaInicial = [[l01, l02, l03],[r01, d01, w01, v01],[bg1],[b01],[t01, t02, t03],[p01],[i01],[m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, m13, m14, m15],[p02, p03],[g02, d02, w02],[g03, d03, w03],[g04, d04, w04]] 

  let temaNatal = [[l01, l02, l03],[r02, d05, w05, v01],[bg2],[b01],[t01, t02, t03],[p01],[i01],[m01, m02, m03, m04, m05, m06, m07, m08, m09, m10, m11, m12, m13, m14, m15],[p02, p03],[g02, d02, w02],[g03, d03, w03],[g04, d04, w04]]


  playIO janela fundo fr it (desenha [temaInicial, temaNatal]) reageEventos reageTempo