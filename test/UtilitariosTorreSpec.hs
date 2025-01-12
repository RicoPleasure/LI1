module UtilitariosTorreSpec (testesUtilitariosTorre) where

import Test.HUnit
import LI12425
import Utils.UtilitariosTorre
import Control.Exception (try, evaluate, SomeException)
import TData.TDataUtilitarios

testInsereTorreFogoNaLista :: Test 
testInsereTorreFogoNaLista = TestCase $ do
  result <- try (evaluate (insereTorreNaLista [] (2,2) Fogo)) :: IO (Either SomeException [Torre])
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função insereTorreNaLista"
    Right torres -> 
      assertBool "Teste insereTorreFogoNaLista" 
        ((length torres == 1 )
        && posicaoTorre (head torres) == (2,2) 
        && danoTorre (head torres) == 40 
        && alcanceTorre (head torres) == 2 
        && rajadaTorre (head torres) == 3 
        && cicloTorre (head torres) == 4 
        && tempoTorre (head torres) == 0 
        && tipoProjetil (projetilTorre (head torres)) == Fogo 
        && (duracaoProjetil (projetilTorre (head torres)) == Finita 5))

testInsereTorreGeloNaLista :: Test 
testInsereTorreGeloNaLista = TestCase $ do
  result <- try (evaluate (insereTorreNaLista [] (2,2) Gelo)) :: IO (Either SomeException [Torre])
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função insereTorreNaLista"
    Right torres -> 
      assertBool "Teste insereTorreGeloNaLista" 
        ((length torres == 1 )
        && posicaoTorre (head torres) == (2,2) 
        && danoTorre (head torres) == 20
        && alcanceTorre (head torres) == 5 
        && rajadaTorre (head torres) == 3 
        && cicloTorre (head torres) == 5
        && tempoTorre (head torres) == 0 
        && tipoProjetil (projetilTorre (head torres)) == Gelo
        && (duracaoProjetil (projetilTorre (head torres)) == Finita 1))

testInsereTorreResinaNaLista :: Test 
testInsereTorreResinaNaLista = TestCase $ do
  result <- try (evaluate (insereTorreNaLista [] (2,2) Resina)) :: IO (Either SomeException [Torre])
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função insereTorreNaLista"
    Right torres -> 
      assertBool "Teste insereTorreResinaNaLista" 
        ((length torres == 1 )
        && posicaoTorre (head torres) == (2,2) 
        && danoTorre (head torres) == 30
        && alcanceTorre (head torres) == 3
        && rajadaTorre (head torres) == 3
        && cicloTorre (head torres) == 5
        && tempoTorre (head torres) == 0 
        && tipoProjetil (projetilTorre (head torres)) == Resina
        && (duracaoProjetil (projetilTorre (head torres)) == Infinita))

testAdicionaTorreValida :: Test
testAdicionaTorreValida = TestCase $ do
  result <- try (evaluate (adicionaTorreValida (0,0) [[Relva]] [] 100 100)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função adicionaTorreValida"
    Right bool -> 
      assertBool "Teste adicionaTorreValida" bool

testCustoTorreFogo :: Test
testCustoTorreFogo = TestCase $ do
  result <- try (evaluate (custoTorre Torre1)) :: IO (Either SomeException Creditos)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função custoTorre"
    Right custo -> 
      assertBool "Teste custoTorreFogo" (custo == 200)

testCustoTorreGelo :: Test
testCustoTorreGelo = TestCase $ do
  result <- try (evaluate (custoTorre Torre2)) :: IO (Either SomeException Creditos)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função custoTorre"
    Right custo -> 
      assertBool "Teste custoTorreGelo" (custo == 700)

testCustoTorreResina :: Test
testCustoTorreResina = TestCase $ do
  result <- try (evaluate (custoTorre Torre3)) :: IO (Either SomeException Creditos)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função custoTorre"
    Right custo -> 
      assertBool "Teste custoTorreResina" (custo == 300)



testesUtilitariosTorre :: Test
testesUtilitariosTorre =
  TestLabel "Testes Tarefa 3" $
    test
      [
        testAdicionaTorreValida,

        testInsereTorreFogoNaLista,
        testInsereTorreGeloNaLista,
        testInsereTorreResinaNaLista,

        testCustoTorreFogo,
        testCustoTorreGelo,
        testCustoTorreResina

      ]
