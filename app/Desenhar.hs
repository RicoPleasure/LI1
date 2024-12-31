{-|
Module      : Desenhar
Description : Desenha mapa e objetos
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a desenhar o mapa e os objetos.
-}
module Desenhar where

import Graphics.Gloss
import ImmutableTowers
import LI12425

data TipoTorre = Torre1 | Torre2 | Torre3 | Torre4 | Torre5 | Torre6 | Torre7 | Torre8 | Torre9

data OpcaoMenuInicial = Jogar | Opcoes | Sair
data OpcaoModoJogo = Resumed | Pause | Loja TipoTorre
data Config = Themes | Audio | Voltar

data Menu = MenuInicial OpcaoMenuInicial | Options Config | ModoJogo OpcaoModoJogo

data Estado = Estado { immutableTowers :: ImmutableTowers, menu :: Menu}


{-| Função principal que desenha todos os elementos -}
{-| Tipo de dados que representa o mundo -}

{-| Função principal que desenha todos os elementos -}
desenha :: [[Picture]] -> Estado -> IO Picture
desenha _ (Estado {menu = MenuInicial Jogar}) = return $ Pictures 
    [ Translate (-300) 200 $ Color blue $ Text "Play"
    , Translate (-300) 50 $ Color black $ Text "Options"
    , Translate (-300) (-100) $ Color black $ Text "Quit"
    ]

desenha _ (Estado {menu = MenuInicial Opcoes}) = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Play"
    , Translate (-300) 50 $ Color blue $ Text "Options"
    , Translate (-300) (-100) $ Color black $ Text "Quit"
    ]

desenha _ (Estado {menu = MenuInicial Sair}) = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Play"
    , Translate (-300) 50 $ Color black $ Text "Options"
    , Translate (-300) (-100) $ Color blue $ Text "Quit"
    ]

desenha _ (Estado {menu = Options Themes}) = return $ Pictures 
    [ Translate (-300) 200 $ Color blue $ Text "Themes"
    , Translate (-300) 50 $ Color black $ Text "Audio"
    , Translate (-300) (-100) $ Color black $ Text "Voltar"
    ]

desenha _ (Estado {menu = Options Audio}) = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Themes"
    , Translate (-300) 50 $ Color blue $ Text "Audio"
    , Translate (-300) (-100) $ Color black $ Text "Voltar"
    ]

desenha _ (Estado {menu = Options Voltar}) = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Themes"
    , Translate (-300) 50 $ Color black $ Text "Audio"
    , Translate (-300) (-100) $ Color blue $ Text "Voltar"
    ] 


desenha sprites (Estado {menu = ModoJogo Resumed, immutableTowers = ImmutableTowers { 
    jogo = Jogo { mapaJogo = mapa,
                  baseJogo = Base { posicaoBase = (baseX, baseY) },
                  portaisJogo = portais } }}) = return $ 
    Pictures [
        Translate ajusteX ajusteY $ 
            Pictures (desenhaMapa (sprites !! 1) mapa (0, 0) 
            ++ [desenhaBase (baseX, baseY)]
            ++ desenhaPortais (map posicaoPortal portais))
    ]
    where 
        (ajusteX, ajusteY) = (0, blocoAltura * 3)

desenha sprites (Estado {menu = ModoJogo (Loja Torre1), immutableTowers = ImmutableTowers { 
    jogo = Jogo { mapaJogo = mapa,
                  baseJogo = Base { posicaoBase = (baseX, baseY) },
                  portaisJogo = portais } }}) = return $ 
    Pictures [
        Translate ajusteX ajusteY $ 
            Pictures (desenhaMapa (sprites !! 1) mapa (0, 0)
            ++ [desenhaBase (baseX, baseY)]
            ++ desenhaPortais (map posicaoPortal portais)),
        desenhaLoja 1 ((sprites !! 0) !! 0)
    ]
    where 
        (ajusteX, ajusteY) = (0, blocoAltura * 3)


desenha sprites (Estado {menu = ModoJogo Pause, immutableTowers = ImmutableTowers { 
    jogo = Jogo { mapaJogo = mapa,
                  baseJogo = Base { posicaoBase = (baseX, baseY) },
                  portaisJogo = portais } }}) = return $
    Pictures [
        Translate ajusteX ajusteY $ 
            Pictures (desenhaMapa (sprites !! 1) mapa (0, 0) 
            ++ [desenhaBase (baseX, baseY)]
            ++ desenhaPortais (map posicaoPortal portais)),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        Translate (-550) 200 $ Color white $ Text "Paused",
        Translate (-550) 100 $ Color white $ Text "Press p to resume"
    ]
        where 
            (ajusteX, ajusteY) = (0, blocoAltura * 3)

{-| Largura do bloco -}
blocoLargura :: Float
blocoLargura = 100

{-| Altura do bloco  -}
blocoAltura :: Float
blocoAltura = 50

{-| Posição real dos blocos que fazem parte do mapa -}
posicaoReal :: (Float, Float) 
            -> Picture -- Bloco  
            -> Picture
posicaoReal (x, y) = Translate realX (-realY)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

{-| Posição real dos objetos (base, portais, inimigos e torres) -}
posicaoRealObjetos :: (Float, Float) 
                   -> Picture -- Objeto 
                   -> Picture
posicaoRealObjetos (x, y) = Translate (realX+50) (-realY)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

{-| Função que desenha o mapa -}
desenhaMapa :: [Picture] -- Sprites
            -> [[Terreno]] -- Mapa  
            -> (Float,Float) -- Coordenadas da grelha do mapa
            -> [Picture] -- Retorna o mapa
desenhaMapa ts [] _ = []   
desenhaMapa ts (linha:t) (x,y) =
    desenhaLinha ts linha (x,y) ++ desenhaMapa ts t (x, (y+1))

{-| Função que desenha só uma linha do mapa -}
desenhaLinha :: [Picture] 
             -> [Terreno]
             -> (Float,Float) 
             -> [Picture]
desenhaLinha ts [] _ = []
desenhaLinha ts (terreno:t) (x,y) =
    posicaoReal (x,y) (scale 3 3 $ (terrenoSprite ts terreno))
    : desenhaLinha ts t ((x+1), y)

{-| Função que seleciona a textura do terreno -}
terrenoSprite :: [Picture] -> Terreno -> Picture
terrenoSprite ts terreno
  | length ts < 3 = Blank
  | otherwise = case terreno of
      Relva -> ts !! 0
      Terra -> ts !! 1
      Agua -> ts !! 2

{-| Função que desenha a base do jogador -}
desenhaBase :: Posicao
            -> Picture
desenhaBase (x,y)
    = posicaoRealObjetos (x,y) $ Color red $ circleSolid 15

{-| Função que desenha todos os portais  -}
desenhaPortais :: [Posicao]
            -> [Picture]
desenhaPortais pos = map desenhaPortal pos

{-| Função que desenha um único portal -}
desenhaPortal :: Posicao -> Picture
desenhaPortal (x,y) = posicaoRealObjetos (x,y) $ Color green $ circleSolid 20 

{-|  -}
desenhaLoja :: Int -> Picture -> Picture
desenhaLoja n l = Translate (-700) 200 $ Pictures 
  [ 
    l
  ]

{-| Função que desenha as torres a serem mostradas na loja -}
desenhaTorresLoja :: Int -> Picture
desenhaTorresLoja n = Pictures 
  [ Translate posX posY $ desenhaTorre torreID n
  | (x, y) <- [(i `mod` 3, i `div` 3) | i <- [0..8]],
    let torreID = x + y * 3 + 1,
    let posX = -752 + fromIntegral x * 130,
    let posY = 380 - fromIntegral y * 130
  ]

desenhaTorre :: Int -> Int -> Picture
desenhaTorre torreID n 
    | n == torreID = Pictures [Color green $ Scale 1.1 1.1 $ Polygon [(-120, -50), (-20, -50), (-20, 50), (-120, 50)],Translate (-50) (-10) $ Scale 0.1 0.1 $ Color white $ Text (show torreID)]
    | otherwise = Pictures [Color blue $ Scale 1.1 1.1 $ Polygon [(-120, -50), (-20, -50), (-20, 50), (-120, 50)],Translate (-50) (-10) $ Scale 0.1 0.1 $ Color white $ Text (show torreID)]

