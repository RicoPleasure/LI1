module Tarefa2Spec (testesTarefa2) where

import Test.HUnit
import Tarefa2
import LI12425
import Utils.UtilitariosPortal
import TData.TDataTarefa2
import Control.Exception (try, evaluate, SomeException)

import Test.HUnit

-- Test Jogo não terminou
testJogoNaoTerminou :: Test
testJogoNaoTerminou = TestCase $ do
  let jogo = Jogo { baseJogo = Base {vidaBase = 0}, inimigosJogo = [], portaisJogo = [] }
  assertBool "Test Jogo Não Terminou" (terminouJogo jogo == True)

-- Test do Jogo ganhou
testJogoGanhou :: Test
testJogoGanhou = TestCase $ do
  let jogo = Jogo { baseJogo = Base {vidaBase = 10}, inimigosJogo = [], portaisJogo = [] }
  assertBool "Test Jogo Ganhou" (ganhouJogo jogo == True)

-- Test do Jogo não ganhou
testJogoNaoGanhou :: Test
testJogoNaoGanhou = TestCase $ do
  let jogo = Jogo { baseJogo = Base {vidaBase = 10}, inimigosJogo = [Inimigo {vidaInimigo = 10}], portaisJogo = [] }
  assertBool "Test Jogo Não Ganhou" (ganhouJogo jogo == False)

-- Test do Jogo perdeu
testJogoPerdeu :: Test
testJogoPerdeu = TestCase $ do
  let jogo = Jogo { baseJogo = Base {vidaBase = 0}, inimigosJogo = [], portaisJogo = [] }
  assertBool "Test Jogo Perdeu" (perdeuJogo jogo == True)

-- Test do Jogo não perdeu
testJogoNaoPerdeu :: Test
testJogoNaoPerdeu = TestCase $ do
  let jogo = Jogo { baseJogo = Base {vidaBase = 10}, inimigosJogo = [], portaisJogo = [] }
  assertBool "Test Jogo Não Perdeu" (perdeuJogo jogo == False)

-- Inimigo sem projeteis
testInimigoSemProjAtingGelo :: Test
testInimigoSemProjAtingGelo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreGelo inimigoSemProjeteis)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoSemProjAtingGelo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Gelo Inimigo sem Proj."
                 (vida == 80 && length proj == 1 && tipoProjetil (head proj) == Gelo)

testInimigoSemProjAtingFogo :: Test
testInimigoSemProjAtingFogo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreFogo inimigoSemProjeteis)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoSemProjAtingFogo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Fogo Inimigo sem Proj."
                 (vida == 60 && length proj == 1 && tipoProjetil (head proj) == Fogo)
 
testInimigoSemProjAtingResina :: Test
testInimigoSemProjAtingResina = TestCase $ do
  result <- try (evaluate (atingeInimigo torreResina inimigoSemProjeteis)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoSemProjAtingResina"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Resina Inimigo sem Proj."
                 (vida == 70 && length proj == 1 && tipoProjetil (head proj) == Resina)


-- Inimigo com Fogo
testInimigoComFogoAtingResina :: Test
testInimigoComFogoAtingResina = TestCase $ do
  result <- try (evaluate (atingeInimigo torreResina inimigoComFogo)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComFogoAtingResina"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Resina Inimigo com Fogo."
                 (vida == 70 && length proj == 1 && tipoProjetil (head proj) == Fogo && duracaoProjetil (head proj) == Finita 10)

testInimigoComFogoAtingGelo :: Test
testInimigoComFogoAtingGelo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreGelo inimigoComFogo)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComFogoAtingGelo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Gelo Inimigo com Fogo."
                 (vida == 80 && null proj)

testInimigoComFogoAtingFogo :: Test
testInimigoComFogoAtingFogo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreFogo inimigoComFogo)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComFogoAtingFogo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Fogo Inimigo com Fogo."
                 (vida == 60 && length proj == 1 && tipoProjetil (head proj) == Fogo && duracaoProjetil (head proj) == Finita 10)

-- Inimigo com Gelo
testInimigoComGeloAtingFogo :: Test
testInimigoComGeloAtingFogo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreFogo inimigoComGelo)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComGeloAtingFogo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Fogo Inimigo com Gelo."
                 (vida == 60 && null proj)

-- Inimigo com Gelo
testInimigoComGeloAtingGelo :: Test
testInimigoComGeloAtingGelo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreGelo inimigoComGelo)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComGeloAtingGelo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Gelo Inimigo com Gelo."
                 (vida == 80 && length proj == 1 && tipoProjetil (head proj) == Gelo && duracaoProjetil (head proj) == Finita 2)

-- Inimigo com Resina
testInimigoComResinaAtingResina :: Test
testInimigoComResinaAtingResina = TestCase $ do
  result <- try (evaluate (atingeInimigo torreResina inimigoComResina)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComResinaAtingResina"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Resina Inimigo com Resina."
                 (vida == 70 && length proj == 1 && tipoProjetil (head proj) == Resina && duracaoProjetil (head proj) == Infinita)

testInimigoComResinaAtingFogo :: Test
testInimigoComResinaAtingFogo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreFogo inimigoComResina)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComResinaAtingFogo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Fogo Inimigo com Resina."
                 (vida == 60 && length proj == 1 && tipoProjetil (head proj) == Fogo && duracaoProjetil (head proj) == Finita 10)

testInimigoComResinaAtingGelo :: Test
testInimigoComResinaAtingGelo = TestCase $ do
  result <- try (evaluate (atingeInimigo torreGelo inimigoComResina)) :: IO (Either SomeException Inimigo)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigoComResinaAtingGelo"
    Right (Inimigo {vidaInimigo = vida, projeteisInimigo = proj}) ->
      assertBool "Test Proj. Gelo Inimigo com Resina."
                 (vida == 80 && length proj == 2 && tipoProjetil (head proj) == Gelo && duracaoProjetil (head proj) == Finita 1)

{- Inimigos no alcance -}

testInimigosNoAlcance :: Test
testInimigosNoAlcance = TestCase $ do
  result <- try (evaluate (inimigosNoAlcance torreGelo [inimigoSemProjeteis, inimigoComFogo, inimigoComGelo, inimigoComResina])) :: IO (Either SomeException [Inimigo])
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testInimigosNoAlcance"
    Right inimigos ->
      assertBool "Test Inimigos no Alcance"
                 (length inimigos == 4)

{- Terminou jogo -}

testeNaoTerminouJogo :: Test
testeNaoTerminouJogo = TestCase $ do
  result <- try (evaluate (terminouJogo jogoValido)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testeTerminouJogo"
    Right terminou ->
      assertBool "Test Terminou Jogo"
                 (not terminou)

testeTerminouJogo :: Test
testeTerminouJogo = TestCase $ do
  result <- try (evaluate (terminouJogo jogoTerminado)) :: IO (Either SomeException Bool)
  case result of
    Left _ ->
      assertFailure "Ocorreu um erro na função testeTerminouJogo2"
    Right terminou ->
      assertBool "Test Terminou Jogo 2"
                 terminou

{- Testes -}

testesTarefa2 :: Test
testesTarefa2 =
  TestLabel "Testes Tarefa 2" $
    test
      [ -- testes atingeInimigo
        testInimigoSemProjAtingGelo,
        testInimigoSemProjAtingFogo,
        testInimigoSemProjAtingResina,
        testInimigoComFogoAtingResina,
        testInimigoComFogoAtingGelo,
        testInimigoComFogoAtingFogo,
        testInimigoComGeloAtingFogo,
        testInimigoComGeloAtingGelo,
        testInimigoComResinaAtingResina,
        testInimigoComResinaAtingFogo,
        testInimigoComResinaAtingGelo,

<<<<<<< HEAD
        -- testes inimigosNoAlcance
        testInimigosNoAlcance,

        -- testes terminouJogo
        testeNaoTerminouJogo,
        testeTerminouJogo
        
=======
<<<<<<< HEAD
        -- testes terminouJogo
        testJogoNaoTerminou,
        
        -- testes ganhouJogo
        testJogoGanhou,
        testJogoNaoGanhou,

        -- testes perdeuJogo
        testJogoPerdeu,
        testJogoNaoPerdeu
=======
        -- testes ativaInimigo
        testPortalComOndaAtivaEInimigoParaAtivar,
        testPortalSemOndaAtiva,
        testPortalComOndaAtivaSemInimigoParaAtivar,
        testPortalMultOndas,

        -- testes extra
        testInsertOndaAtivaInOndas
>>>>>>> main
>>>>>>> 83d13f644be0830c75088d2ecc0934a12bc245d4
      ]
