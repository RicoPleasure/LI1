{-|
Module      : Utils.UtilitariosInimigo
Description : Coleção de funções utilitarias necessárias para trabalhar com os inimigos
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com os inimigos no Jogo. Estes utilitarios são necessários p.ex para a validação das torres.
-}
module Utils.UtilitariosInimigo where

import LI12425
import Utils.Utilitarios
import Utils.UtilitariosTorre
import Data.List

{-| 
  'validaInimigos' verifica se todos os inimigos são válidos

  ==__Exemplos de utilização__

  >>> validaInimigos [[Terra, Terra, Terra, Relva]] [(Inimigo {posicaoInimigo = (1,1), vidaInimigo = 10, velocidadeInimigo = 10, projeteisInimigo = []})] [(1,1), (2,2)]
  True
  >>> validaInimigos [[Terra, Terra, Terra, Relva]] [(Inimigo {posicaoInimigo = (1,1), vidaInimigo = -10, velocidadeInimigo = 10, projeteisInimigo = []})] [(1,1), (2,2)]
  False

-}


validaInimigos :: [[Terreno]] -- Mapa
               -> [Inimigo] -- Posicoes dos inimigos
               -> [Portal] -- Posicões dos portais
               -> Bool
validaInimigos mapa inimigos portais =
  all (\inimigo -> validaInimigo mapa inimigo portais) inimigos

{-|
  'validaInimigo' verifica se um inimigo é válido

  ==__Exemplos de utilização__

  >>> validaInimigo [[Terra, Terra, Terra, Relva]] (Inimigo {posicaoInimigo = (1,1), vidaInimigo = 10, velocidadeInimigo = 10, projeteisInimigo = []}) [(1,1), (2,2)]
  True
  >>> validaInimigo [[Terra, Terra, Terra, Relva]] (Inimigo {posicaoInimigo = (1,1), vidaInimigo = -10, velocidadeInimigo = 10, projeteisInimigo = []}) [(1,1), (2,2)]
  False

  -}
validaInimigo :: [[Terreno]] -- Mapa
              -> Inimigo -- Inimigo
              -> [Portal] -- Portais
              -> Bool
validaInimigo mapa (Inimigo { posicaoInimigo = posicao, vidaInimigo = vida, velocidadeInimigo = velocidade, projeteisInimigo = projeteis }) portais = 
  validaPosicaoObjeto posicao mapa 
  && vida >= 0
  && velocidade >= 0
  && checkPositionTerra posicao mapa
  && projeteisNormalizados posicao (map posicaoPortal portais) projeteis


{-|
  Verifica que os projeteis estão normalizados, ou seja, que os inimigos não possuem projéteis do mesmo tipo ou que possuem sinergias ativos simultaneamente

  ==__Observações__

  * Quando um inimigo se encontra dentro do portal para ser lançado, ele não pode ter projéteis ativos
  * Quando um inimigo se encontra fora do portal, ele pode ter projéteis ativos, mas estes têm de estar normalizados
  * A combinação de projéteis válida é:
    * Fogo
    * Gelo
    * Resina
    * Fogo + Resina

  ==__Exemplos de utilização__

  >>> projeteisNormalizados (1,1) [(1,1), (2,2)] [Projetil {tipoProjetil = Fogo, duracaoProjetil = 10}]
  True
  >>> projeteisNormalizados (1,1) [(1,1), (2,2)] [Projetil {tipoProjetil = Fogo, duracaoProjetil = 10}, Projetil {tipoProjetil = Gelo, duracaoProjetil = 10}]
  False

 -}
projeteisNormalizados :: Posicao -- Posicao do inimigo
                      -> [Posicao] -- Posicoes dos portais
                      -> [Projetil] -- Lista de projéteis
                      -> Bool
projeteisNormalizados posInimigo posPortais projeteis 
  | inimigoDentroDosPortais posInimigo posPortais = null projeteis
  | otherwise = combinacaoValida (map tipoProjetil projeteis)

{-| 
  ''combinacaoValida'' verifica se a combinação de projéteis é válida
 -}

combinacaoValida  :: [TipoProjetil] -- Lista de projéteis
                  -> Bool
combinacaoValida tiposProjeteis
  | tiposProjeteis == nub tiposProjeteis = case tiposProjeteis of
    [] -> True
    [Fogo] -> True
    [Gelo] -> True
    [Resina] -> True
    [Gelo, Resina] -> True
    _ -> False
  | otherwise = False

{-|
  'inimigoDentroDosPortais' verifica se o inimigo está dentro de algum dos portais

  ==__Exemplos de utilização__

  >>> inimigoDentroDosPortais (1,1) [(1,1), (2,2)]
  True
  >>> inimigoDentroDosPortais (1,1) [(2,2), (3,3)]
  False
 -}
inimigoDentroDosPortais :: Posicao -- Posicao do inimigo 
                        -> [Posicao] -- Posicoes dos portais
                        -> Bool
inimigoDentroDosPortais posInimigo posicoesPortais = (elem posInimigo posicoesPortais)

{-|
  'verificaColisaoInimigosTorres' verifica se o inimigo está sobreposto a alguma torre

  ==__Exemplos de utilização__

  >>> verificaColisaoInimigosTorres (1,1) [(1,1), (2,2)]
  True
  >>> verificaColisaoInimigosTorres (1,1) [(2,2), (3,3)]
  False
 -}
verificaColisaoInimigosTorres :: [Inimigo] -- Posicao do inimigo 
                      -> [Torre] -- Posicoes das torres
                      -> Bool
verificaColisaoInimigosTorres is ts = verificaDuplosPos listPos
    where 
        posInimigo = converteInimigosEmListaPos is
        posTorres = converteTorresEmListaPos ts
        listPos = posInimigo ++ posTorres

{-|
    A função 'reduzVidaInimigo' reduz a vida de um 'Inimigo' por um dado valor

    ==__Exemplos de utilização__
    >>> reduzVidaInimigo (Inimigo {vidaInimigo = 10}) 5
    Inimigo {vidaInimigo = 5}
    >>> reduzVidaInimigo (Inimigo {vidaInimigo = 10}) 15
    Inimigo {vidaInimigo = (-5)}
    >>> reduzVidaInimigo (Inimigo {vidaInimigo = 10}) 10
    Inimigo {vidaInimigo = 0}
-}
reduzVidaInimigo :: Inimigo -> Float -> Inimigo
reduzVidaInimigo inimigo dano = 
        inimigo {vidaInimigo = vida - dano}
    where
        vida = vidaInimigo inimigo

{-|
  'converteInimigosEmListaPos' converte uma lista de objetos do tipo 'Inimigo' em uma lista do tipo 'Posicao' ou seja extrai as respetivas posições para uma coleção

  ==__Exemplos de utilização__
  >>> converteInimigosEmListaPos [Inimigo {posicaoInimigo = (0,0)}, Inimigo {posicaoInimigo = (1,2)}]
  [(0.0,0.0), (1.0,2.0)]
  >>> converteInimigosEmListaPos []
  []
-}
converteInimigosEmListaPos :: [Inimigo] -> [Posicao]
converteInimigosEmListaPos = map (\(Inimigo {posicaoInimigo = pos} ) -> pos)


{-|
    A função 'handleHitByProjetil' altera o 'Inimigo' conforme o esperado, quando este é atingido por um 'Projetil' e recorre para tal à função auxiliar 'handleNewProjetil'

    ==__Observações__
    * Quando um inimigo já se encontra sob o efeito de 'Fogo' ou 'Gelo' e é atingido por um projetil do outro tipo ('Fogo' ou 'Gelo'), estes cancelam os seus efeitos mutuamente.
    * A combinação dos projeteis 'Fogo' e 'Resina' dobra a duração do efeito do 'Projetil' do tipo 'Fogo'
    * Quando o inimigo se encontra sob o efeito de um certo 'Projetil' e é atingido por outro do mesmo tipo, as suas durações são somada.

    ==__Exemplos de utilização__
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [] }) (Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 })
    Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }) (Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 })
    Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 20 }] }
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }) (Projetil { tipoProjetil = Resina, duracaoProjetil = 2 })
    Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 20 }] }
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }) (Projetil { tipoProjetil = Gelo, duracaoProjetil = 2 })
    Inimigo { projeteisInimigo = [] }
-}
handleHitByProjetil :: Inimigo -> Projetil -> Inimigo
handleHitByProjetil inimigo projetil = 
        inimigo { projeteisInimigo = handleNewProjetil projeteis projetil }
    where
        projeteis = projeteisInimigo inimigo

{-|
    A função 'handleNewProjetil' serve como função auxiliar para a função 'handleHitByProjetil' e decide o que fazer com o Projetil que atingiu o Inimigo consultando para tal os projeteis já presentes no Inimigo.

    ==__Exemplos de utilização__
    >>> handleNewProjetil [] (Projetil {tipoProjetil = Fogo, duracaoProjetil = 5})
    [Projetil {tipoProjetil = Fogo, duracaoProjetil = 5}]
    >>> handleNewProjetil [Projetil {tipoProjetil = Fogo, duracaoProjetil = 1}] (Projetil {tipoProjetil = Fogo, duracaoProjetil = 5})
    [Projetil {tipoProjetil = Fogo, duracaoProjetil = 6}]
    >>> handleNewProjetil [Projetil {tipoProjetil = Gelo, duracaoProjetil = 1}] (Projetil {tipoProjetil = Fogo, duracaoProjetil = 5})
    []
    >>> handleNewProjetil [Projetil {tipoProjetil = Fogo, duracaoProjetil = 1}] (Projetil {tipoProjetil = Resina, duracaoProjetil = 5})
    [Projetil {tipoProjetil = Fogo, duracaoProjetil = 2}]
-}
handleNewProjetil :: [Projetil] -> Projetil -> [Projetil]
handleNewProjetil [] p = [p]
handleNewProjetil ((Projetil {tipoProjetil = Fogo, duracaoProjetil = dur}):xs) 
            (Projetil {tipoProjetil = Fogo, duracaoProjetil = durNew}) = (Projetil {tipoProjetil = Fogo, duracaoProjetil = dur+durNew}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Gelo, duracaoProjetil = dur}):xs) 
            (Projetil {tipoProjetil = Gelo, duracaoProjetil = durNew}) = (Projetil {tipoProjetil = Gelo, duracaoProjetil = dur+durNew}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Resina, duracaoProjetil = dur}):xs) 
            (Projetil {tipoProjetil = Resina, duracaoProjetil = durNew}) = (Projetil {tipoProjetil = Resina, duracaoProjetil = dur+durNew}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Resina}):xs) 
            (Projetil {tipoProjetil = Fogo, duracaoProjetil = durFogo}) = (Projetil {tipoProjetil = Fogo, duracaoProjetil = 2*durFogo}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Fogo, duracaoProjetil = durFogo}):xs) 
            (Projetil {tipoProjetil = Resina}) = (Projetil {tipoProjetil = Fogo, duracaoProjetil = 2*durFogo}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Fogo}):xs) (Projetil {tipoProjetil = Gelo}) = xs
handleNewProjetil ((Projetil {tipoProjetil = Gelo}):xs) (Projetil {tipoProjetil = Fogo}) = xs
handleNewProjetil l _ = l
