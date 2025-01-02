module Eventos where

import Graphics.Gloss.Interface.Pure.Game
import Desenhar
import ImmutableTowers
import System.Exit (exitSuccess)
import LI12425
import Utils.UtilitariosTorre
import Utils.Utilitarios

{-| Função que reúne e limita os eventos que acontecem em cada "cena" do jogo -}
reageEventos :: Event -> Estado -> IO Estado
reageEventos tecla e@Estado {cena = MenuInicial _} = reageEventosMenuInicial tecla e
reageEventos tecla e@Estado {cena = ModoJogo Resumed} = reageEventosModoJogo tecla e
reageEventos tecla e@Estado {cena = ModoJogo Pause} = reageEventosModoJogo tecla e
reageEventos tecla e@Estado {cena = Options _ } = reageEventosOptions tecla e
reageEventos tecla e@Estado {cena = ModoJogo (Loja _)} = reageEventosLoja tecla e
reageEventos tecla e@Estado {cena = AdicionaTorre _ _} = reageEventosAdicionaTorre tecla e
reageEventos _ w = return $ w

{-| _reageEventosMenuInicial_

    Função que reage a eventos no menu inicial do jogo.
 -}
{-| Navegar entre as opções em "MenuInicial" -}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = MenuInicial Jogar} = return $ e {cena = MenuInicial Opcoes}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = MenuInicial Opcoes} = return $ e {cena = MenuInicial Jogar}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = MenuInicial Opcoes} = return $ e {cena = MenuInicial Sair}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = MenuInicial Sair} = return $ e {cena = MenuInicial Opcoes}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = MenuInicial Jogar} = return $ e {cena = MenuInicial Sair}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = MenuInicial Sair} = return $ e {cena = MenuInicial Jogar}
{-| Acessar as opções em "MenuInicial" -}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = MenuInicial Jogar} = return $ e {cena = ModoJogo Resumed}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = MenuInicial Opcoes} = return $ e {cena = Options Themes}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = MenuInicial Sair} = exitSuccess
{-| Caso geral de "reageEventosMenuInicial" -}
reageEventosMenuInicial _ e = return $ e

{-| _reageEventosOptions_

    Função que reage a eventos no menu de opções do jogo.
 -}
{-| Navegar entre as opções em "Opções" -}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = Options Themes} = return $ e {cena = Options Audio}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = Options Audio} = return $ e {cena = Options Voltar}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = Options Audio} = return $ e {cena = Options Themes}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = Options Voltar} = return $ e {cena = Options Audio}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = Options Themes} = return $ e {cena = Options Voltar}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = Options Voltar} = return $ e {cena = Options Themes}
{-| Acessar as opções em "Opções" -}
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = Options Themes} = return $ e
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = Options Audio} = return $ e
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = Options Voltar} = return $ e {cena = MenuInicial Jogar}
{- Caso geral de "reageEventosOptions" -}
reageEventosOptions _ e = return $ e

{-| _reageEventosModoJogo_

    Função que reage a eventos no modo de jogo
 -}

{-| Alterna entre as cenas "Pause" e "Resumed"  -}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@Estado {cena = ModoJogo Resumed} = return $ e {cena = ModoJogo Pause}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@Estado {cena = ModoJogo Pause} = return $ e {cena = ModoJogo Resumed}
{-| Volta ao menu inicial -}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = ModoJogo Resumed} = return $ e {cena = MenuInicial Jogar}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = ModoJogo Pause} = return $ e {cena = MenuInicial Jogar}
{-| Ativa a loja -}
reageEventosModoJogo (EventKey (Char 'l') Down _ _) e@Estado {cena = ModoJogo Resumed} = return $ e {cena = ModoJogo (Loja Torre1)}
{-| Caso geral de "reageEventosModoJogo"-}
reageEventosModoJogo _ e = return $ e

{-| _reageEventosLoja_

    Função que reage a eventos na loja do jogo.
 -}
{-| Navegação loja -}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = ModoJogo (Loja Torre1)} = return $ e {cena = ModoJogo (Loja Torre2)}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = ModoJogo (Loja Torre2)} = return $ e {cena = ModoJogo (Loja Torre3)}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = ModoJogo (Loja Torre3)} = return $ e {cena = ModoJogo (Loja Torre1)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = ModoJogo (Loja Torre1)} = return $ e {cena = ModoJogo (Loja Torre3)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = ModoJogo (Loja Torre2)} = return $ e {cena = ModoJogo (Loja Torre1)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = ModoJogo (Loja Torre3)} = return $ e {cena = ModoJogo (Loja Torre2)}
{-| Ativa a cena "AdicionaTorre" que permite que o jogador selecione o local que quer posicionar a torre -}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = ModoJogo (Loja Torre1)} = return $ e {cena = AdicionaTorre Torre1 (4,4)}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = ModoJogo (Loja Torre2)} = return $ e {cena = AdicionaTorre Torre2 (4,4)}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = ModoJogo (Loja Torre3)} = return $ e {cena = AdicionaTorre Torre3 (4,4)}
{-| Sai da loja -}
reageEventosLoja (EventKey (Char 'l') Down _ _) e@Estado {cena = ModoJogo (Loja _)} = return $ e {cena = ModoJogo Resumed}
reageEventosLoja _ e = return $ e

{-| _reageEventosAdicionaTorre_

    Função que reage a eventos no modo de adicionar torres.
 -}
{-| Navegação pelo mapa na cena "AdicionaTorre" -}
reageEventosAdicionaTorre (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = AdicionaTorre t (x, y)}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = AdicionaTorre t (x,y + 1)}
    | otherwise = return $ e
reageEventosAdicionaTorre (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = AdicionaTorre t (x, y)}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = AdicionaTorre t (x,y - 1)}
    | otherwise = return $ e
reageEventosAdicionaTorre (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = AdicionaTorre t (x, y)} 
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = AdicionaTorre t (x+1,y)}
    | otherwise = return $ e
reageEventosAdicionaTorre (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = AdicionaTorre t (x, y)} 
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = AdicionaTorre t (x-1,y)}
    | otherwise = return $ e
{-| Compra a torre -}
reageEventosAdicionaTorre (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = AdicionaTorre t (x, y), immutableTowers = ImmutableTowers { jogo = jogo }} 
    | adicionaTorreValida (fromIntegral x, fromIntegral y) (mapaJogo jogo) newTorres creditos custo = return $ e { 
        cena = ModoJogo Resumed,
        immutableTowers = ImmutableTowers { 
            jogo = jogo { 
                torresJogo = newTorres,
                baseJogo = (baseJogo jogo) { creditosBase = creditos - custo }
            }
        }
    }
    | otherwise = return $ e
    where
        newTorres = insereTorreNaLista (torresJogo jogo) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)
        creditos = creditosBase (baseJogo jogo)
        custo = custoTorre t
reageEventosAdicionaTorre (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = AdicionaTorre t (x, y)} = return $ e {cena = ModoJogo (Loja t)} 
{-| Caso geral de "reageEventosAdicionaTorre" -}
reageEventosAdicionaTorre _ e = return $ e



