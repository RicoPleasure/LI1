module Desenhar where

import Graphics.Gloss
import ImmutableTowers

import LI12425

desenha :: ImmutableTowers -> Picture
desenha (ImmutableTowers {jogo = Jogo {mapaJogo = linhas}}) = Translate (-60) 200 $ Translate (-100) 0 $ Pictures $ desenhaMapa linhas 0
desenha _ = undefined   

desenhaMapa :: [[Terreno]] -> Int -> [Picture]
desenhaMapa [] _ = []
desenhaMapa (linha:t) yDif =
    Translate (fromIntegral yDif * (-50)) (fromIntegral yDif * (-25)) (Pictures (desenhaLinha linha 0)) 
    : desenhaMapa t (yDif + 1)

desenhaLinha :: [Terreno] -> Int -> [Picture]
desenhaLinha [] _ = []
desenhaLinha (terreno:t) xDif =
    Translate (fromIntegral xDif * (50)) (fromIntegral xDif * (-25)) (desenhaTerreno terreno)
    : desenhaLinha t (xDif + 1)

desenhaTerreno :: Terreno -> Picture
desenhaTerreno terreno = Pictures [terrenoTopo terreno, terrenoFrente terreno, terrenoDireita terreno]

terrenoTopo :: Terreno -> Picture
terrenoTopo terreno =
    let color = light (terrenoCor terreno)
    in Color color $ Polygon [(0, 0), (50, -25), (100, 0), (50, 25)]

terrenoFrente :: Terreno -> Picture
terrenoFrente terreno =
    let color = terrenoCor terreno
    in Color color $ Polygon [(0, 0), (50, -25), (50, -75), (0, -50)]

terrenoDireita :: Terreno -> Picture
terrenoDireita terreno =
    let color = terrenoCor terreno
    in Color color $ Polygon [(50, -25), (100, 0), (100, -50), (50, -75)]

-- Mais tarde vai ser com sprites / Posde ser feita outra deste tipo para escolher temas 
terrenoCor :: Terreno -> Color
terrenoCor terreno = case terreno of
    Relva -> green
    Agua  -> blue
    Terra -> orange