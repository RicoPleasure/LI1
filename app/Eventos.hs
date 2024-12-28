module Eventos where

import Graphics.Gloss.Interface.Pure.Game
import Desenhar
import ImmutableTowers
import System.Exit (exitSuccess)

reageEventos :: Event -> Estado -> IO Estado
reageEventos tecla e@Estado {menu = MenuInicial _} = reageEventosMenuInicial tecla e
reageEventos tecla e@Estado {menu = ModoJogo _} = reageEventosModoJogo tecla e
reageEventos _ w = return $ w

{-| Navegar entre as opções do menu -}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = MenuInicial Sair} = return $ e {menu = MenuInicial Options}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = MenuInicial Options} = return $ e {menu = MenuInicial Jogar}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = MenuInicial Jogar} = return $ e {menu = MenuInicial Options}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = MenuInicial Options} = return $ e {menu = MenuInicial Sair}

{-| Acessa as opções do menu -}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = MenuInicial Jogar} = return $ e {menu = ModoJogo Resumed}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = MenuInicial Options} = return $ e {menu = MenuInicial Options}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = MenuInicial Sair} = exitSuccess

{-| Caso geral -}
reageEventosMenuInicial _ e = return $ e

{-| Reage a eventos no modo de jogo  -}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@Estado {menu = ModoJogo Resumed} = return $ e {menu = ModoJogo Pause}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@Estado {menu = ModoJogo Pause} = return $ e {menu = ModoJogo Resumed}

{-| Volta ao menu inicial no modo de jogo -}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {menu = ModoJogo Resumed} = return $ e {menu = MenuInicial Jogar}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {menu = ModoJogo Pause} = return $ e {menu = MenuInicial Jogar}

reageEventosModoJogo _ e = return $ e