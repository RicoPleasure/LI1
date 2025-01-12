module Tarefa3Spec (testesTarefa3) where

import Test.HUnit
import Tarefa3
import LI12425
import TData.TDataTarefa3
import Control.Exception (try, evaluate, SomeException)



-- | Testes da Tarefa 3.
testAtualizaJogo :: Test
testAtualizaJogo = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jogo1)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaJogo"
    Right (Jogo {baseJogo = base, portaisJogo = portais}) ->
      assertBool "Test Atualiza Jogo"
                (vidaBase base == 500.0 
                && posicaoBase base == (5.0,0.0) 
                && creditosBase base == 10000 
                && length portais == 1 
                && posicaoPortal (head portais) == (5.0,11.0) 
                && length (ondasPortal (head portais)) == 1 
                && length (inimigosOnda (head (ondasPortal (head portais)))) == 5 
                && posicaoInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == (5.0,11.0) 
                && direcaoInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == Norte 
                && vidaInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 200.0 
                && velocidadeInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 1.0 
                && ataqueInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 100.0 
                && butimInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 200 
                && length (projeteisInimigo (head (inimigosOnda (head (ondasPortal (head portais)))))) == 0)

-- | Testes da Tarefa 3.
testAtualizaJogoTorresInimigos :: Test
testAtualizaJogoTorresInimigos = TestCase $ do
  result <- try (evaluate (atualizaJogo 1 jogoInimigosTorres)) :: IO (Either SomeException Jogo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testAtualizaJogo"
    Right (Jogo {baseJogo = base, portaisJogo = portais}) ->
      assertBool "Test Atualiza Jogo Com Torres e Inimigos"
              (vidaBase base == 500.0 
              && posicaoBase base == (5.0,0.0) 
              && creditosBase base == 9100 
              && length portais == 2 
              && posicaoPortal (head portais) == (5.0,11.0) 
              && length (ondasPortal (head portais)) == 1 
              && length (inimigosOnda (head (ondasPortal (head portais)))) == 4 
              && posicaoInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == (5.0,11.0) 
              && direcaoInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == Norte 
              && vidaInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 200.0 
              && velocidadeInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 1.0 
              && ataqueInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 100.0 
              && butimInimigo (head (inimigosOnda (head (ondasPortal (head portais))))) == 200 
              && length (projeteisInimigo (head (inimigosOnda (head (ondasPortal (head portais)))))) == 0)


{- Testes -}

testesTarefa3 :: Test
testesTarefa3 =
  TestLabel "Testes Tarefa 3" $
    test
      [
        testAtualizaJogo,
        testAtualizaJogoTorresInimigos
        
      ]
