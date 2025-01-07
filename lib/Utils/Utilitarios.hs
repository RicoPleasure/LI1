{-|
Module      : Utils.Utilitarios
Description : Coleção de funções utilitarias geralmente aplicáveis.
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com os diversos objetos presentes neste jogo.
-}
module Utils.Utilitarios where

import LI12425

data TipoTorre = Torre1
               | Torre2 
               | Torre3 

data OpcaoMenuInicial = Jogar 
                      | Opcoes 
                      | Sair

data OpcaoContinueNew = ContinueGame
                  | NewGame

data SelectGameMode = Levels
              | Creator

data SelectLevel = Level1
                 | Level2
                 | Level3
                 | Level4
                 | Level5

data EditorDeMapas = Editor EstadoEditor
                  | QuitEditor OpcaoSaveMap

data OpcaoSaveMap = SaveMapa | NoSaveMapa

data EstadoEditor = OpcaoEditorTerreno Terreno
                  | OpcaoEditorTorre TipoTorre
                  | OpcaoEditorBase
                  | OpcaoEditorPortal
                  | AdicionaTerreno Terreno (Int,Int)
                  | AdicionaTorreEditor TipoTorre (Int,Int)
                  | AdicionaBase (Int,Int)
                  | AdicionaPortal (Int,Int)


data OpcaoModoJogo = Resumed 
                   | Pause 
                   | Loja TipoTorre

data Config = Themes
            | Audio
            | Voltar
          
data Themes = Theme1
            | Theme2
            | Theme3

data Cena = MenuInicial OpcaoMenuInicial
          | OpcaoJogar OpcaoContinueNew
          | SelectGameMode SelectGameMode
          | SelectLevel SelectLevel
          | Options Config 
          | ThemesMenu Themes
          | EditorDeMapas EditorDeMapas
          | ModoJogo OpcaoModoJogo 
          | AdicionaTorre TipoTorre (Int,Int)
          | Debug
          | LoadGame Int

type SpritePaths = [[String]]

{-|
  A função utilitária 'verificaDuplosPos' verifica se numa lista de 'Posicao' existem elementos repetidos.

  ==__Exemplos de utilização__
  >>> verificaDuplosPos []
  False
  >>> verificaDuplosPos [(0,0), (1,2), (-1, 3)]
  False
  >>> verificaDuplosPos [(0,0), (1,2), (-1, 3), (0,0)]
  True
-}
verificaDuplosPos :: [Posicao] -> Bool
verificaDuplosPos [] = False
verificaDuplosPos (x:xs) = x `elem` xs || verificaDuplosPos xs

{-|
  A função 'validaPosicaoObjeto' valida se uma dada 'Posicao' se encontra dentro dos limites do 'Mapa'.

  ==__Exemplos de utilização__
  >>> validaPosicaoObjeto (-1, -1) [[Terra, Terra, Relva, Agua]]
  False
  >>> validaPosicaoObjeto (1, 1) [[Terra, Terra, Relva, Agua]]
  False
  >>> validaPosicaoObjeto (1, 0) [[Terra, Terra, Relva, Agua]]
  True
-}
validaPosicaoObjeto :: Posicao -> Mapa -> Bool
validaPosicaoObjeto (x,y) mapa = 
  x >= 0 && x < fromIntegral (length (head mapa)) && y >= 0 && y < fromIntegral (length mapa)

{-|
  A função 'checkPositionTerra' verifica se o bloco de uma dada 'Posicao' do 'Mapa' é do tipo 'Terra'

  ==__Exemplos de utilização__
  >>> checkPositionTerra (0,0) [[Terra]]
  True
  >>> checkPositionTerra (0,0) [[Relva]]
  False
-}
checkPositionTerra :: Posicao -> Mapa -> Bool
checkPositionTerra (x,y) m = validaPosicaoObjeto (x,y) m && m !! floor y !! floor x == Terra

{-|
  A função 'checkPositionRelva' verifica se o bloco de uma dada 'Posicao' do 'Mapa' é do tipo 'Relva'

  ==__Exemplos de utilização__
  >>> checkPositionRelva (0,0) [[Terra]]
  False
  >>> checkPositionRelva (0,0) [[Relva]]
  True
-}
checkPositionRelva :: Posicao -> Mapa -> Bool
checkPositionRelva (x,y) m = validaPosicaoObjeto (x,y) m && m !! floor y !! floor x == Relva

{-|
  A função 'extractValueFromMaybe' é responsável por extrair um valor de um maybe, caso esse exista.

  ==__Exemplos de utilização__
  >>> extractValueFromMaybe (Maybe 1)
  1
-}
extractValueFromMaybe :: Maybe a -> a
extractValueFromMaybe Nothing = error "No value found in maybe"
extractValueFromMaybe (Just a) = a