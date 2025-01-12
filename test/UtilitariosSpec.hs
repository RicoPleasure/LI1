module UtilitariosSpec (testesUtilitarios) where

import Test.HUnit
import LI12425
import Utils.Utilitarios
import Control.Exception (try, evaluate, SomeException)
import TData.TDataUtilitarios


testeIsValidPosNorte :: Test
testeIsValidPosNorte = TestCase $ do
  result <- try (evaluate (isValidPos (0,0) [[Relva]] Norte)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isValidPos"
    Right res ->
      assertBool "Teste isValidPos Norte" res
    
testeIsValidPosSul :: Test
testeIsValidPosSul = TestCase $ do
  result <- try (evaluate (isValidPos (0,0) [[Relva]] Sul)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isValidPos"
    Right res ->
      assertBool "Teste isValidPos Sul" res

testeIsValidPosEste :: Test
testeIsValidPosEste = TestCase $ do
  result <- try (evaluate (isValidPos (0,0) [[Relva]] Este)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isValidPos"
    Right res ->
      assertBool "Teste isValidPos Este" res

testeIsValidPosOeste :: Test
testeIsValidPosOeste = TestCase $ do
  result <- try (evaluate (isValidPos (0,0) [[Relva]] Oeste)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isValidPos"
    Right res ->
      assertBool "Teste isValidPos Oeste" res

testeIsTerraNorte :: Test
testeIsTerraNorte = TestCase $ do
  result <- try (evaluate (isTerra (5,10) mapa1 Norte)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isTerra"
    Right res ->
      assertBool "Teste isTerra" res


testeIsTerraSul :: Test
testeIsTerraSul = TestCase $ do
  result <- try (evaluate (isTerra (5,1) mapa1 Sul)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isTerra"
    Right res ->
      assertBool "Teste isTerra" res


testeIsTerraEste :: Test
testeIsTerraEste = TestCase $ do
  result <- try (evaluate (isTerra (5,10) mapa1 Este)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isTerra"
    Right res ->
      assertBool "Teste isTerra" res


testeIsTerraOeste :: Test
testeIsTerraOeste = TestCase $ do
  result <- try (evaluate (isTerra (5,10) mapa1 Oeste)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função isTerra"
    Right res ->
      assertBool "Teste isTerra" res

testeGetPositionIn :: Test
testeGetPositionIn = TestCase $ do
  result <- try (evaluate (getPosicaoMapa (1,5) mapa1)) :: IO (Either SomeException (Maybe Terreno))
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função getPositionOutOfBounds"
    Right res ->
      assertBool "Teste getPositionOutOfBounds" (res == Just Relva)

testeGetPositionOutOfBounds :: Test
testeGetPositionOutOfBounds = TestCase $ do
  result <- try (evaluate (getPosicaoMapa (99,0) mapa1)) :: IO (Either SomeException (Maybe Terreno))
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função getPositionOutOfBounds"
    Right res ->
      assertBool "Teste getPositionOutOfBounds" (res == Nothing)

testesUtilitarios :: Test
testesUtilitarios =
  TestLabel "Testes Tarefa 3" $
    test
      [
        testeIsValidPosNorte,
        testeIsValidPosSul,
        testeIsValidPosEste,
        testeIsValidPosOeste,
        testeIsTerraNorte,
        testeIsTerraSul,
        testeIsTerraEste,
        testeIsTerraOeste,
        testeGetPositionIn,
        testeGetPositionOutOfBounds
      ]
