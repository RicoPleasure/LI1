module Tarefa2Spec (testesTarefa2) where

import Test.HUnit
import LI12425
import Tarefa2

testesTarefa2 :: Test
testesTarefa2 =
  TestLabel "Testes Tarefa 2" $ test (testInimigosNoAlcance)

torreTeste1 = Torre { posicaoTorre = (0, 0), alcanceTorre = 5.0 }
inimigosTeste1 = [Inimigo { posicaoInimigo = (2, 4) }, Inimigo { posicaoInimigo = (10, 10) }]

testInimigosNoAlcance = TestList [ TestCase (assertEqual "Teste 1"  [(Inimigo {posicaoInimigo = (10, 10)})] (inimigosNoAlcance torreTeste1 inimigosTeste1))]