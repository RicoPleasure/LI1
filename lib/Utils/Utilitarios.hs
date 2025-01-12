{-|
Module      : Utils.Utilitarios
Description : Coleção de funções utilitarias geralmente aplicáveis.
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com os diversos objetos presentes neste jogo.
-}
module Utils.Utilitarios where

import LI12425

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

{-|
  A função 'isValidPos' verifica se uma 'Posicao' é válida num 'Mapa' com uma determinada 'Direcao'.

  ==__Exemplos de utilização__
  >>> isValidPos (0,0) [] Norte
  False
  >>> isValidPos (0,0) [] Norte
  False
-}
isValidPos :: Posicao -> Mapa -> Direcao -> Bool
isValidPos (x, y) mapa dir =
    let (col, row) = adjustPosition x y dir
    in row >= 0 && row < length mapa && 
       col >= 0 && col < length (head mapa)

{-|
  A função 'isTerra' verifica se uma 'Posicao' é terra num 'Mapa' com uma determinada 'Direcao'.

  ==__Exemplos de utilização__
  >>> isTerra (0,0) [] Norte
  False
  >>> isTerra (0,0) [] Norte
  False
-}
isTerra :: Posicao -> Mapa -> Direcao -> Bool
isTerra (x, y) mapa dir = 
    case getPosicaoMapa (adjustPosition x y dir) mapa of
        Just Terra -> True
        _          -> False
        
{-|
  A função 'adjustPosition' ajusta a posição de um 'Inimigo' com base na sua 'Direcao'.

  ==__Exemplos de utilização__
  >>> adjustPosition 0 0 Norte
  (0,0)
  >>> adjustPosition 0 0 Norte
  (0,0)
-}
adjustPosition :: Float -> Float -> Direcao -> (Int, Int)
adjustPosition x y dir = case dir of
    Norte -> (floor x, floor y)
    Sul   -> (ceiling x, ceiling y)
    Este  -> (ceiling x, floor y)
    Oeste -> (floor x, floor y)

{-|
  A função 'getPosicaoMapa' devolve o 'Terreno' de uma determinada 'Posicao' num 'Mapa'.

  ==__Exemplos de utilização__
  >>> getPosicaoMapa (0,0) []
  Nothing
  >>> getPosicaoMapa (0,0) []
  Nothing
-}
getPosicaoMapa :: (Int, Int) -- ^ Posição
               -> Mapa -- ^ Mapa
               -> Maybe Terreno -- ^ Terreno
getPosicaoMapa (x, y) mapa
    | x >= 0 && y >= 0 && y < length mapa && x < length (head mapa) = Just ((mapa !! y) !! x)
    | otherwise = Nothing
