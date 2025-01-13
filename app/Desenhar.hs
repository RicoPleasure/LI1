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
import Utils.UtilitariosSaves
import Data.Char (digitToInt)

{-| Legenda dos sprites:

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
(sprites !! temaAtual) !! 11 -> Terreno a adicionar (modo de adicionar terreno)
(sprites !! temaAtual) !! 12 -> Vida da base e dos inimigos
(sprites !! temaAtual) !! 13 -> Numero usados para representar os créditos
(sprites !! temaAtual) !! 14 -> Editor de mapas
(sprites !! temaAtual) !! 15 -> Save Game
(sprites !! temaAtual) !! 16 -> Opções de Temas
(sprites !! temaAtual) !! 17 -> Telas finais
(sprites !! temaAtual) !! 18 -> Aviso Loja

 -}



{-| Função que desenha o terreno -}

{-| Função principal. Desenha tudo que aparece no jogo com base na cena atual.-}
desenha :: [[[Picture]]] -> ImmutableTowers -> IO Picture
desenha sprites (ImmutableTowers {cena = MenuInicial Jogar, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 0]
desenha sprites (ImmutableTowers {cena = MenuInicial Opcoes, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 1]
desenha sprites (ImmutableTowers {cena = MenuInicial Sair, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 2]
desenha sprites (ImmutableTowers {cena = Options Themes, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 3]

{- Themes -}

desenha sprites (ImmutableTowers {cena = ThemesMenu Tema1, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 16) !! 0]
desenha sprites (ImmutableTowers {cena = ThemesMenu Tema2, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 16) !! 1]
desenha sprites (ImmutableTowers {cena = ThemesMenu Tema3, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 16) !! 2]

{- Audio -}

desenha sprites (ImmutableTowers {cena = Options Audio, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 4]
desenha sprites (ImmutableTowers {cena = Options Voltar, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 5]
desenha sprites (ImmutableTowers {cena = OpcaoJogar ContinueGame, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 6]
desenha sprites (ImmutableTowers {cena = OpcaoJogar NewGame, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 7]
desenha sprites (ImmutableTowers {cena = SelectGameMode Levels, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 8]
desenha sprites (ImmutableTowers {cena = SelectGameMode Creator, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 9]

desenha sprites (ImmutableTowers {cena = SelectLevel 1, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 10]
desenha sprites (ImmutableTowers {cena = SelectLevel 2, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 11]
desenha sprites (ImmutableTowers {cena = SelectLevel 3, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 12]
desenha sprites (ImmutableTowers {cena = SelectLevel 4, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 13]
desenha sprites (ImmutableTowers {cena = SelectLevel 5, tema = temaAtual}) = return $ Pictures [imagemFundo (sprites !! temaAtual), ((sprites !! temaAtual) !! 7) !! 14]

desenha sprites (ImmutableTowers {cena = LoadGame t, tema = temaAtual}) = do
    games <- listGames
    return $ Pictures [imagemFundo (sprites !! temaAtual) ,mostrarJogos t games] 

{-| EDITOR DE MAPAS -}

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Terra), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 0)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Relva), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 1)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Agua), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 2)

             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre1), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 3)

             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre2), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 4)

             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre3), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 5)

             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorBase), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 6)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (OpcaoEditorPortal), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 7)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (AdicionaTerreno t (x,y)), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaTerreno ((sprites !! temaAtual) !! 11) (fromIntegral x, fromIntegral y) t]
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) )
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 8)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor t (x,y)), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo)
                          ++ [desenhaTorre ((sprites !! temaAtual) !! 4) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)])
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 8)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (AdicionaBase (x,y)), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (fromIntegral x, fromIntegral y)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 8)
             ]

desenha sprites (ImmutableTowers {cena = EditorDeMapas (AdicionaPortal (x,y)), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaPortal ((sprites !! temaAtual) !! 5) (fromIntegral x, fromIntegral y)]
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo))
             , scale 0.9 0.9 $ (((sprites !! temaAtual) !! 14) !! 8)
             ]

desenha sprites (ImmutableTowers {cena = SaveGame SaveMapa , jogo = jogo , tema = temaAtual}) = return $

    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) ),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        ((sprites !! temaAtual) !! 15) !! 0
    ]

desenha sprites (ImmutableTowers {cena = SaveGame NoSaveMapa , jogo = jogo , tema = temaAtual}) = return $

    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) ),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        ((sprites !! temaAtual) !! 15) !! 1
    ]

{- END EDITOR DE MAPAS -}

{-| Desenha o jogo quando se encontra no modo de jogo -}
desenha sprites (ImmutableTowers {cena = ModoJogo Resumed, jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo)
                          ++ desenhaVidaBase ((sprites !! temaAtual) !! 12) (vidaBase (baseJogo jogo)) (posicaoBase (baseJogo jogo)) 
                          ), desenhaCreditos ((sprites !! temaAtual) !! 13) (creditosBase (baseJogo jogo))
                          , Translate 0 (-50) $ scale 0.95 0.95 (((sprites !! temaAtual) !! 18) !! 0)
             ]

desenha sprites (ImmutableTowers {cena = Debug, jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $
                 Pictures (desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                          ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                          ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                          ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                          ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo)),
{-                         scale 0.5 0.5 $ Translate (-1000) (800) $ text $ show (posicaoInimigo (head (inimigosJogo jogo))),                        
                        scale 0.5 0.5 $ Translate (-1000) (400) $ text $ show (direcaoInimigo (head (inimigosJogo jogo))), -}
                        scale 0.5 0.5 $ Translate (-1000) (800) $ text $ show (tempoOnda (head (ondasPortal (head (portaisJogo jogo))))),
                        scale 0.5 0.5 $ Translate (-1000) (400) $ text $ show (cicloOnda (head (ondasPortal (head (portaisJogo jogo))))),
                        scale 0.5 0.5 $ Translate (-1000) (0) $ text $ show (entradaOnda (head (ondasPortal (head (portaisJogo jogo))))),
                        scale 0.5 0.5 $ Translate (-1000) (-400) $ text $ show (tempoTorre (head (torresJogo jogo))),
                        scale 0.5 0.5 $ Translate (-1000) (-800) $ text $ show (cicloTorre (head (torresJogo jogo))),
                        scale 0.5 0.5 $ Translate (-1000) (-1000) $ text $ show (vidaInimigo (head (inimigosJogo jogo))),
                        scale 0.3 0.3 $ Translate (-1400) (600) $ text $ show (projeteisInimigo (head (inimigosJogo jogo)))
             ]
             
             
{-| Desenha a loja no modo de jogo -}
desenha sprites (ImmutableTowers { cena = ModoJogo (Loja t), jogo = jogo , tema = temaAtual}) = return $
    Pictures [ imagemFundo (sprites !! temaAtual)
             , Translate ajusteX ajusteY $ Pictures 
                 ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
                 ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
                 ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
                 ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
                 ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) )
             ,  scale 0.9 0.9 $ spriteLoja t
             , Translate (150) (-420) $ desenhaCreditos ((sprites !! temaAtual) !! 13) (creditosBase (baseJogo jogo))
             ]
  where
    spriteLoja indexTorre = case indexTorre of
        Torre1 -> ((sprites !! temaAtual) !! 0) !! 0
        Torre2 -> ((sprites !! temaAtual) !! 0) !! 1
        Torre3 -> ((sprites !! temaAtual) !! 0) !! 2
        _ -> Blank 
        
{-| Desenha o jogo quando o está pausado -}
desenha sprites (ImmutableTowers { 
    cena = ModoJogo Pause,
    jogo = jogo,
    tema = temaAtual
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) ),
        Color (makeColor 0 0 0 0.5) $ Polygon [(-960, -540), (960, -540), (960, 540), (-960, 540)],
        ((sprites !! temaAtual) !! 8) !! 0
        , desenhaCreditos ((sprites !! temaAtual) !! 13) (creditosBase (baseJogo jogo))
    ]

{-| Desenha o jogo quando o jogador escolhe a posição da nova torre -}
desenha sprites (ImmutableTowers { 
    cena = AdicionaTorre t (x, y), 
    jogo = jogo,
    tema = temaAtual 
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaCirculoAlcance (fromIntegral x, fromIntegral y) (alcanceTorreTipo t)]
            ++ [desenhaTerrenoAlternativo (sprites !! temaAtual) (mapaJogo jogo) t (torresJogo jogo) ((mapaJogo jogo !! y) !! x) (fromIntegral x, fromIntegral y) (creditosBase (baseJogo jogo)) (custoTorre t)]
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo)
            ++ [desenhaTorre ((sprites !! temaAtual) !! 4) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)])
            , desenhaCreditos ((sprites !! temaAtual) !! 13) (creditosBase (baseJogo jogo))
    ]

{-|
    Desenha tela de vitoria
-}
desenha sprites (ImmutableTowers { 
    cena = TelaFinal (Vitoria MenuVitoria),
    jogo = jogo,
    tema = temaAtual
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) ),
            ((sprites !! temaAtual) !! 17) !! 0
        ]

desenha sprites (ImmutableTowers { 
    cena = TelaFinal (Vitoria NextLevel),
    jogo = jogo,
    tema = temaAtual
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo) ),
            ((sprites !! temaAtual) !! 17) !! 2
        ]

{-|
    Desenha tela de derrota
-}
desenha sprites (ImmutableTowers { 
    cena = TelaFinal (Derrota MenuDerrota),
    jogo = jogo,
    tema = temaAtual
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo)),
            ((sprites !! temaAtual) !! 17) !! 1
        ]

desenha sprites (ImmutableTowers { 
    cena = TelaFinal (Derrota TentarNovamente),
    jogo = jogo,
    tema = temaAtual
}) = return $ 
    Pictures [
        imagemFundo (sprites !! temaAtual),
        Translate ajusteX ajusteY $ Pictures 
            ( desenhaMapa ((sprites !! temaAtual) !! 1) (mapaJogo jogo) (0, 0)
            ++ [desenhaBase ((sprites !! temaAtual) !! 3) (posicaoBase $ baseJogo jogo)]
            ++ desenhaPortais ((sprites !! temaAtual) !! 5) (portaisJogo jogo)
            ++ desenhaTorres ((sprites !! temaAtual) !! 4) (torresJogo jogo)
            ++ desenhaInimigos ((sprites !! temaAtual) !! 6) ((sprites !! temaAtual) !! 12) (inimigosJogo jogo)),
            ((sprites !! temaAtual) !! 17) !! 3
        ]

{-| 
    'imagemFundo' é uma função que retorna a imagem de fundo do jogo.
-}
imagemFundo :: [[Picture]] -- ^ temaAtual do jogo
            -> Picture -- ^ Imagem de fundo
imagemFundo sprites = (sprites !! 2) !! 0

{-| 
    'ajusteX' e 'ajusteY' são ajustes de posição para o mapa.
-}
ajusteX :: Float
ajusteX = 0

ajusteY :: Float
ajusteY = blocoAltura * 4

{-| 
    'extraiPosicoesTorres' é uma função que extrai as posições das torres presentes no jogo.
-}
extraiPosicoesTorres :: [Torre] -- ^ Lista de torres
                     -> [Posicao] -- ^ Lista de posições das torres
extraiPosicoesTorres = map posicaoTorre

{-| 
    'extraiTiposProjetil' é uma função que extrai os tipos de projéteis presentes nas torres do jogo.
-}
extraiTiposProjetil :: [Torre] -- ^ Lista de torres
                    -> [TipoProjetil] -- ^ Lista de tipos de projéteis
extraiTiposProjetil = map (tipoProjetil . projetilTorre)

{-|
    'extraiPosicoesPortais' é uma função que extrai as posições dos portais presentes no jogo.
-}
extraiPosicoesPortais :: [Portal] -- ^ Lista de portais
                      -> [Posicao] -- ^ Lista de posições dos portais
extraiPosicoesPortais = map posicaoPortal

{-|
    'extraiPosicoesInimigos' é uma função que extrai as posições dos inimigos presentes no jogo.
-}
extraiPosicoesInimigos :: [Inimigo] -- ^ Lista de inimigos
                      -> [Posicao] -- ^ Lista de posições dos inimigos
extraiPosicoesInimigos = map posicaoInimigo

{-|
    'blocoLargura' é a largura de um bloco usada para ajustar o mapa no sistema isométrico e ajustar posição dos objetos no mapa.
-}
blocoLargura :: Float 
blocoLargura = 100

{-|
    'blocoAltura' é a altura de um bloco usada para ajustar o mapa no sistema isométrico e ajustar posição dos objetos no mapa.
-}
blocoAltura :: Float
blocoAltura = 50

{-|
    'posicaoReal' é uma função que ajusta a posição de um bloco no mapa.
-}
posicaoReal :: (Float, Float) -- ^ Coordenadas da grelha do mapa 
            -> Picture -- ^ Bloco (sprite de terreno)  
            -> Picture -- ^ Bloco com a posição ajustada
posicaoReal (x, y) = Translate realX (-realY)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

{-|
    'posicaoRealObjetos' é uma função que ajusta a posição de um objeto no mapa.
    
    ==Objetos que a utiliza: 
    * Torres
    * Base
 -}
posicaoRealObjetos :: (Float, Float) -- ^ Coordenadas do objeto na grelha do mapa
                   -> Picture -- ^ Sprite do objeto 
                   -> Picture -- ^ Objeto com a posição ajustada
posicaoRealObjetos (x, y) = Translate realX (-realY+25)
    where 
        realX = (x - y) * (blocoLargura / 2)
        realY = (x + y) * (blocoAltura / 2)

{-| 
    'posicaoRealObjetosScale' é uma função que ajusta a posição de um objeto no mapa e escala o objeto.
    
    ==Objetos que a utiliza:
    * Inimigos
    * Portais
-}
posicaoRealObjetosScale :: (Float, Float) -- ^ Coordenadas do objeto na grelha do mapa
                   -> Picture -- ^ Sprite do objeto
                   -> Picture -- ^ Objeto com a posição ajustada
posicaoRealObjetosScale (x, y) = Translate realX (-realY + 25)
    where 
        realX = (x - y) * blocoLargura
        realY = (x + y) * blocoAltura

{-| 
    'desenhaMapa' é uma função que desenha o mapa do jogo.
 -}
desenhaMapa :: [Picture] -- ^ temaAtual dos terrenos
            -> [[Terreno]] -- ^ Grelha do mapa  
            -> (Float,Float) -- ^ Coordenadas da grelha do mapa
            -> [Picture] -- ^ Mapa com os terrenos desenhados
desenhaMapa _ [] _ = []   
desenhaMapa ts (linha:t) (x,y) =
    desenhaLinha ts linha (x,y) ++ desenhaMapa ts t (x, (y+1))

{-| 
    'desenhaLinha' é uma função auxiliar de 'desenhaMapa' que desenha uma linha do mapa.
-}
desenhaLinha :: [Picture] -- ^ temaAtual dos terrenos 
             -> [Terreno] -- ^ Linha do mapa
             -> (Float,Float) -- ^ Coordenadas da grelha do mapa
             -> [Picture] -- ^ Linha do mapa com os terrenos desenhados
desenhaLinha _ [] _ = []
desenhaLinha ts (terreno:t) (x,y) =
    posicaoReal (x,y) (scale 3 3 $ (terrenoSprite ts terreno))
    : desenhaLinha ts t ((x+1), y)


{-|
    'desenhaTerreno' é uma função que desenha um terreno no mapa.
-}
desenhaTerreno :: [Picture] -- ^ temaAtual dos terrenos
               -> Posicao -- ^ Posição do terreno
               -> Terreno -- ^ Terreno
               -> Picture -- ^ Terreno desenhado
desenhaTerreno ts (x,y) terreno = posicaoReal (x,y) (scale 3 3 $ (terrenoSprite ts terreno))

{-|
    'terrenoSprite' é uma função que retorna o sprite de um terreno baseado no 'Terreno'.
-}
terrenoSprite :: [Picture] -- ^ sprites dos terrenos 
              -> Terreno -- ^ Terreno
              -> Picture -- ^ Sprite do terreno
terrenoSprite ts terreno
  | length ts < 4 = Blank
  | otherwise = case terreno of
      Relva -> ts !! 0
      Terra -> ts !! 1
      Agua -> ts !! 2
      Vazio -> ts !! 3

{-|
    'desenhaBase' é uma função que desenha a base no mapa.
-}
desenhaBase :: [Picture] -- ^ temaAtual da base
            -> Posicao -- ^ Posição da base
            -> Picture -- ^ Base desenhada
desenhaBase sprites (x,y)
    = posicaoRealObjetos (x,y) $ sprites !! 0 

{-|
    'desenhaTorres' é uma função que desenha as torres no mapa.
-}
desenhaTorres :: [Picture] -- ^ temaAtual das torres 
              -> [Torre] -- ^ Lista de torres
              -> [Picture] -- ^ Torres desenhadas
desenhaTorres sprites torres = zipWith (desenhaTorre sprites) (extraiPosicoesTorres torres) (extraiTiposProjetil torres)

{-|
    'desenhaTorre' é uma função que desenha uma torre no mapa.
-}
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

{-|
    'desenhaPortais' é uma função que desenha os portais no mapa.
-}
desenhaPortais :: [Picture] -- ^ temaAtual dos portais
               -> [Portal] -- ^ Lista de portais
               -> [Picture] -- ^ Portais desenhados
desenhaPortais sprites portais = map (desenhaPortal sprites) (extraiPosicoesPortais portais)

{-| 
    'desenhaPortal' é uma função auxiliar de 'desenhaPortais' que desenha um portal no mapa.
 -}
desenhaPortal :: [Picture] -- ^ temaAtual dos portais
              -> Posicao -- ^ Posição do portal
              -> Picture -- ^ Portal desenhado
desenhaPortal sprites (x,y) = scale 0.5 0.5 $ posicaoRealObjetosScale (x,y) $ sprites !! 0

{-|
    'desenhaInimigos' é uma função que desenha os inimigos no mapa.
-}
desenhaInimigos :: [Picture] -- ^ temaAtual dos inimigos
                -> [Picture] -- ^ temaAtual da vida dos inimigos
                -> [Inimigo] -- ^ Lista de inimigos
                -> [Picture] -- ^ Inimigos desenhados
desenhaInimigos sprites spritesVida inimigos = map (desenhaInimigo sprites spritesVida) (inimigos)

    
{-| 
    'desenhaInimigo' é uma função auxiliar de 'desenhaInimigos' que desenha um inimigo no mapa.
-}
desenhaInimigo :: [Picture] -- ^ temaAtual dos inimigos
               -> [Picture] -- ^ Inimigo
               -> Inimigo -- ^ Inimigo
               -> Picture -- ^ Inimigo desenhado
desenhaInimigo sprites spritesVida inimigo = 
  Pictures $ 
    [scale 0.5 0.5 $ posicaoRealObjetosScale (posicaoInimigo inimigo) (sprites !! 0)] 
    ++ desenhaVidaInimigo spritesVida (vidaInimigo inimigo) (posicaoInimigo inimigo)



{-|
    'desenhaTerrenoAlternativo' é uma função que desenha um terreno alternativo no mapa.

    == Observações:
    * Se a torre puder ser adicionada, o terreno é desenhado com um sprite dos terrenos em verde.
    * Se a torre não puder ser adicionada, o terreno é desenhado com um sprite dos terrenos em vermelho.
-}
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

desenhaCirculoAlcance :: Posicao -- ^ Posição da torre
                      -> Float -- ^ Raio do círculo
                      -> Picture -- ^ Círculo de alcance
desenhaCirculoAlcance (x,y) f = posicaoReal (x,y) $ scale 55 30 $ Color (makeColor 0 0 200 0.5) $ circleSolid f

{-|
    'projetilNovaTorre' é uma função que retorna o tipo de projétil de uma torre baseado no tipo da torre.

    ==Exemplo de utilização:
    >>> projetilNovaTorre Torre1
    Resina
    >>> projetilNovaTorre Torre2
    Fogo
    >>> projetilNovaTorre Torre3
    Gelo
-}
projetilNovaTorre :: TipoTorre -- ^ Tipo da torre 
                  -> TipoProjetil -- ^ Tipo do projétil
projetilNovaTorre tipo = case tipo of
  Torre1 -> Resina
  Torre2 -> Fogo
  Torre3 -> Gelo

{-|
    'desenhaVidaBase' é uma função que desenha a vida da base, com auxílio da função 'desenhaVida'.
-}
desenhaVidaBase :: [Picture] -> Float -> (Float, Float) -> [Picture]
desenhaVidaBase sprites vida (x, y) = desenhaVida sprites vida (x, y) 500 (-29, 40)

{-|
    'desenhaVidaInimigo' é uma função que desenha a vida de um inimigo, com auxílio da função 'desenhaVida'.
-}
desenhaVidaInimigo :: [Picture] -> Float -> (Float, Float) -> [Picture]
desenhaVidaInimigo sprites vida (x, y) = desenhaVida sprites vida (x, y) 100 (-29,20)

{-|
    'desenhaVida' é uma função que desenha a vida de um objeto.
-}
desenhaVida :: [Picture] -> Float -> (Float, Float) -> Float -> (Float,Float) -> [Picture]
desenhaVida sprites vida (x, y) vidaM (tx,ty) =
  let numeroBarras = 10
      vidaMaxima = vidaM
      vidaPorBarra = vidaMaxima / numeroBarras
      barrasAtuais = min ( (vida / vidaPorBarra)) numeroBarras
      espacamento = 5
      sprite = sprites !! 0
      spritesVida = [ Translate (x + i * espacamento) y sprite | i <- [0 .. barrasAtuais - 1] ]
  in [Translate tx ty $ (posicaoRealObjetosLista (x, y) spritesVida)]

{-|
    'posicaoRealObjetosLista' é uma função que ajusta a posição de uma lista de objetos no mapa.
-}
posicaoRealObjetosLista :: (Float, Float) -> [Picture] -> Picture
posicaoRealObjetosLista (x, y) p = Translate realX (-realY + 25) (Pictures p)
  where
    realX = (x - y) * (blocoLargura / 2)
    realY = (x + y) * (blocoAltura / 2)

{-|
    'desenhaCreditos' é uma função que desenha os créditos do jogador.
-}
desenhaCreditos :: [Picture] -> Creditos -> Picture
desenhaCreditos sprites creditos = Translate 470 450 $ scale 0.2 0.2 $ Pictures [Translate (i * 200) 0 (sprites !! (digitToInt c)) | (i, c) <- zip [0..] (show creditos)]

{-|
    'mostrarJogos' é uma função que desenha os jogos salvos.
-}
mostrarJogos :: Int -> [String] -> Picture
mostrarJogos sel games =
  Translate (-125) 300 $
    Pictures $
      zipWith
        (\index game ->
           let
             saveName = extraiNomeSave game
             umSave =
               if saveName == "Empty save"
                 then Translate 0 (fromIntegral (-100 * index)) (Scale 0.5 0.5 $ Text "Empty")
                 else Translate 0 (fromIntegral (-100 * index)) (Scale 0.5 0.5 $ Text ("Level " ++ saveName))
           in if index == sel
                then Color red umSave
                else umSave
        )
        [1..]
        games

{-|
    'extraiNomeSave' é uma função que extrai o nome do jogo salvo.
-}
extraiNomeSave :: String -> String
extraiNomeSave game = takeWhile (/= '.') game
