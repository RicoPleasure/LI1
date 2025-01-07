
module Tarefa1Spec (testesTarefa1) where

import Test.HUnit
import TData.TDataTarefa1
import Tarefa1

testesTarefa1 :: Test
testesTarefa1 =
  TestLabel "Testes Tarefa 1" $
    test
      [ 
        "teste Jogo valido" ~: True ~=? validaJogo jogoValido,

        -- Testes mapa
        "teste Jogo inválido sem mapa" ~: False ~=? validaJogo jogoNoMap,
        "teste Jogo válido com mapa complexo" ~: True ~=? validaJogo jogoValidoMapTest,

        -- Testes portais
        "teste Jogo inválido sem portais" ~: False ~=? validaJogo jogoNoPortals,
        "teste Jogo portal com pos inválida" ~: False ~=? validaJogo jogoValidoInvalidPortalPos,
        
        -- Testes torres
        "teste Jogo torre com terreno inválido" ~: False ~=? validaJogo jogoTorreTerrenoInvalido,
        "teste Jogo torre com alcance inválido" ~: False ~=? validaJogo jogoTorreAlcanceInvalido,
        "teste Jogo torre com rajada inválida" ~: False ~=? validaJogo jogoTorreRajadaInvalido,
        "teste Jogo com torres sobrepostas" ~: False ~=? validaJogo jogoTorresSobrepostas,

        -- Testes base
        "teste Jogo base com pos inválida" ~: False ~=? validaJogo jogoInvalidBasePos,

        -- Testes inimigos
        "teste Jogo com inimigos dentro dos portais sem projeteis" ~: True ~=? validaJogo jogoValidoInimigosDentroSemProjetil,
        "teste Jogo com inimigos dentro dos portais com projeteis" ~: False ~=? validaJogo jogoInvalidoInimigosDentroComProjetil,
        "teste Jogo com inimigos fora dos portais com projéteis normalizados" ~: True ~=? validaJogo jogoValidoInimigosForaComProjetil,
        "teste Jogo com inimigos fora dos portais com projéteis não normalizados" ~: False ~=? validaJogo jogoInvalidoInimigosForaComProjeteisNaoNormalizados,
        "teste Jogo com inimigos com combinações inválidas de projéteis" ~: False ~=? validaJogo jogoInvalidoInimigosComCombinacaoInvalidaProjetil,
        "teste Jogo com inimigo com projétil do tipo Fogo" ~: True ~=? validaJogo jogoValidoProjetilFogo,
        "teste Jogo com inimigo com projétil do tipo Gelo" ~: True ~=? validaJogo jogoValidoProjetilGelo,
        "teste Jogo com inimigo com projétil do tipo Resina" ~: True ~=? validaJogo jogoValidoProjetilResina,
        "teste Jogo com inimigo sem projéteis" ~: True ~=? validaJogo jogoValidoSemProjetil
      ]


