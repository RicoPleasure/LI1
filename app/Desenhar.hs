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
import Utils.UtilitariosEditor

{-| Legenda dos temaAtual

(sprites !! temaAtual) !! 0 -> Loja
(sprites !! temaAtual) !! 1 -> Terrenos
(sprites !! temaAtual) !! 2 -> Background
(sprites !! temaAtual) !! 3 -> Base
(sprites !! temaAtual) !! 4 -> Torres
(sprites !! temaAtual) !! 5 -> Portais
(sprites !! temaAtual) !! 6 -> Inimigos
(sprites !! temaAtual) !! 7 -> Menu
(sprites !! temaAtual) !! 8 -> Pause
(sprites !! temaAtual) !! 9 -> Terreno alternativo válido (modo de adicionar torre)
(sprites !! temaAtual) !! 10 -> Terreno alternativo inválido (modo de adicionar torre)

 -}

data Estado = Estado { immutableTowers :: ImmutableTowers, cena :: Cena, tema :: Int }

{-| Função que desenha o terreno -}

{-| Função principal. Desenha tudo que aparece no jogo com base na cena atual.-}
desenha :: [[[Picture]]] -> Estado -> IO Picture
desenha sprites (Estado {cena = MenuInicial Jogar, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 0
desenha sprites (Estado {cena = MenuInicial Opcoes, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 1
desenha sprites (Estado {cena = MenuInicial Sair, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 2
desenha sprites (Estado {cena = Options Themes, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 3

{- Themes -}

desenha sprites (Estado {cena = ThemesMenu Theme1, tema = temaAtual}) = return $ text "Theme 1"
desenha sprites (Estado {cena = ThemesMenu Theme2, tema = temaAtual}) = return $ text "Theme 2"
desenha sprites (Estado {cena = ThemesMenu Theme3, tema = temaAtual}) = return $ text "Theme 3"

{- Audio -}

desenha sprites (Estado {cena = Options Audio, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 4
desenha sprites (Estado {cena = Options Voltar, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 5
desenha sprites (Estado {cena = OpcaoJogar ContinueGame, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 6
desenha sprites (Estado {cena = OpcaoJogar NewGame, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 7
desenha sprites (Estado {cena = SelectGameMode Levels, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 8
desenha sprites (Estado {cena = SelectGameMode Creator, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 9

desenha sprites (Estado {cena = SelectLevel Level1, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 10
desenha sprites (Estado {cena = SelectLevel Level2, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 11
desenha sprites (Estado {cena = SelectLevel Level3, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 12
desenha sprites (Estado {cena = SelectLevel Level4, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 13
desenha sprites (Estado {cena = SelectLevel Level5, tema = temaAtual}) = return $ ((sprites !! temaAtual) !! 7) !! 14

desenha sprites (Estado {cena = LoadGame 1, tema = temaAtual}) = do
    games <- listGames
    return $ Pictures (gameTextPictures games) 
desenha sprites (Estado {cena = LoadGame 2, tema = temaAtual}) = return $ text "Carregando jogo 2"
desenha sprites (Estado {cena = LoadGame 3, tema = temaAtual}) = return $ text "Carregando jogo 3"

{-| EDITOR DE MAPAS -}

desenha sprites (Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Terra)), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Relva)), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Agua)), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre1)), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre2)), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre3)), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor OpcaoEditorBase), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor OpcaoEditorPortal), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (AdicionaTerreno t (x,y))), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaTerreno ((sprites !! temaAtual) !! 11) (fromIntegral x, fromIntegral y) t]
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo) )
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x,y))), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo)
                          ++ [desenhaTorre ((sprites !! temaAtual) !! 4) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)])
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (AdicionaBase (x,y))), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (fromIntegral x, fromIntegral y)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (Editor (AdicionaPortal (x,y))), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaPortal ((sprites !! temaAtual) !! 5) (fromIntegral x, fromIntegral y)]
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = EditorDeMapas (QuitEditor SaveMapa), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $

    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo) ),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        ((sprites !! temaAtual) !! 8) !! 0
    ]

{- END EDITOR DE MAPAS -}

{-| Desenha o jogo quando se encontra no modo de jogo -}
desenha sprites (Estado {cena = ModoJogo Resumed, immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo))
             ]

desenha sprites (Estado {cena = Debug, immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo)),
{-                         scale 0.5 0.5 $ Translate (-1000) (800) $ text $ show (posicaoInimigo (head (inimigosJogo jogo))),                        
                        scale 0.5 0.5 $ Translate (-1000) (400) $ text $ show (direcaoInimigo (head (inimigosJogo jogo))), -}
                        scale 0.5 0.5 $ Translate (-1000) (800) $ text $ show (tempoOnda (head (ondasPortal (head (portaisJogo jogo))))),
                        scale 0.5 0.5 $ Translate (-1000) (400) $ text $ show (cicloOnda (head (ondasPortal (head (portaisJogo jogo))))),
                        scale 0.5 0.5 $ Translate (-1000) (0) $ text $ show (entradaOnda (head (ondasPortal (head (portaisJogo jogo)))))
             ]
             
             
{-| Desenha a loja no modo de jogo -}
desenha sprites (Estado { cena = ModoJogo (Loja t), immutableTowers = ImmutableTowers { jogo = jogo } , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $ Pictures 
                 ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                 ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                 ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                 ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                 ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo) )
             , desenhaLoja (spriteLoja t)
             ]
  where
    spriteLoja indexTorre = case indexTorre of
        Torre1 -> ((sprites !! temaAtual) !! 0) !! 0
        Torre2 -> ((sprites !! temaAtual) !! 0) !! 1
        Torre3 -> ((sprites !! temaAtual) !! 0) !! 2
        _ -> Blank 
        
{-| Desenha o jogo quando o está pausado -}
desenha sprites (Estado { 
    cena = ModoJogo Pause,
    immutableTowers = ImmutableTowers { jogo = jogo}, 
    tema = temaAtual  
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo) ),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        ((sprites !! temaAtual) !! 8) !! 0
    ]

{-| Desenha o jogo quando o jogador escolhe a posição da nova torre -}
desenha sprites (Estado { 
    cena = AdicionaTorre t (x, y), 
    immutableTowers = ImmutableTowers { jogo = jogo }, 
    tema = temaAtual 
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaTerrenoAlternativo (sprites !! temaAtual) (mapaJogo jogo) t (torresJogo jogo) ((mapaJogo jogo !! y) !! x) (fromIntegral x, fromIntegral y) (creditosBase (baseJogo jogo)) (custoTorre t)]
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) (inimigosJogo jogo)
            ++ [desenhaTorre ((sprites !! temaAtual) !! 4) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)])
    ]


{-| Imagem de fundo do jogo -}
imagemFundo :: [[Picture]] -- ^ temaAtual do jogo
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
desenhaMapa :: [Picture] -- ^ temaAtual dos terrenos
            -> [[Terreno]] -- ^ Grelha do mapa  
            -> (Float,Float) -- ^ Coordenadas da grelha do mapa
            -> [Picture] -- ^ Mapa com os terrenos desenhados
desenhaMapa ts [] _ = []   
desenhaMapa ts (linha:t) (x,y) =
    desenhaLinha ts linha (x,y) ++ desenhaMapa ts t (x, (y+1))

{-| Função que desenha uma linha do mapa -}
desenhaLinha :: [Picture] -- ^ temaAtual dos terrenos 
             -> [Terreno] -- ^ Linha do mapa
             -> (Float,Float) -- ^ Coordenadas da grelha do mapa
             -> [Picture] -- ^ Linha do mapa com os terrenos desenhados
desenhaLinha ts [] _ = []
desenhaLinha ts (terreno:t) (x,y) =
    posicaoReal (x,y) (scale 3 3 $ (terrenoSprite ts terreno))
    : desenhaLinha ts t ((x+1), y)

desenhaTerreno :: [Picture] -- ^ temaAtual dos terrenos
               -> Posicao -- ^ Posição do terreno
               -> Terreno -- ^ Terreno
               -> Picture -- ^ Terreno desenhado
desenhaTerreno ts (x,y) terreno = posicaoReal (x,y) (scale 3 3 $ (terrenoSprite ts terreno))

{-| Função que seleciona o sprite correto do terreno -}
terrenoSprite :: [Picture] -- ^ temaAtual dos terrenos 
              -> Terreno -- ^ Terreno
              -> Picture -- ^ Sprite do terreno
terrenoSprite ts terreno
  | length ts < 3 = Blank
  | otherwise = case terreno of
      Relva -> ts !! 0
      Terra -> ts !! 1
      Agua -> ts !! 2
      Vazio -> ts !! 3

{-| Função que desenha a base do jogador -}
desenhaBase :: [Picture] -- ^ temaAtual da base
            -> Posicao -- ^ Posição da base
            -> Picture -- ^ Base desenhada
desenhaBase sprites (x,y)
    = posicaoRealObjetos (x,y) $ sprites !! 0 

{-| Função que desenha as torres  -}
desenhaTorres :: [Picture] -- ^ temaAtual das torres 
              -> [Torre] -- ^ Lista de torres
              -> [Picture] -- ^ Torres desenhadas
desenhaTorres sprites torres = zipWith (desenhaTorre sprites) (extraiPosicoesTorres torres) (extraiTiposProjetil torres)

{-| Função que desenha uma única torre -}
desenhaTorre :: [Picture] -- ^ temaAtual das torres 
             -> Posicao -- ^ Posição da torre
             -> TipoProjetil -- ^ Tipo do projétil
             -> Picture -- ^ Torre desenhada
desenhaTorre sprites (x, y) tipo 
    | length sprites < 3 = Blank
    | otherwise = case tipo of
    Fogo   -> posicaoRealObjetos (x, y) $ sprites !! 0
    Gelo   -> posicaoRealObjetos (x, y) $ sprites !! 1
    Resina -> posicaoRealObjetos (x, y) $ sprites !! 2 

{-| Função que desenha os portais  -}
desenhaPortais :: [Picture] -- ^ temaAtual dos portais
               -> [Portal] -- ^ Lista de portais
               -> [Picture] -- ^ Portais desenhados
desenhaPortais sprites portais = map (desenhaPortal sprites) (extraiPosicoesPortais portais)

{-| Função que desenha um único portal -}
desenhaPortal :: [Picture] -- ^ temaAtual dos portais
              -> Posicao -- ^ Posição do portal
              -> Picture -- ^ Portal desenhado
desenhaPortal sprites (x,y) = scale 0.5 0.5 $ posicaoRealObjetosScale (x,y) $ sprites !! 0

{-| Função que desenha os inimigos -}
desenhaInimigos :: [Picture] -- ^ temaAtual dos inimigos
                -> [Inimigo] -- ^ Lista de inimigos
                -> [Picture] -- ^ Inimigos desenhados
desenhaInimigos sprites inimigos = map (desenhaInimigo sprites) (extraiPosicoesInimigos inimigos)
    
{-| Função que desenha um único inimigo -}
desenhaInimigo :: [Picture] -- ^ temaAtual dos inimigos
               -> Posicao -- ^ Posição do inimigo
               -> Picture -- ^ Inimigo desenhado
desenhaInimigo sprites (x,y) = scale 0.5 0.5 $ posicaoRealObjetosScale (x,y) $ sprites !! 0

{-| Função que desenha a loja -} 
desenhaLoja :: Picture -- ^ Sprite da loja
            -> Picture -- ^ Loja desenhada
desenhaLoja l = Translate (-720) 220 $ Pictures [l]

desenhaTerrenoAlternativo :: [[Picture]] -- ^ temaAtual dos terrenos
                          -> Mapa -- ^ Mapa
                          -> TipoTorre -- ^ Tipo da torre
                          -> [Torre] -- ^ Torres
                          -> Terreno -- ^ Terreno
                          -> Posicao -- ^ Posição do terreno
                          -> Creditos -- ^ Créditos do jogador
                          -> Creditos -- ^ Custo da torre
                          -> Picture -- ^ Terreno desenhado
desenhaTerrenoAlternativo sprites mapa tipoTorre torres t (x,y) creditos custo = posicaoReal (x,y) (scale 3 3 $ terrenoSprite spriteCorreto t)
    where spriteCorreto = if adicionaTorreValida (x,y) mapa (insereTorreNaLista torres (x,y) (projetilNovaTorre tipoTorre)) creditos custo then (sprites !! 10) else (sprites !! 9)

projetilNovaTorre :: TipoTorre -- ^ Tipo da torre 
                  -> TipoProjetil -- ^ Tipo do projétil
projetilNovaTorre tipo = case tipo of
  Torre1 -> Resina
  Torre2 -> Fogo
  Torre3 -> Gelo 

gameTextPictures :: [String] -> [Picture]
gameTextPictures games = zipWith (\game y -> Scale 0.5 0.5 $ Translate (-300) (400 - y * 180) $ text game) games [0..]