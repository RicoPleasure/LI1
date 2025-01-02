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
import Utils.Utilitarios
import Utils.UtilitariosTorre

data Estado = Estado { immutableTowers :: ImmutableTowers, cena :: Cena}

{-| Legenda dos sprites

sprites !! 0 -> Loja
sprites !! 1 -> Terrenos
sprites !! 2 -> Background
sprites !! 3 -> Base
sprites !! 4 -> Torres
sprites !! 5 -> Portais
sprites !! 6 -> Inimigos
sprites !! 7 -> Menu
sprites !! 8 -> Pause
sprites !! 9 -> Terreno alternativo válido (modo de adicionar torre)
sprites !! 10 -> Terreno alternativo inválido (modo de adicionar torre)

 -}

{-| Função principal. Desenha tudo que aparece no jogo com base na cena atual.-}
desenha :: [[Picture]] -> Estado -> IO Picture
desenha sprites (Estado {cena = MenuInicial Jogar}) = return $ (sprites !! 7) !! 0
desenha sprites (Estado {cena = MenuInicial Opcoes}) = return $ (sprites !! 7) !! 1
desenha sprites (Estado {cena = MenuInicial Sair}) = return $ (sprites !! 7) !! 2
desenha sprites (Estado {cena = Options Themes}) = return $ (sprites !! 7) !! 3
desenha sprites (Estado {cena = Options Audio}) = return $ (sprites !! 7) !! 4
desenha sprites (Estado {cena = Options Voltar}) = return $ (sprites !! 7) !! 5 

{-| Desenha o jogo quando se encontra no modo de jogo -}
desenha sprites (Estado {cena = ModoJogo Resumed, immutableTowers = ImmutableTowers { jogo = jogo } }) = return $
    Pictures [ imagemFundo sprites
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa (sprites !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase (sprites !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais (sprites !! 5) (portaisJogo jogo)
                          ++ desenhaTorres (sprites !! 4) (torresJogo jogo)
                          ++ desenhaInimigos (sprites !! 6) (inimigosJogo jogo))
             ]
             
{-| Desenha a loja no modo de jogo -}
desenha sprites (Estado { cena = ModoJogo (Loja t), immutableTowers = ImmutableTowers { jogo = jogo } }) = return $
    Pictures [ imagemFundo sprites
             , Translate ajusteX ajusteY $ Pictures 
                 ( desenhaMapa (sprites !! 1) (mapaJogo jogo) (0, 0)
                 ++ [desenhaBase (sprites !! 3) (posicaoBase $ baseJogo jogo)]
                 ++ desenhaPortais (sprites !! 5) (portaisJogo jogo)
                 ++ desenhaTorres (sprites !! 4) (torresJogo jogo)
                 ++ desenhaInimigos (sprites !! 6) (inimigosJogo jogo) )
             , desenhaLoja (spriteLoja t)
             ]
  where
    spriteLoja indexTorre = case indexTorre of
        Torre1 -> (sprites !! 0) !! 0
        Torre2 -> (sprites !! 0) !! 1
        Torre3 -> (sprites !! 0) !! 2
        _ -> Blank 
        
{-| Desenha o jogo quando o está pausado -}
desenha sprites (Estado { 
    cena = ModoJogo Pause,
    immutableTowers = ImmutableTowers { jogo = jogo } 
}) = return $ 
    Pictures [
        imagemFundo sprites,
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa (sprites !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase (sprites !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais (sprites !! 5) (portaisJogo jogo)
            ++ desenhaTorres (sprites !! 4) (torresJogo jogo)
            ++ desenhaInimigos (sprites !! 6) (inimigosJogo jogo) ),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        (sprites !! 8) !! 0
    ]

{-| Desenha o jogo quando o jogador escolhe a posição da nova torre -}
desenha sprites (Estado { 
    cena = AdicionaTorre t (x, y), 
    immutableTowers = ImmutableTowers { jogo = jogo } 
}) = return $ 
    Pictures [
        imagemFundo sprites,
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa (sprites !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaTerrenoAlternativo sprites (mapaJogo jogo) t (torresJogo jogo) ((mapaJogo jogo !! y) !! x) (fromIntegral x, fromIntegral y) (creditosBase (baseJogo jogo)) (custoTorre t)]
            ++ [desenhaBase (sprites !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais (sprites !! 5) (portaisJogo jogo)
            ++ desenhaTorres (sprites !! 4) (torresJogo jogo)
            ++ desenhaInimigos (sprites !! 6) (inimigosJogo jogo)
            ++ [desenhaTorre (sprites !! 4) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)])
    ]

{-| Imagem de fundo do jogo -}
imagemFundo :: [[Picture]] -- ^ Sprites do jogo
            -> Picture -- ^ Imagem de fundo
imagemFundo sprites = (sprites !! 2) !! 0

ajusteX :: Float
ajusteX = 0

ajusteY :: Float
ajusteY = blocoAltura * 4

{-| Desenha a loja -}

{-| As funções a seguir ajudam a manter a função 'desenha' mais limpa.  -}
{-| Extrai as posições das torres presentes no jogo. -}
extraiPosicoesTorres :: [Torre] -- ^ Lista de torres
                     -> [Posicao] -- ^ Lista de posições das torres
extraiPosicoesTorres = map posicaoTorre

{-| Extrai os tipos dos projéteis das torres presentes no jogo. -}
extraiTiposProjetil :: [Torre] -- ^ Lista de torres
                    -> [TipoProjetil] -- ^ Lista de tipos de projéteis
extraiTiposProjetil = map (tipoProjetil . projetilTorre)

{-| Extrai as posições dos portais presentes no jogo. -}
extraiPosicoesPortais :: [Portal] -- ^ Lista de portais
                      -> [Posicao] -- ^ Lista de posições dos portais
extraiPosicoesPortais = map posicaoPortal

{-| Extrai as posições dos inimigos presentes no jogo.  -}
extraiPosicoesInimigos :: [Inimigo] -- ^ Lista de inimigos
                      -> [Posicao] -- ^ Lista de posições dos inimigos
extraiPosicoesInimigos = map posicaoInimigo

{-| Largura de um único bloco usada para ajustar o mapa no sistema isométrico e ajustar posição dos objetos no mapa -}
blocoLargura :: Float 
blocoLargura = 100

{-| Largura de um único bloco usada para ajustar o mapa no sistema isométrico e ajustar posição dos objetos no mapa -}
blocoAltura :: Float
blocoAltura = 50

{-| Função que faz os ajustes das posições reais dos blocos do mapa -}
posicaoReal :: (Float, Float) -- ^ Coordenadas da grelha do mapa 
            -> Picture -- ^ Bloco (sprite de terreno)  
            -> Picture -- ^ Bloco com a posição ajustada
posicaoReal (x, y) = Translate realX (-realY)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

{-| Posição real dos objetos que não usam 'scale'

    Objetos que a utilizam: Base
 -}
posicaoRealObjetos :: (Float, Float) -- ^ Coordenadas do objeto na grelha do mapa
                   -> Picture -- ^ Sprite do objeto 
                   -> Picture -- ^ Objeto com a posição ajustada
posicaoRealObjetos (x, y) = Translate (realX) (-realY+25)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

{-| Posição real dos objetos que usam 'scale'
    
    Objetos que a utilizam: Torres, Portais
-}
posicaoRealObjetosScale :: (Float, Float) -- ^ Coordenadas do objeto na grelha do mapa
                   -> Picture -- ^ Sprite do objeto
                   -> Picture -- ^ Objeto com a posição ajustada
posicaoRealObjetosScale (x, y) = Translate (realX) (-realY + 25)
    where 
        realX = (x - y) * (blocoLargura)
        realY = (x + y) * (blocoAltura)

{-| Função que desenha o mapa -}
desenhaMapa :: [Picture] -- ^ Sprites dos terrenos
            -> [[Terreno]] -- ^ Grelha do mapa  
            -> (Float,Float) -- ^ Coordenadas da grelha do mapa
            -> [Picture] -- ^ Mapa com os terrenos desenhados
desenhaMapa ts [] _ = []   
desenhaMapa ts (linha:t) (x,y) =
    desenhaLinha ts linha (x,y) ++ desenhaMapa ts t (x, (y+1))

{-| Função que desenha uma linha do mapa -}
desenhaLinha :: [Picture] -- ^ Sprites dos terrenos 
             -> [Terreno] -- ^ Linha do mapa
             -> (Float,Float) -- ^ Coordenadas da grelha do mapa
             -> [Picture] -- ^ Linha do mapa com os terrenos desenhados
desenhaLinha ts [] _ = []
desenhaLinha ts (terreno:t) (x,y) =
    posicaoReal (x,y) (scale 3 3 $ (terrenoSprite ts terreno))
    : desenhaLinha ts t ((x+1), y)

{-| Função que seleciona o sprite correto do terreno -}
terrenoSprite :: [Picture] -- ^ Sprites dos terrenos 
              -> Terreno -- ^ Terreno
              -> Picture -- ^ Sprite do terreno
terrenoSprite ts terreno
  | length ts < 3 = Blank
  | otherwise = case terreno of
      Relva -> ts !! 0
      Terra -> ts !! 1
      Agua -> ts !! 2

{-| Função que desenha a base do jogador -}
desenhaBase :: [Picture] -- ^ Sprites da base
            -> Posicao -- ^ Posição da base
            -> Picture -- ^ Base desenhada
desenhaBase sprites (x,y)
    = posicaoRealObjetos (x,y) $ sprites !! 0 

{-| Função que desenha as torres  -}
desenhaTorres :: [Picture] -- ^ Sprites das torres 
              -> [Torre] -- ^ Lista de torres
              -> [Picture] -- ^ Torres desenhadas
desenhaTorres sprites torres = zipWith (desenhaTorre sprites) (extraiPosicoesTorres torres) (extraiTiposProjetil torres)

{-| Função que desenha uma única torre -}
desenhaTorre :: [Picture] -- ^ Sprites das torres 
             -> Posicao -- ^ Posição da torre
             -> TipoProjetil -- ^ Tipo do projétil
             -> Picture -- ^ Torre desenhada
desenhaTorre sprites (x, y) tipo 
    | length sprites < 3 = Blank
    | otherwise = case tipo of
    Fogo   -> ajuste $ posicaoRealObjetosScale (x, y) $ sprites !! 0
    Gelo   -> ajuste $ posicaoRealObjetosScale (x, y) $ sprites !! 1
    Resina -> ajuste $ posicaoRealObjetosScale (x, y) $ sprites !! 2
    where ajuste = scale 0.5 0.5 

{-| Função que desenha os portais  -}
desenhaPortais :: [Picture] -- ^ Sprites dos portais
               -> [Portal] -- ^ Lista de portais
               -> [Picture] -- ^ Portais desenhados
desenhaPortais sprites portais = map (desenhaPortal sprites) (extraiPosicoesPortais portais)

{-| Função que desenha um único portal -}
desenhaPortal :: [Picture] -- ^ Sprites dos portais
              -> Posicao -- ^ Posição do portal
              -> Picture -- ^ Portal desenhado
desenhaPortal sprites (x,y) = scale 0.5 0.5 $ posicaoRealObjetosScale (x,y) $ sprites !! 0

{-| Função que desenha os inimigos -}
desenhaInimigos :: [Picture] -- ^ Sprites dos inimigos
                -> [Inimigo] -- ^ Lista de inimigos
                -> [Picture] -- ^ Inimigos desenhados
desenhaInimigos sprites inimigos = map (desenhaInimigo sprites) (extraiPosicoesInimigos inimigos)
    
{-| Função que desenha um único inimigo -}
desenhaInimigo :: [Picture] -- ^ Sprites dos inimigos
               -> Posicao -- ^ Posição do inimigo
               -> Picture -- ^ Inimigo desenhado
desenhaInimigo sprites (x,y) = scale 0.5 0.5 $ posicaoRealObjetosScale (x,y) $ sprites !! 0

{-| Função que desenha a loja -} 
desenhaLoja :: Picture -- ^ Sprite da loja
            -> Picture -- ^ Loja desenhada
desenhaLoja l = Translate (-720) 220 $ Pictures [l]

desenhaTerrenoAlternativo :: [[Picture]] -- ^ Sprites dos terrenos
                          -> Mapa -- ^ Mapa
                          -> TipoTorre -- ^ Tipo da torre
                          -> [Torre] -- ^ Torres
                          -> Terreno -- ^ Terreno
                          -> Posicao -- ^ Posição do terreno
                          -> Creditos -- ^ Créditos do jogador
                          -> Creditos -- ^ Custo da torre
                          -> Picture -- ^ Terreno desenhado
desenhaTerrenoAlternativo sprites mapa tipoTorre torres t (x,y)creditos custo = posicaoReal (x,y) (scale 3 3 $ terrenoSprite spriteCorreto t)
    where spriteCorreto = if adicionaTorreValida (x,y) mapa (insereTorreNaLista torres (x,y) (projetilNovaTorre tipoTorre)) creditos custo then (sprites !! 10) else (sprites !! 9)

projetilNovaTorre :: TipoTorre -- ^ Tipo da torre 
                  -> TipoProjetil -- ^ Tipo do projétil
projetilNovaTorre tipo = case tipo of
  Torre1 -> Resina
  Torre2 -> Fogo
  Torre3 -> Gelo 