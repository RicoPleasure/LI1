module Desenhar where

import Graphics.Gloss
import ImmutableTowers

import LI12425

desenha :: ImmutableTowers -> Picture
desenha (ImmutableTowers {jogo = Jogo {mapaJogo = linhas}}) = Pictures $ desenhaMapa linhas 0
desenha _ = undefined

desenhaMapa :: [[Terreno]] -> Int -> [Picture]
desenhaMapa [] _ = []
desenhaMapa (linha:t) y = 
    Translate 0 (fromIntegral y * (-50)) (Pictures (desenhaLinha linha 0)) 
    : desenhaMapa t (y + 1)

desenhaLinha :: [Terreno] -> Int -> [Picture]
desenhaLinha [] _ = []
desenhaLinha (terreno:t) x = 
    Translate (fromIntegral x * 50) 0 (desenhaTerreno terreno) 
    : desenhaLinha t (x + 1)

desenhaTerreno :: Terreno -> Picture
desenhaTerreno terreno =  case terreno of
    Relva -> Color green $ Polygon [(0, 0), (50, 0), (50, 50), (0, 50)]
    Agua -> Color blue $ Polygon [(0, 0), (50, 0), (50, 50), (0, 50)]
    Terra -> Color orange $ Polygon [(0, 0), (50, 0), (50, 50), (0, 50)]