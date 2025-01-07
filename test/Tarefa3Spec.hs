module Tarefa3Spec (testesTarefa3) where

import Test.HUnit
import TData.TDataTarefa3
import Tarefa3
import LI12425
import Control.Exception (try, evaluate, SomeException)

testAtualizaPortais :: Test
testAtualizaPortais = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jTest1)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaPortais"
    Right (Jogo {portaisJogo = (p:ps), inimigosJogo = is}) ->
      assertBool "Test Onda ativa ativa Inimigo."
                 (null (inimigosOnda (head (ondasPortal p))) && not (null is) && (tempoOnda (head (ondasPortal p)) == 15))

testAtualizaMultipleOndas:: Test
testAtualizaMultipleOndas = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jTestMultipleOndas)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaMultipleOndas"
    Right (Jogo {portaisJogo = (p:ps), inimigosJogo = is}) ->
      assertBool "Test Onda ativa ativa vários inimigos."
                 (length (inimigosOnda (head (ondasPortal p))) == 1 && length is == 1)

testAtualizaPortaisTempoOndaNotOver :: Test
testAtualizaPortaisTempoOndaNotOver = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jTestTempoOndaNotOver)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaPortaisTempoOndaNotOver"
    Right (Jogo {portaisJogo = (p:ps), inimigosJogo = is}) ->
      assertBool "Test Onda ativa, tempoOnda > 0, não ativa Inimigo."
                 (not (null (inimigosOnda (head (ondasPortal p)))) && null is && (tempoOnda (head (ondasPortal p)) == 14))

testAtualizaPortaisEntradaOndaNotOver :: Test
testAtualizaPortaisEntradaOndaNotOver = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jTestEntradaOndaNotOver)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaPortaisEntradaOndaNotOver"
    Right (Jogo {portaisJogo = (p:ps), inimigosJogo = is}) ->
      assertBool "Test Onda ativa, entrada > 0, não ativa Inimigo."
                 (not (null (inimigosOnda (head (ondasPortal p)))) && null is && (tempoOnda (head (ondasPortal p)) == 15) && (entradaOnda (head (ondasPortal p)) == 1))

testAtualizaMultiplePortais :: Test
testAtualizaMultiplePortais = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jTestAtualizaMultiplePortais)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaMultiplePortais"
    Right (Jogo {portaisJogo = ps}) ->
      assertBool "Test atualiza vários portais."
                 (length ps == 2)

testesTarefa3 :: Test
testesTarefa3 =
  TestLabel "Testes Tarefa 3" $
    test
      [ testAtualizaPortais,
        testAtualizaPortaisEntradaOndaNotOver,
        testAtualizaPortaisTempoOndaNotOver,
        testAtualizaMultiplePortais,
        testAtualizaMultipleOndas
      ]
