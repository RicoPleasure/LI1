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
import Levels

{-| Função que reage ao tempo -}


{-| Função que reúne e limita os eventos que acontecem em cada "cena" do jogo -}
reageEventos :: Event -> ImmutableTowers -> IO ImmutableTowers
reageEventos tecla e@ImmutableTowers {cena = EditorDeMapas _} = reageEventosEditorDeMapas tecla e
reageEventos tecla e@ImmutableTowers {cena = MenuInicial _} = reageEventosMenuInicial tecla e
reageEventos tecla e@ImmutableTowers {cena = ModoJogo Resumed} = reageEventosModoJogo tecla e
reageEventos tecla e@ImmutableTowers {cena = ModoJogo Pause} = reageEventosModoJogo tecla e
reageEventos tecla e@ImmutableTowers {cena = Options _ } = reageEventosOptions tecla e
reageEventos tecla e@ImmutableTowers {cena = ModoJogo (Loja _)} = reageEventosLoja tecla e
reageEventos tecla e@ImmutableTowers {cena = AdicionaTorre _ _} = reageEventosAdicionaTorre tecla e
reageEventos tecla e@ImmutableTowers {cena = OpcaoJogar _} = reageEventosEscolhaDeJogo tecla e
reageEventos tecla e@ImmutableTowers {cena = SelectGameMode _} = reageEventosSelectGameMode tecla e
reageEventos tecla e@ImmutableTowers {cena = SelectLevel _} = reageEventosSelectLevel tecla e
reageEventos tecla e@ImmutableTowers {cena = LoadGame _} = reageEventosLoadGame tecla e
reageEventos tecla e@ImmutableTowers {cena = ThemesMenu _} = reageEventosThemesMenu tecla e
reageEventos tecla e@ImmutableTowers {cena = TelaFinal _} = reageEventosTelaFinal tecla e
reageEventos tecla e@ImmutableTowers {cena = SaveGame _} = reageEventosSaveGame tecla e
reageEventos _ w = return $ w


{-| 
    'reageEventosMenuInicial' reage a eventos no menu inicial do jogo.
-}
reageEventosMenuInicial :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| Navega entre as opções do menu inicial -}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = MenuInicial Jogar} = return $ e {cena = MenuInicial Opcoes}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = MenuInicial Opcoes} = return $ e {cena = MenuInicial Jogar}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = MenuInicial Opcoes} = return $ e {cena = MenuInicial Sair}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = MenuInicial Sair} = return $ e {cena = MenuInicial Opcoes}
reageEventosMenuInicial (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = MenuInicial Jogar} = return $ e {cena = MenuInicial Sair}
reageEventosMenuInicial (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = MenuInicial Sair} = return $ e {cena = MenuInicial Jogar}
{-| 
    Acessar as opções do menu inicial 
    - Jogar: Acessa a escolha de jogo
    - Opções: Acessa as opções do jogo
    - Sair: Fecha o jogo
-}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = MenuInicial Jogar} = return $ e {cena = OpcaoJogar ContinueGame}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = MenuInicial Opcoes} = return $ e {cena = Options Themes}
reageEventosMenuInicial (EventKey (SpecialKey KeyEnter) Down _ _) ImmutableTowers {cena = MenuInicial Sair} = exitSuccess
{-| Caso geral -}
reageEventosMenuInicial _ e = return $ e


{-|
    'reageEventosThemesMenu' reage a eventos no menu de seleção de temas do jogo.
-}
reageEventosThemesMenu :: Event -> ImmutableTowers -> IO ImmutableTowers
{-|
    Acessa o menu de seleção de temas. 
-}
reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = Options Themes} = return $ e {cena = ThemesMenu Tema1}
{-|  
    Navega entre os temas disponíveis
    - Theme1: Tema base
    - Theme2: Natal
    - Theme3: Noite
-}
{- reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ThemesMenu t} = return $ e {cena = proximaO t}
 -}
reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema1} = return $ e {cena = ThemesMenu Tema2}
reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema2} = return $ e {cena = ThemesMenu Tema3}
reageEventosThemesMenu (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema3} = return $ e {cena = ThemesMenu Tema1}
reageEventosThemesMenu (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema1} = return $ e {cena = ThemesMenu Tema3}
reageEventosThemesMenu (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema2} = return $ e {cena = ThemesMenu Tema1}
reageEventosThemesMenu (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema3} = return $ e {cena = ThemesMenu Tema2}
{-|
    Seleciona o tema escolhido
-}
reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema1} = return $ e {cena = MenuInicial Jogar, tema = 0}
reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema2} = return $ e {cena = MenuInicial Jogar, tema = 1}
reageEventosThemesMenu (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = ThemesMenu Tema2} = return $ e {cena = MenuInicial Jogar, tema = 2}
{-| Caso geral -}
reageEventosThemesMenu _ e = return e
{- 
proximaO :: Int -> Int
proxima n = 1 + n      
 -}

{-|
    'reageEventosEscolhaDeJogo' reage a eventos na escolha de jogo.
-}
reageEventosEscolhaDeJogo :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| 
    Navega entre as opções de escolha de jogo
    - ContinueGame: Continuar um jogo
    - NewGame: Iniciar um novo jogo
-}
reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = OpcaoJogar ContinueGame} = return $ e {cena = OpcaoJogar NewGame}
reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = OpcaoJogar NewGame} = return $ e {cena = OpcaoJogar ContinueGame}
{-|
    Seleciona o modo de jogo escolhido
-}
reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = OpcaoJogar ContinueGame} = return $ e {cena = LoadGame 1, slotSave = 1}
reageEventosEscolhaDeJogo (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = OpcaoJogar NewGame} = return $ e {cena = SelectGameMode Levels}
{-| Caso geral -}
reageEventosEscolhaDeJogo _ e = return $ e  

{-|
    'reageEventosSelectGameMode' reage a eventos na seleção de modo de jogo.
-}
reageEventosSelectGameMode :: Event -> ImmutableTowers -> IO ImmutableTowers
{-|
    Navega entre as opções de modo de jogo
    - Levels: Modo de jogo normal
    - Creator: Modo de criação de mapas
-}
reageEventosSelectGameMode (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = SelectGameMode Levels} = return $ e {cena = SelectGameMode Creator}
reageEventosSelectGameMode (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = SelectGameMode Creator} = return $ e {cena = SelectGameMode Levels}
{-|
    Seleciona o modo de jogo escolhido
-}
reageEventosSelectGameMode (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectGameMode Levels} = return $ e {cena = SelectLevel 1}
reageEventosSelectGameMode (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectGameMode Creator} = return $ e {jogo = mapaInicialEditorDeMapas , cena = EditorDeMapas (OpcaoEditorTerreno Terra)}
{-| Caso geral -}
reageEventosSelectGameMode _ e = return $ e

{-|
    'reageEventosSelectLevel' reage a eventos na seleção de níveis.  saveSlot
-}
reageEventosSelectLevel :: Event -> ImmutableTowers -> IO ImmutableTowers
{-|
    Navega entre os níveis disponíveis

    - Level1: Nível 1
    - Level2: Nível 2
    - Level3: Nível 3
    - Level4: Nível 4
    - Level5: Nível 5
-}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = SelectLevel 1} = return $ e {cena = SelectLevel 2}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = SelectLevel 2} = return $ e {cena = SelectLevel 1}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = SelectLevel 2} = return $ e {cena = SelectLevel 3}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = SelectLevel 3} = return $ e {cena = SelectLevel 2}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = SelectLevel 3} = return $ e {cena = SelectLevel 4}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = SelectLevel 4} = return $ e {cena = SelectLevel 3}
reageEventosSelectLevel (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = SelectLevel 4} = return $ e {cena = SelectLevel 5}
reageEventosSelectLevel (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = SelectLevel 5} = return $ e {cena = SelectLevel 4}

{-|
    Seleciona e carrega o nível escolhido
-}
reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectLevel 1} = return $ e {jogo = level1, cena = ModoJogo Resumed, slotSave = 1}
reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectLevel 2} = return $ e {jogo = level2, cena = ModoJogo Resumed, slotSave = 2}
reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectLevel 3} = return $ e {jogo = level3, cena = ModoJogo Resumed, slotSave = 3}
reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectLevel 4} = return $ e {jogo = level4, cena = ModoJogo Resumed, slotSave = 4}
reageEventosSelectLevel (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SelectLevel 5} = return $ e {jogo = level5, cena = ModoJogo Resumed, slotSave = 5}
{-| Caso geral -}
reageEventosSelectLevel _ e = return $ e


{-| 
    'reageEventosOptions' reage a eventos nas opções do jogo.

    - Audio: Opções de áudio
    - Themes: Opções de temas
    - Voltar: Volta ao menu inicial    
-}
reageEventosOptions :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| Navegar entre as opções em "Opções" -}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = Options Themes} = return $ e {cena = Options Audio}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = Options Audio} = return $ e {cena = Options Voltar}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = Options Audio} = return $ e {cena = Options Themes}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = Options Voltar} = return $ e {cena = Options Audio}
reageEventosOptions (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = Options Themes} = return $ e {cena = Options Voltar}
reageEventosOptions (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = Options Voltar} = return $ e {cena = Options Themes}
{-|
    Seleciona a opção escolhida
-}
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = Options Themes} = return $ e {cena = ThemesMenu Tema1}
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = Options Audio} = return $ e
reageEventosOptions (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = Options Voltar} = return $ e {cena = MenuInicial Jogar}
{- Caso geral -}
reageEventosOptions _ e = return $ e

{-|
   'reageEventosModoJogo' reage a eventos no modo de jogo.
 -}
reageEventosModoJogo :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| 
    Alterna entre o jogo a correr e o jogo pausado
 -}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@ImmutableTowers {cena = ModoJogo Resumed} = return $ e {cena = ModoJogo Pause}
reageEventosModoJogo (EventKey (Char 'p') Down _ _) e@ImmutableTowers {cena = ModoJogo Pause} = return $ e {cena = ModoJogo Resumed}
{-| 
    Sai do jogo e volta ao menu inicial
-}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = ModoJogo Resumed} = return $ e {cena = SaveGame SaveMapa}
reageEventosModoJogo (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = ModoJogo Pause} = return $ e {cena = MenuInicial Jogar}
{-|
    Acessa a loja de torres
-}
reageEventosModoJogo (EventKey (Char 'l') Down _ _) e@ImmutableTowers {cena = ModoJogo Resumed} = return $ e {cena = ModoJogo (Loja Torre1)}
reageEventosModoJogo  (EventKey (Char 'd') Down _ _) e@ImmutableTowers {cena = ModoJogo Resumed} = return $ e {cena = Debug}
reageEventosModoJogo  (EventKey (Char 'd') Down _ _) e@ImmutableTowers {cena = Debug} = return $ e {cena = ModoJogo Resumed}
{-| Caso geral-}
reageEventosModoJogo _ e = return $ e

{-| _reageEventosLoja_
    Função que reage a eventos na loja do jogo.
 -}
reageEventosLoja :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| 
    Navega entre as opções de torres disponíveis
    - Torre1: Torre 1
    - Torre2: Torre 2
    - Torre3: Torre 3
-}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre1)} = return $ e {cena = ModoJogo (Loja Torre2)}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre2)} = return $ e {cena = ModoJogo (Loja Torre3)}
reageEventosLoja (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre3)} = return $ e {cena = ModoJogo (Loja Torre1)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre1)} = return $ e {cena = ModoJogo (Loja Torre3)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre2)} = return $ e {cena = ModoJogo (Loja Torre1)}
reageEventosLoja (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre3)} = return $ e {cena = ModoJogo (Loja Torre2)}
{-| 
    Ativa a cena "AdicionaTorre" que permite que o jogador selecione o local que quer posicionar a torre 
-}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre1)} = return $ e {cena = AdicionaTorre Torre1 (4,4)}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre2)} = return $ e {cena = AdicionaTorre Torre2 (4,4)}
reageEventosLoja (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja Torre3)} = return $ e {cena = AdicionaTorre Torre3 (4,4)}
{-| 
    Sai da loja 
-}
reageEventosLoja (EventKey (Char 'l') Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja _)} = return $ e {cena = ModoJogo Resumed}
reageEventosLoja (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = ModoJogo (Loja _)} = return $ e {cena = ModoJogo Resumed}
{-| Caso geral -}
reageEventosLoja _ e = return $ e

{-| 
    'reageEventosAdicionaTorre' reage a eventos na cena "AdicionaTorre".
-}
reageEventosAdicionaTorre :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| 
    Navega entre as posições disponíveis para posicionar a torre 
-}
reageEventosAdicionaTorre (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = AdicionaTorre torre (x, y)}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo e)) = return $ e {cena = AdicionaTorre torre (x,y + 1)}
    | otherwise = return $ e
reageEventosAdicionaTorre (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = AdicionaTorre torre (x, y)}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo e)) = return $ e {cena = AdicionaTorre torre (x,y - 1)}
    | otherwise = return $ e
reageEventosAdicionaTorre (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = AdicionaTorre torre (x, y)} 
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = AdicionaTorre torre (x+1,y)}
    | otherwise = return $ e
reageEventosAdicionaTorre (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = AdicionaTorre torre (x, y)} 
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = AdicionaTorre torre (x-1,y)}
    | otherwise = return $ e
{-| 
    Compra a torre, adiciona-a ao jogo e subtrai o custo da torre aos créditos da base 
-}
reageEventosAdicionaTorre (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = AdicionaTorre torre (x, y), jogo = jogo} 
    | adicionaTorreValida (fromIntegral x, fromIntegral y) (mapaJogo jogo) newTorres creditos custo = return $ e { 
                cena = ModoJogo Resumed,
                jogo = Jogo {
                    torresJogo = newTorres,
                    baseJogo = (baseJogo jogo) { creditosBase = creditos - custo },
                    mapaJogo = mapaJogo jogo,
                    portaisJogo = portaisJogo jogo,
                    inimigosJogo = inimigosJogo jogo,
                    lojaJogo = lojaJogo jogo
                } 
 
            }
    | otherwise = return $ e
    where
        newTorres = insereTorreNaLista (torresJogo jogo) (fromIntegral x, fromIntegral y) (projetilNovaTorre torre)
        creditos = creditosBase (baseJogo jogo)
        custo = custoTorre torre
{-| 
    Sai da cena "AdicionaTorre" e volta à loja
-}
reageEventosAdicionaTorre (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = AdicionaTorre torre _} = return $ e {cena = ModoJogo (Loja torre)} 
{-| Caso geral -}
reageEventosAdicionaTorre _ e = return $ e


{-|
    'reageEventosEditorDeMapas' reage a eventos no editor de mapas.
-}
reageEventosEditorDeMapas :: Event -> ImmutableTowers -> IO ImmutableTowers
{-| 
    Navega entre as opções disponíveis no editor de mapas
    - Terra: Adiciona terreno de terra
    - Relva: Adiciona terreno de relva
    - Agua: Adiciona terreno de água
    - Torre1: Adiciona torre 1
    - Torre2: Adiciona torre 2
    - Torre3: Adiciona torre 3
    - Base: Adiciona base
    - Portal: Adiciona portal
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Terra)} = return $ e {cena = EditorDeMapas (OpcaoEditorTerreno Relva)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Relva)} = return $ e {cena = EditorDeMapas (OpcaoEditorTerreno Agua)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Agua)} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre Torre1)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre1)} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre Torre2)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre2)} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre Torre3)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre3)} = return $ e {cena = EditorDeMapas OpcaoEditorBase}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas OpcaoEditorBase} = return $ e {cena = EditorDeMapas OpcaoEditorPortal}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas OpcaoEditorPortal} = return $ e {cena = EditorDeMapas (OpcaoEditorTerreno Terra)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Terra)} = return $ e {cena = EditorDeMapas OpcaoEditorPortal}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas OpcaoEditorPortal} = return $ e {cena = EditorDeMapas OpcaoEditorBase}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas OpcaoEditorBase} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre Torre3)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre3)} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre Torre2)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre2)} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre Torre1)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre Torre1)} = return $ e {cena = EditorDeMapas (OpcaoEditorTerreno Agua)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Agua)} = return $ e {cena = EditorDeMapas (OpcaoEditorTerreno Relva)}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno Relva)} = return $ e {cena = EditorDeMapas (OpcaoEditorTerreno Terra), slotSave = 6}

{-|
   Seleciona o TERRENO escolhido
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno terreno)} = return $ e {cena = EditorDeMapas (AdicionaTerreno terreno (4,4))}

{-|
    Navega entre as posições disponíveis para adicionar o terreno
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTerreno terreno (x,y))} 
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTerreno terreno (x, y+1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTerreno terreno (x,y))} 
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTerreno terreno (x, y-1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTerreno terreno (x,y))} 
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTerreno terreno (x+1, y))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTerreno terreno (x,y))} 
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTerreno terreno (x-1, y))}
    | otherwise = return $ e

{-|
    Efetua a adição do terreno na posição escolhida
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTerreno terreno (x,y)), jogo = jogo} = return $  ImmutableTowers {
        cena = EditorDeMapas (OpcaoEditorTerreno terreno), 
        jogo = jogo {
            mapaJogo = insereTerrenoNaPosicao (mapaJogo jogo) (x,y) terreno
        },
        tema = tema e,
        slotSave = slotSave e
    }

{-|
    Seleciona a TORRE escolhida
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTorre torre)} = return $ e {cena = EditorDeMapas (AdicionaTorreEditor torre (4,4))}

{-|
    Navega entre as posições disponíveis para adicionar a torre
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor torre (x,y))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTorreEditor torre (x, y+1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor torre (x,y))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTorreEditor torre (x, y-1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor torre (x,y))}
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTorreEditor torre (x+1, y))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor torre (x,y))}
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaTorreEditor torre (x-1, y))}
    | otherwise = return $ e

{-|
    Sai do modo de seleção de posição da torre
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor torre (x,y))} = return $ e {cena = EditorDeMapas (OpcaoEditorTorre torre)}

{-|
    Adiciona a torre escolhida na posição escolhida
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaTorreEditor torre (x, y)), jogo = jogo}
    | isValidTower (fromIntegral x, fromIntegral y) (mapaJogo jogo) newTorres = return $ e { 
        cena = EditorDeMapas (OpcaoEditorTorre torre),
        jogo = jogo { 
            torresJogo = newTorres
        }}
    | otherwise = return $ e
    where
        newTorres = insereTorreNaLista (torresJogo jogo) (fromIntegral x, fromIntegral y) (projetilNovaTorre torre)

{-|
    Seleciona a opção BASE
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas OpcaoEditorBase} = return $ e {cena = EditorDeMapas (AdicionaBase (4,4))}

{-|
    Navega entre as posições disponíveis para adicionar a base
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaBase (x,y))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaBase (x,y+1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaBase (x,y))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaBase (x,y-1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaBase (x,y))}
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaBase (x+1, y))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaBase (x,y))}
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaBase (x-1, y))}
    | otherwise = return $ e
{-|
    Adiciona a base na posição escolhida
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaBase (x,y)),jogo = jogo} 
    | validaBase (mapaJogo jogo) (fromIntegral x, fromIntegral y) (creditosBase newBase) = return $ e { 
        cena = EditorDeMapas (OpcaoEditorBase),
       jogo = jogo { 
            baseJogo = newBase
        }
    }
    | otherwise = return $ e
    where
        newBase = Base { posicaoBase = (fromIntegral x, fromIntegral y), vidaBase = 100, creditosBase = 100 }

reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaBase _)} = return $ e {cena = EditorDeMapas OpcaoEditorBase}

{-|
    Seleciona a opção PORTAL
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas OpcaoEditorPortal} = return $ e {cena = EditorDeMapas (AdicionaPortal (4,4))}
{-|
    Navega entre as posições disponíveis para adicionar o portal
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaPortal (x,y))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y+1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaPortal (x,y+1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaPortal (x,y))}
    | validaPosicaoObjeto (fromIntegral x,fromIntegral y-1) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaPortal (x,y-1))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaPortal (x,y))}
    | validaPosicaoObjeto (fromIntegral x+1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaPortal (x+1, y))}
    | otherwise = return $ e
reageEventosEditorDeMapas (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaPortal (x,y))}
    | validaPosicaoObjeto (fromIntegral x-1,fromIntegral y) (mapaJogo (jogo e)) = return $ e {cena = EditorDeMapas (AdicionaPortal (x-1, y))}
    | otherwise = return $ e
{-|
    Adiciona o portal na posição escolhida
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaPortal (x,y)), jogo = jogo}
    | validaPortalEditor (x,y) (mapaJogo jogo) = return $ e { 
        cena = EditorDeMapas (OpcaoEditorPortal),
       jogo = jogo {
            portaisJogo = novosPortaisJogo
        }
    }
    | otherwise = return $ e
    where
        novosPortaisJogo = inserePortalNaLista (portaisJogo jogo) (fromIntegral x, fromIntegral y)
{-|
    Sai do modo de seleção de posição do portal
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (AdicionaPortal _)} = return $ e {cena = EditorDeMapas OpcaoEditorPortal}

{-|
    Vai para a cena de salvar o mapa
-}
reageEventosEditorDeMapas (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = EditorDeMapas (OpcaoEditorTerreno _) } = return $ e {cena = SaveGame SaveMapa}

reageEventosEditorDeMapas _ e = return $ e

{-|
    Reage a eventos na tela final do jogo.
-}

reageEventosTelaFinal :: Event -> ImmutableTowers -> IO ImmutableTowers

{-|
    Navega entre os casos de vitória
-}
reageEventosTelaFinal (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = TelaFinal (Vitoria MenuVitoria)} = return $ e {cena = TelaFinal (Vitoria NextLevel)}
reageEventosTelaFinal (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = TelaFinal (Vitoria NextLevel)} = return $ e {cena = TelaFinal (Vitoria MenuVitoria)}

{-|
    Navega entre os casos de derrota 
-}
reageEventosTelaFinal (EventKey (SpecialKey KeyRight) Down _ _) e@ImmutableTowers {cena = TelaFinal (Derrota MenuDerrota)} = return $ e {cena = TelaFinal (Derrota TentarNovamente)}
reageEventosTelaFinal (EventKey (SpecialKey KeyLeft) Down _ _) e@ImmutableTowers {cena = TelaFinal (Derrota TentarNovamente)} = return $ e {cena = TelaFinal (Derrota MenuDerrota)}


{-|
    Acessa os casos de vitória
-}
reageEventosTelaFinal (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = TelaFinal (Vitoria MenuVitoria)} = return $ e {cena = MenuInicial Jogar}
reageEventosTelaFinal (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = TelaFinal (Vitoria NextLevel)} = return $ e {jogo = level2 , cena = ModoJogo Resumed}

{-|
    Acessa os casos de derrota
-}
reageEventosTelaFinal (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = TelaFinal (Derrota MenuDerrota)} = return $ e {cena = MenuInicial Jogar}
reageEventosTelaFinal (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = TelaFinal (Derrota TentarNovamente)} = return $ e {jogo = level1 ,cena =  ModoJogo Resumed}

reageEventosTelaFinal _ e = return $ e

{-|
    'reageEventosMenuInicial' reage a eventos na tela de carregamento de jogo.
-}
reageEventosLoadGame :: Event -> ImmutableTowers -> IO ImmutableTowers

reageEventosLoadGame (EventKey (SpecialKey KeyUp) Down _ _) e@(ImmutableTowers {cena = LoadGame t, slotSave = slot}) =
    return $ e { cena = LoadGame (max 1 (t - 1)), slotSave = max 0 (slot - 1)}

reageEventosLoadGame (EventKey (SpecialKey KeyDown) Down _ _) e@(ImmutableTowers {cena = LoadGame t}) = do
    games <- listGames
    return $ e { cena = LoadGame (min (length games) (t + 1)), slotSave = t + 1}

reageEventosLoadGame (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = LoadGame save, slotSave = slot} = do
    games <- listGames
    if null games
        then return $ e {cena = MenuInicial Jogar}
        else if save < 0 || save > length games
            then do
                putStrLn "Slot inválido"
                return $ e {cena = MenuInicial Jogar}
            else do
                game <- loadGame save
                return $ e {jogo = game, cena = ModoJogo Resumed, slotSave = save}

reageEventosLoadGame (EventKey (SpecialKey KeyEsc) Down _ _) e@ImmutableTowers {cena = LoadGame _} = return $ e {cena = MenuInicial Jogar}

reageEventosLoadGame _ e = return $ e


reageEventosSaveGame :: Event -> ImmutableTowers -> IO ImmutableTowers

reageEventosSaveGame (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SaveGame SaveMapa, slotSave = slot} = do
    saveGame slot (jogo e)
    games <- listGames
    return $ e {cena = MenuInicial Jogar}
reageEventosSaveGame (EventKey (SpecialKey KeyEnter) Down _ _) e@ImmutableTowers {cena = SaveGame NoSaveMapa} = return $ e {cena = MenuInicial Jogar}

reageEventosSaveGame (EventKey (SpecialKey KeyDown) Down _ _) e@ImmutableTowers {cena = SaveGame SaveMapa} = return $ e {cena = SaveGame NoSaveMapa}
reageEventosSaveGame (EventKey (SpecialKey KeyUp) Down _ _) e@ImmutableTowers {cena = SaveGame NoSaveMapa} = return $ e {cena = SaveGame SaveMapa}

reageEventosSaveGame _ e = return $ e