module UtilitariosInimigosSpec (testesUtilitariosInimigos) where

import Test.HUnit
import LI12425
import Utils.UtilitariosInimigo
import Control.Exception (try, evaluate, SomeException)
import TData.TDataUtilitarios


testCalculaNovaPosicao :: Test
testCalculaNovaPosicao = TestCase $ do
  result <- try (evaluate (calculaNovaPosicao projeteis1 Norte (2,2) [] 1 1 )) :: IO (Either SomeException Posicao)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoSemProjAtingGelo"
    Right (x,y) ->
      assertBool "Test calculaNovaPosicao Com Projetil Fogo" (x == 2 && y == 1) 

testesUtilitariosInimigos :: Test
testesUtilitariosInimigos =
  TestLabel "Testes Tarefa 3" $
    test
      [
        testCalculaNovaPosicao
      ]
