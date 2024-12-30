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

data OpcaoMenuInicial = Jogar | Opcoes | Sair
data OpcaoModoJogo = Resumed | Pause
data Config = Themes | Audio | Voltar

data Menu = MenuInicial OpcaoMenuInicial | Options Config | ModoJogo OpcaoModoJogo

data Estado = Estado { immutableTowers :: ImmutableTowers, menu :: Menu}


{-| Função principal que desenha todos os elementos -}
{-| Tipo de dados que representa o mundo -}

{-| Função principal que desenha todos os elementos -}
desenha :: Estado -> IO Picture
desenha Estado {menu = MenuInicial Jogar} = return $ Pictures 
    [ Translate (-300) 200 $ Color blue $ Text "Play"
    , Translate (-300) 50 $ Color black $ Text "Options"
    , Translate (-300) (-100) $ Color black $ Text "Quit"
    ]

desenha Estado {menu = MenuInicial Opcoes} = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Play"
    , Translate (-300) 50 $ Color blue $ Text "Options"
    , Translate (-300) (-100) $ Color black $ Text "Quit"
    ]

desenha Estado {menu = MenuInicial Sair} = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Play"
    , Translate (-300) 50 $ Color black $ Text "Options"
    , Translate (-300) (-100) $ Color blue $ Text "Quit"
    ]

desenha Estado {menu = Options Themes} = return $ Pictures 
    [ Translate (-300) 200 $ Color blue $ Text "Themes"
    , Translate (-300) 50 $ Color black $ Text "Audio"
    , Translate (-300) (-100) $ Color black $ Text "Voltar"
    ]

desenha Estado {menu = Options Audio} = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Themes"
    , Translate (-300) 50 $ Color blue $ Text "Audio"
    , Translate (-300) (-100) $ Color black $ Text "Voltar"
    ]

desenha Estado {menu = Options Voltar} = return $ Pictures 
    [ Translate (-300) 200 $ Color black $ Text "Themes"
    , Translate (-300) 50 $ Color black $ Text "Audio"
    , Translate (-300) (-100) $ Color blue $ Text "Voltar"
    ] 


desenha Estado {menu = ModoJogo Resumed, immutableTowers = ImmutableTowers { 
    jogo = Jogo { mapaJogo = mapa,
                  baseJogo = Base { posicaoBase = (baseX, baseY) },
                  portaisJogo = portais } }} = return $ 
    Translate ajusteX ajusteY $ 
    Pictures (desenhaMapa mapa (0, 0) 
    ++ [desenhaBase (baseX, baseY)]
    ++ desenhaPortais (map posicaoPortal portais))
    where 
        (ajusteX, ajusteY) = (-blocoLargura - 50, blocoAltura * 3)

desenha Estado {menu = ModoJogo Pause, immutableTowers = ImmutableTowers { 
    jogo = Jogo { mapaJogo = mapa,
                  baseJogo = Base { posicaoBase = (baseX, baseY) },
                  portaisJogo = portais } }} = return $
    Pictures [
        Translate ajusteX ajusteY $ 
            Pictures (desenhaMapa mapa (0, 0) 
            ++ [desenhaBase (baseX, baseY)]
            ++ desenhaPortais (map posicaoPortal portais)),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        Translate (-550) 200 $ Color white $ Text "Paused",
        Translate (-550) 100 $ Color white $ Text "Press p to resume"
    ]
        where 
            (ajusteX, ajusteY) = (-blocoLargura - 50, blocoAltura * 3)

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
desenhaMapa :: [[Terreno]] -- Mapa  
            -> (Float,Float) -- Coordenadas da grelha do mapa
            -> [Picture] -- Retorna o mapa
desenhaMapa [] _ = []   
desenhaMapa (linha:t) (x,y) =
    desenhaLinha linha (x,y) ++ desenhaMapa t (x, (y+1))

{-| Função que desenha só uma linha do mapa -}
desenhaLinha :: [Terreno]
             -> (Float,Float) 
             -> [Picture]
desenhaLinha [] _ = []
desenhaLinha (terreno:t) (x,y) =
    posicaoReal (x,y) (desenhaTerreno terreno)
    : desenhaLinha t ((x+1), y)

{-| Função que desenha um único bloco do mapa  -}
desenhaTerreno :: Terreno 
               -> Picture
desenhaTerreno terreno = 
    Pictures [terrenoTopo terreno, terrenoFrente terreno, terrenoDireita terreno]

{-| Desenha o topo do bloco -}
terrenoTopo :: Terreno 
            -> Picture
terrenoTopo terreno =
    Color color $ Polygon [(0, 0), (50, -25), (100, 0), (50, 25)]
    where color = light (terrenoCor terreno)

{-| Desenha a frente do bloco -}
terrenoFrente :: Terreno 
              -> Picture
terrenoFrente terreno =
    Color color $ Polygon [(0, 0), (50, -25), (50, -75), (0, -50)]
    where color = terrenoCor terreno

{-| Desenha o lado direito do bloco -}
terrenoDireita :: Terreno 
               -> Picture
terrenoDireita terreno = 
    Color color $ Polygon [(50, -25), (100, 0), (100, -50), (50, -75)]
    where color = terrenoCor terreno

-- Mais tarde vai ser com sprites / Pode ser feita outra deste tipo para escolher temas 
{-| Função que seleciona a textura do terreno -}
terrenoCor :: Terreno 
           -> Color
terrenoCor terreno = case terreno of
    Relva -> dark green
    Agua  -> blue
    Terra -> orange

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
