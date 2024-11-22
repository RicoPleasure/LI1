module Desenhar where

import Graphics.Gloss
import ImmutableTowers

import LI12425

blocoLargura :: Float
blocoLargura = 100

blocoAltura :: Float
blocoAltura = 50

posicaoReal :: (Float, Float) -> Picture -> Picture
posicaoReal (x, y) = Translate realX (-realY)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

posicaoRealObjetos :: (Float, Float) -> Picture -> Picture
posicaoRealObjetos (x, y) = Translate (realX+50) (-realY)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

desenha :: ImmutableTowers -> Picture
desenha (ImmutableTowers { 
    jogo = Jogo { mapaJogo = mapa,
                  baseJogo = Base { posicaoBase = (baseX,baseY)},
                  portaisJogo = portais }}) =
    Translate ajusteX ajusteY $ Pictures (desenhaMapa mapa (0, 0) ++ [desenhaBase (baseX,baseY)] ++ desenhaPortais (map posicaoPortal portais))
    where 
        (ajusteX, ajusteY) = calculaAjusteMapa mapa

calculaAjusteMapa :: [[Terreno]] -> (Float,Float)
calculaAjusteMapa mapa = 
    let width = (blocoLargura - 50)
        height = (blocoAltura * 3)
    in (-width,height)

desenhaMapa :: [[Terreno]] -- Mapa  
            -> (Float,Float) -- Coordenadas da grelha do mapa
            -> [Picture] -- Retorna o mapa
desenhaMapa [] _ = []   
desenhaMapa (linha:t) (x,y) =
    desenhaLinha linha (x,y) ++ desenhaMapa t (x, (y+1))

desenhaLinha :: [Terreno]
             -> (Float,Float) 
             -> [Picture]
desenhaLinha [] _ = []
desenhaLinha (terreno:t) (x,y) =
    posicaoReal (x,y) (desenhaTerreno terreno)
    : desenhaLinha t ((x+1), y)

desenhaTerreno :: Terreno 
               -> Picture
desenhaTerreno terreno = Pictures [terrenoTopo terreno, terrenoFrente terreno, terrenoDireita terreno]

terrenoTopo :: Terreno 
            -> Picture
terrenoTopo terreno =
    let color = light (terrenoCor terreno)
    in Color color $ Polygon [(0, 0), (50, -25), (100, 0), (50, 25)]

terrenoFrente :: Terreno 
              -> Picture
terrenoFrente terreno =
    let color = terrenoCor terreno
    in Color color $ Polygon [(0, 0), (50, -25), (50, -75), (0, -50)]

terrenoDireita :: Terreno 
               -> Picture
terrenoDireita terreno =
    let color = terrenoCor terreno
    in Color color $ Polygon [(50, -25), (100, 0), (100, -50), (50, -75)]

-- Mais tarde vai ser com sprites / Pode ser feita outra deste tipo para escolher temas 
terrenoCor :: Terreno 
           -> Color
terrenoCor terreno = case terreno of
    Relva -> dark green
    Agua  -> blue
    Terra -> orange

desenhaBase :: (Float, Float)
            -> Picture
desenhaBase (x,y)
    = posicaoRealObjetos (x,y) $ Color red $ circleSolid 15

desenhaPortais :: [(Float, Float)]
            -> [Picture]
desenhaPortais pos = map desenhaPortal pos

desenhaPortal :: (Float, Float) -> Picture
desenhaPortal (x,y) = posicaoRealObjetos (x,y) $ Color green $ circleSolid 20 
