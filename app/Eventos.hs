module Eventos where

import Graphics.Gloss.Interface.Pure.Game
import Desenhar
import ImmutableTowers
import System.Exit (exitSuccess)

reageEventos :: Event -> Estado -> IO Estado
reageEventos tecla e@Estado {menu = MenuInicial _} = reageEventosMenuInicial tecla e
reageEventos tecla e@Estado {menu = ModoJogo Resumed} = reageEventosModoJogo tecla e
reageEventos tecla e@Estado {menu = ModoJogo Pause} = reageEventosModoJogo tecla e
reageEventos tecla e@Estado {menu = Options _ } = reageEventosOptions tecla e
reageEventos tecla e@Estado {menu = ModoJogo (Loja _)} = reageEventosLoja tecla e
reageEventos _ w = return $ w

{-| Navegar entre as opções do menu inicial -}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = MenuInicial Jogar} = return $ e {menu = MenuInicial Opcoes}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = MenuInicial Opcoes} = return $ e {menu = MenuInicial Jogar}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = MenuInicial Opcoes} = return $ e {menu = MenuInicial Sair}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = MenuInicial Sair} = return $ e {menu = MenuInicial Opcoes}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = MenuInicial Jogar} = return $ e {menu = MenuInicial Sair}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = MenuInicial Sair} = return $ e {menu = MenuInicial Jogar}

{-| Acessa as opções do menu inicial -}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = MenuInicial Jogar} = return $ e {menu = ModoJogo Resumed}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = MenuInicial Opcoes} = return $ e {menu = Options Themes}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = MenuInicial Sair} = exitSuccess

{-| Caso geral -}
reageEventosMenuInicial _ e = return $ e

{-| Navegar entre as opções em "Opções" -}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = Options Themes} = return $ e {menu = Options Audio}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = Options Audio} = return $ e {menu = Options Voltar}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = Options Audio} = return $ e {menu = Options Themes}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = Options Voltar} = return $ e {menu = Options Audio}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = Options Themes} = return $ e {menu = Options Voltar}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = Options Voltar} = return $ e {menu = Options Themes}

{-| Acessa as opções em "Opções" -}
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = Options Themes} = return $ e
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = Options Audio} = return $ e
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = Options Voltar} = return $ e {menu = MenuInicial Jogar}

{- Caso geral -}
reageEventosOptions _ e = return $ e

{-| Reage a eventos no modo de jogo  -}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@Estado {menu = ModoJogo Resumed} = return $ e {menu = ModoJogo Pause}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@Estado {menu = ModoJogo Pause} = return $ e {menu = ModoJogo Resumed}

{-| Volta ao menu inicial no modo de jogo -}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {menu = ModoJogo Resumed} = return $ e {menu = MenuInicial Jogar}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {menu = ModoJogo Pause} = return $ e {menu = MenuInicial Jogar}

{-| Ativa a loja in-game -}
reageEventosModoJogo (EventKey (Char 'l') Down _ _) e@Estado {menu = ModoJogo Resumed} = return $ e {menu = ModoJogo (Loja Torre1)}

{-| Caso geral -}
reageEventosModoJogo _ e = return $ e

{- Navegação loja -}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = ModoJogo (Loja Torre1)} = return $ e {menu = ModoJogo (Loja Torre2)}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = ModoJogo (Loja Torre2)} = return $ e {menu = ModoJogo (Loja Torre3)}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = ModoJogo (Loja Torre3)} = return $ e {menu = ModoJogo (Loja Torre1)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = ModoJogo (Loja Torre1)} = return $ e {menu = ModoJogo (Loja Torre3)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = ModoJogo (Loja Torre2)} = return $ e {menu = ModoJogo (Loja Torre1)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {menu = ModoJogo (Loja Torre3)} = return $ e {menu = ModoJogo (Loja Torre2)}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = ModoJogo (Loja Torre1)} = return $ e {menu = AdicionaTorre Torre1}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = ModoJogo (Loja Torre2)} = return $ e {menu = AdicionaTorre Torre2}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {menu = ModoJogo (Loja Torre3)} = return $ e {menu = AdicionaTorre Torre3}

reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {menu = AdicionaTorre _} = return $ e {menu = ModoJogo Resumed}

{- Sai da -}
reageEventosLoja (EventKey (Char 'l') Down _ _) e@Estado {menu = ModoJogo (Loja _)} = return $ e {menu = ModoJogo Resumed}

reageEventosLoja _ e = return $ e