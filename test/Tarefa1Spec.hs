
module Tarefa1Spec (testesTarefa1) where

import Test.HUnit
import Tarefa1 (validaJogo)
import TData.TestData

testesTarefa1 :: Test
testesTarefa1 =
  TestLabel "Testes Tarefa 1" $
    test
      [ 
        "teste Jogo valido" ~: True ~=? validaJogo jogoValido,
        "teste Jogo inválido sem portais" ~: False ~=? validaJogo jogoNoPortals,
        "teste Jogo inválido sem mapa" ~: False ~=? validaJogo jogoNoMap,
        "teste Jogo válido com mapa complexo" ~: True ~=? validaJogo jogoValidoMapTest,
        "teste Jogo portal com pos inválida" ~: False ~=? validaJogo jogoValidoInvalidPortalPos
      ]


