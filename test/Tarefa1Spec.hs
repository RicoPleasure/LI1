
module Tarefa1Spec (testesTarefa1) where

import Test.HUnit
import LI12425
import Tarefa1
import GameSituations

testesTarefa1 :: Test
testesTarefa1 =
  TestLabel "Testes Tarefa 1" $ test (validaJogoTeste)                               

validaJogoTeste = [TestCase (assertBool "Teste1" (not (validaJogo jogoTeste1))),
                   TestCase (assertBool "Teste2" (not (validaJogo jogoTeste2))),
                   TestCase (assertBool "Teste3" (not (validaJogo jogoTeste3))),
                   TestCase (assertBool "Teste4" (not (validaJogo jogoTeste4))),
                   TestCase (assertBool "Teste5" (not (validaJogo jogoTeste5))),
                   TestCase (assertBool "Teste6" (not (validaJogo jogoTeste6))),
                   TestCase (assertBool "Teste7" (not (validaJogo jogoTeste7))),
                   TestCase (assertBool "Teste8" (not (validaJogo jogoTeste8))),
                   TestCase (assertBool "Teste9" (not (validaJogo jogoTeste9)))]