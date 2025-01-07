module Eventos where

import Graphics.Gloss.Interface.Pure.Game
import Desenhar
import ImmutableTowers
import System.Exit (exitSuccess)
import LI12425
import Utils.UtilitariosTorre
import Utils.Utilitarios
import Utils.UtilitariosBase
import Utils.UtilitariosEditor
import Utils.UtilitariosPortal
import Levels
import Graphics.Gloss.Juicy

{-| Função que reage ao tempo -}


{-| Função que reúne e limita os eventos que acontecem em cada "cena" do jogo -}
reageEventos :: Event -> Estado -> IO Estado
reageEventos tecla e@Estado {cena = EditorDeMapas _} = reageEventosEditorDeMapas tecla e
reageEventos tecla e@Estado {cena = MenuInicial _} = reageEventosMenuInicial tecla e
reageEventos tecla e@Estado {cena = ModoJogo Resumed} = reageEventosModoJogo tecla e
reageEventos tecla e@Estado {cena = ModoJogo Pause} = reageEventosModoJogo tecla e
reageEventos tecla e@Estado {cena = Options _ } = reageEventosOptions tecla e
reageEventos tecla e@Estado {cena = ModoJogo (Loja _)} = reageEventosLoja tecla e
reageEventos tecla e@Estado {cena = AdicionaTorre _ _} = reageEventosAdicionaTorre tecla e
reageEventos tecla e@Estado {cena = OpcaoJogar _} = reageEventosEscolhaDeJogo tecla e
reageEventos tecla e@Estado {cena = SelectGameMode _} = reageEventosSelectGameMode tecla e
reageEventos tecla e@Estado {cena = SelectLevel _} = reageEventosSelectLevel tecla e
reageEventos tecla e@Estado {cena = LoadGame _} = reageEventosLoadGame tecla e
reageEventos tecla e@Estado {cena = ThemesMenu _} = reageEventosThemesMenu tecla e
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
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = MenuInicial Jogar} = return $ e {cena = OpcaoJogar ContinueGame}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = MenuInicial Opcoes} = return $ e {cena = Options Themes}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = MenuInicial Sair} = exitSuccess
{-| Caso geral de "reageEventosMenuInicial" -}
reageEventosMenuInicial _ e = return $ e


{-| Mudar temas -}

reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = Options Themes} = return $ e {cena = ThemesMenu Theme1}

reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = ThemesMenu Theme1} = return $ e {cena = ThemesMenu Theme2}
reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = ThemesMenu Theme2} = return $ e {cena = ThemesMenu Theme3}
reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = ThemesMenu Theme3} = return $ e {cena = ThemesMenu Theme1}

reageEventosThemesMenu (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = ThemesMenu Theme1} = return $ e {cena = ThemesMenu Theme3}
reageEventosThemesMenu (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = ThemesMenu Theme2} = return $ e {cena = ThemesMenu Theme1}
reageEventosThemesMenu (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = ThemesMenu Theme3} = return $ e {cena = ThemesMenu Theme2}


reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = ThemesMenu Theme1} = return $ e {cena = MenuInicial Jogar, tema = 0}

reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = ThemesMenu Theme2} = return $ e {cena = MenuInicial Jogar, tema = 1}

reageEventosThemesMenu _ e = return e


{- OPTION CONINUE OR NEWGAME -}

reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = OpcaoJogar ContinueGame} = return $ e {cena = OpcaoJogar NewGame}
reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = OpcaoJogar NewGame} = return $ e {cena = OpcaoJogar ContinueGame}

reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = OpcaoJogar ContinueGame} = return $ e {cena = LoadGame 1}
reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = OpcaoJogar NewGame} = return $ e {cena = SelectGameMode Levels}

reageEventosEscolhaDeJogo _ e = return $ e

{- SELECT GAME MODE -}

reageEventosSelectGameMode (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = SelectGameMode Levels} = return $ e {cena = SelectGameMode Creator}
reageEventosSelectGameMode (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = SelectGameMode Creator} = return $ e {cena = SelectGameMode Levels}

reageEventosSelectGameMode (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectGameMode Levels} = return $ e {cena = SelectLevel Level1}
reageEventosSelectGameMode (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectGameMode Creator} = return $ e {immutableTowers = ImmutableTowers (mapaInicialEditorDeMapas) , cena = EditorDeMapas (Editor (OpcaoEditorTerreno Terra))}

reageEventosSelectGameMode _ e = return $ e

{- SELECT LEVEL -}

reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = SelectLevel Level1} = return $ e {cena = SelectLevel Level2}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) own _ _) e@Estado {cena = SelectLevel Level2} = return $ e {cena = SelectLevel Level1}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = SelectLevel Level2} = return $ e {cena = SelectLevel Level3}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = SelectLevel Level3} = return $ e {cena = SelectLevel Level2}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = SelectLevel Level3} = return $ e {cena = SelectLevel Level4}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = SelectLevel Level4} = return $ e {cena = SelectLevel Level3}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = SelectLevel Level4} = return $ e {cena = SelectLevel Level5}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = SelectLevel Level5} = return $ e {cena = SelectLevel Level4}

{- LOAD LEVELS -}

reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectLevel Level1} = return $ e {immutableTowers = ImmutableTowers (level1), cena = ModoJogo Resumed}

reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectLevel Level2} = return $ e {immutableTowers = ImmutableTowers (level2), cena = ModoJogo Resumed}

reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectLevel Level3} = return $ e {immutableTowers = ImmutableTowers (level3), cena = ModoJogo Resumed}

reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectLevel Level4} = return $ e {immutableTowers = ImmutableTowers (level4), cena = ModoJogo Resumed}

reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = SelectLevel Level5} = return $ e {immutableTowers = ImmutableTowers (level5), cena = ModoJogo Resumed}


reageEventosSelectLevel _ e = return $ e


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
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = Options Themes} = return $ e {cena = ThemesMenu Theme1}
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
reageEventosModoJogo  (EventKey (Char 'd') Down _ _) e@Estado {cena = ModoJogo Resumed} = return $ e {cena = Debug}
reageEventosModoJogo  (EventKey (Char 'd') Down _ _) e@Estado {cena = Debug} = return $ e {cena = ModoJogo Resumed}
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
reageEventosAdicionaTorre (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = AdicionaTorre t _} = return $ e {cena = ModoJogo (Loja t)} 
{-| Caso geral de "reageEventosAdicionaTorre" -}
reageEventosAdicionaTorre _ e = return $ e


{- reageEventosEditorDeMapas 

    THIS IS WHERE THE KIDS ARE SEPARATED FROM THE MANS
 -}

{- Navegação das opções do editor -}
{- Descer -}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Terra))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Relva))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Relva))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Agua))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Agua))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre1))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre1))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre2))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre2))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre3))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre3))} = return $ e {cena = EditorDeMapas (Editor OpcaoEditorBase)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor OpcaoEditorBase)} = return $ e {cena = EditorDeMapas (Editor OpcaoEditorPortal)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor OpcaoEditorPortal)} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Terra))}

{- Subir -}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Terra))} = return $ e {cena = EditorDeMapas (Editor OpcaoEditorPortal)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor OpcaoEditorPortal)} = return $ e {cena = EditorDeMapas (Editor OpcaoEditorBase)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor OpcaoEditorBase)} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre3))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre3))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre2))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre2))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre1))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre Torre1))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Agua))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Agua))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Relva))}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Relva))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTerreno Terra))}

{-| COMANDOS EDITOR ADICIONA TERRA -}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno t))} = return $ e {cena = EditorDeMapas (Editor (AdicionaTerreno t (4,4)))}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTerreno t (x,y)))} 
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTerreno t (x, y+1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTerreno t (x,y)))} 
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTerreno t (x, y-1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTerreno t (x,y)))} 
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTerreno t (x+1, y)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTerreno t (x,y)))} 
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTerreno t (x-1, y)))}
    | otherwise = return $ e

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTerreno t (x,y))), immutableTowers = ImmutableTowers { jogo = jogo }} = return $ e { 
    cena = EditorDeMapas (Editor (OpcaoEditorTerreno t)),
    immutableTowers = ImmutableTowers {
        jogo = jogo { 
            mapaJogo = insereTerrenoNaPosicao (mapaJogo jogo) (x,y) t
        }
    }
}

{-| COMANDOS PARA ADICIONAR TORRES -}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTorre t))} = return $ e {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (4,4)))}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x,y)))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x, y+1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x,y)))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x, y-1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x,y)))}
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x+1, y)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x,y)))}
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x-1, y)))}
    | otherwise = return $ e

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t _))} = return $ e {cena = EditorDeMapas (Editor (OpcaoEditorTorre t))}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaTorreEditor t (x, y))), immutableTowers = ImmutableTowers { jogo = jogo }} 
    | isValidTower (fromIntegral x, fromIntegral y) (mapaJogo jogo) newTorres = return $ e { 
        cena = EditorDeMapas (Editor (OpcaoEditorTorre t)),
        immutableTowers = ImmutableTowers {
            jogo = jogo { 
                torresJogo = newTorres
            }
        }
    }
    | otherwise = return $ e
    where
        newTorres = insereTorreNaLista (torresJogo jogo) (fromIntegral x, fromIntegral y) (projetilNovaTorre t)

{-| COMANDOS PARA ADICIONAR BASE -}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor OpcaoEditorBase)} = return $ e {cena = EditorDeMapas (Editor (AdicionaBase (4,4)))}  

reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaBase (x,y)))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaBase (x, y+1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaBase (x,y)))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaBase (x, y-1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaBase (x,y)))}
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaBase (x+1, y)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaBase (x,y)))}
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaBase (x-1, y)))}
    | otherwise = return $ e

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaBase (x, y))), immutableTowers = ImmutableTowers { jogo = jogo }} 
    | validaBase (mapaJogo jogo) (fromIntegral x, fromIntegral y) (creditosBase newBase) = return $ e { 
        cena = EditorDeMapas (Editor (OpcaoEditorBase)),
        immutableTowers = ImmutableTowers {
            jogo = jogo { 
                baseJogo = newBase
            }
        }
    }
    | otherwise = return $ e
    where
        newBase = Base { posicaoBase = (fromIntegral x, fromIntegral y), vidaBase = 100, creditosBase = 100 }

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaBase _))} = return $ e {cena = EditorDeMapas (Editor OpcaoEditorBase)}

{-| COMANDOS PARA ADICIONAR PORTAL -}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor OpcaoEditorPortal)} = return $ e {cena = EditorDeMapas (Editor (AdicionaPortal (4,4)))}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaPortal (x,y)))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaPortal (x, y+1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaPortal (x,y)))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaPortal (x, y-1)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaPortal (x,y)))}
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaPortal (x+1, y)))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaPortal (x,y)))}
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo (immutableTowers e))) = return $ e {cena = EditorDeMapas (Editor (AdicionaPortal (x-1, y)))}
    | otherwise = return $ e

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaPortal (x, y))), immutableTowers = ImmutableTowers { jogo = jogo }}
    | validaPortalEditor (x,y) (mapaJogo jogo) = return $ e { 
        cena = EditorDeMapas (Editor (OpcaoEditorPortal)),
        immutableTowers = ImmutableTowers {
            jogo = jogo { 
                portaisJogo = novosPortaisJogo
            }
        }
    }
    | otherwise = return $ e
    where
        novosPortaisJogo = inserePortalNaLista (portaisJogo jogo) (fromIntegral x, fromIntegral y)

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = EditorDeMapas (Editor (AdicionaPortal _))} = return $ e {cena = EditorDeMapas (Editor OpcaoEditorPortal)}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@Estado {cena = EditorDeMapas (Editor (OpcaoEditorTerreno _)) } = return $ e {cena = EditorDeMapas (QuitEditor SaveMapa)}

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = EditorDeMapas (QuitEditor SaveMapa)} = do
    saveGame (jogo (immutableTowers e))
    return $ e {cena = MenuInicial Jogar}

reageEventosEditorDeMapas _ e = return $ e

{-| COMANDOS PARA SALVAR MAPA -}

{-| Caso geral de "reageEventosEditorDeMapas" -}

reageEventosLoadGame (EventKey (SpecialKey KeyEnter) Down _ _) e@Estado {cena = LoadGame t} = do
    game <- loadGame t
    return $ e {immutableTowers = ImmutableTowers game, cena = ModoJogo Resumed}
    

reageEventosLoadGame _ e = return $ e