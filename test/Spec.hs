module Main (main) where

import Test.HUnit

import LI12425
import Tarefa1Spec
import Tarefa2Spec
import Tarefa3Spec
import Control.Exception (SomeException, evaluate, try, displayException)
import Data.List (isInfixOf)


testMultError :: Test
testMultError = TestCase $ do
  result <- try (evaluate (multDuracao Infinita Infinita)) :: IO (Either SomeException Duracao)
  case result of
    Left ex ->
      assertBool "Erro em caso de multiplicação de dois valores infinitos"
                 ("Illegal operation performed" `isInfixOf` displayException ex)
    Right _ -> assertFailure "Não foi retornado um erro como era espectável no caso da multiplicação de dois valores infinitos"

testSuite :: Test
testSuite =
  TestLabel "Testes Funções adicionais módulo LI12425" $
    test
      [ "Soma duracao 2 infinitos" ~: Infinita ~=? addDuracao Infinita Infinita,
        "Soma duracao 1 infinito" ~: Infinita ~=? addDuracao (Finita 5) Infinita,
        "Soma duracao finitos" ~: Finita 10 ~=? addDuracao (Finita 5) (Finita 5),
        "Multiplica duracao finitos" ~: Finita 10.0 ~=? multDuracao (Finita 2) (Finita 5),
        "Multiplica duracao 1 infinito" ~: Infinita ~=? multDuracao (Finita 2) Infinita,
        "Multiplica duracao 1 infinito (1º argumento)" ~: Infinita ~=? multDuracao Infinita (Finita 2),
        "Valor absoluto duracao infinita" ~: Infinita ~=? absDuracao Infinita,
        "Valor absoluto duracao finita" ~: Finita 5.0 ~=? absDuracao (Finita (-5)),
        "Sinal de duracao finita neg" ~: (-1) ~=? signumDuracao (Finita (-5)),
        "Sinal de duracao finita zero" ~: 0 ~=? signumDuracao (Finita 0),
        "Sinal de duracao finita pos" ~: 1 ~=? signumDuracao (Finita 5),
        "Sinal de duracao infinita" ~: 1 ~=? signumDuracao Infinita,
        "Conversão Int para Duracao" ~: Finita 5.0 ~=? fromIntegerDuracao 5,
        "Negacao duracao infinita" ~: Infinita ~=? negateDuracao Infinita,
        "Negacao duracao finita" ~: Finita (-1) ~=? negateDuracao (Finita 1),
        testMultError
      ]

main :: IO ()
main = runTestTTAndExit $ test [testSuite, testesTarefa1, testesTarefa2, testesTarefa3]
