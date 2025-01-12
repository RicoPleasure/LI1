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
import Utils.UtilitariosPortal
import Data.List
import System.Random (randomRIO)
import System.IO.Unsafe (unsafePerformIO)


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
  'combinacaoValida' verifica se a combinação de projéteis é válida

  ==__Observações__

  * A combinação de projéteis válida é:
    * Fogo
    * Gelo
    * Resina
    * Gelo + Resina

  ==__Exemplos de utilização__

  >>> combinacaoValida [Fogo]
  True
  >>> combinacaoValida [Gelo]
  True
  >>> combinacaoValida [Resina]
  True
  >>> combinacaoValida [Gelo, Resina]
  True
  >>> combinacaoValida [Fogo, Gelo]
  False
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
reduzVidaInimigo inimigo dano = inimigo {vidaInimigo = vida - dano}
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
 'handleHitByProjetil' aplica o efeito de um 'Projetil' a um 'Inimigo'

  ==__Exemplos de utilização__
  >>> handleHitByProjetil (Inimigo {vidaInimigo = 10, velocidadeInimigo = 10, projeteisInimigo = []}) (Projetil {tipoProjetil = Fogo})
  Inimigo {vidaInimigo = 0.0, velocidadeInimigo = 10.0, projeteisInimigo = [Projetil {tipoProjetil = Fogo}]}
  >>> handleHitByProjetil (Inimigo {vidaInimigo = 10, velocidadeInimigo = 10, projeteisInimigo = []}) (Projetil {tipoProjetil = Resina})
  Inimigo {vidaInimigo = 10.0, velocidadeInimigo = 5.0, projeteisInimigo = [Projetil {tipoProjetil = Resina}]}
  >>> handleHitByProjetil (Inimigo {vidaInimigo = 10, velocidadeInimigo = 10, projeteisInimigo = []}) (Projetil {tipoProjetil = Gelo})
  Inimigo {vidaInimigo = 10.0, velocidadeInimigo = 5.0, projeteisInimigo = [Projetil {tipoProjetil = Gelo}]} 
-}
handleHitByProjetil :: Inimigo -> Projetil -> Inimigo
handleHitByProjetil inimigo projetil = inimigo {
  projeteisInimigo = handleNewProjetil (projeteisInimigo inimigo) projetil
}

{-| 
  'handleNewProjetil' adiciona um novo 'Projetil' à lista de projeteis de um 'Inimigo'

  ==__Observações__
  * Quando um inimigo já se encontra sob o efeito de 'Fogo' ou 'Gelo' e é atingido por um projetil do outro tipo ('Fogo' ou 'Gelo'), estes cancelam os seus efeitos mutuamente.
-}
handleNewProjetil :: [Projetil] -> Projetil -> [Projetil]
handleNewProjetil [] p = [p]
{-| Fogo com Fogo aumenta a duração de Fogo -}
handleNewProjetil [Projetil {tipoProjetil = Fogo, duracaoProjetil = dur}] (Projetil {tipoProjetil = Fogo, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Fogo, duracaoProjetil = dur+durNew}]
{-| Resina com Resina
  ==_Observações_==
    * Como a duração do projétil do tipo Resina é Infinita, a duração mantém-se Infinita
-}
handleNewProjetil [Projetil {tipoProjetil = Resina, duracaoProjetil = dur}] (Projetil {tipoProjetil = Resina, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Resina, duracaoProjetil = dur+durNew}]
{-| Gelo com Gelo aumenta a duração de Gelo -}
handleNewProjetil [Projetil {tipoProjetil = Gelo, duracaoProjetil = dur}] (Projetil {tipoProjetil = Gelo, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Gelo, duracaoProjetil = dur+durNew}]

{-| Fogo com Resina aumenta a duração de Fogo -}
handleNewProjetil [Projetil {tipoProjetil = Fogo, duracaoProjetil = dur}] (Projetil {tipoProjetil = Resina, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Fogo, duracaoProjetil = dur * 2}]

{-| Resina com Fogo aumenta a duração de Fogo -}
handleNewProjetil [Projetil {tipoProjetil = Resina, duracaoProjetil = dur}] (Projetil {tipoProjetil = Fogo, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Fogo, duracaoProjetil = durNew * 2}]

{-| Fogo com Gelo apenas adiciona o novo projétil -}

{-| Gelo com Resina apenas adiciona o novo projétil -}
handleNewProjetil [Projetil {tipoProjetil = Gelo, duracaoProjetil = dur}] (Projetil {tipoProjetil = Resina, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Gelo, duracaoProjetil = dur}, Projetil {tipoProjetil = Resina, duracaoProjetil = durNew}]

{-| Resina com Gelo apenas adiciona o novo projétil -}
handleNewProjetil [Projetil {tipoProjetil = Resina, duracaoProjetil = dur}] (Projetil {tipoProjetil = Gelo, duracaoProjetil = durNew}) = [Projetil {tipoProjetil = Gelo, duracaoProjetil = durNew}, Projetil {tipoProjetil = Resina, duracaoProjetil = dur}]

{-| Fogo e Gelo anulam-se -}
handleNewProjetil [Projetil {tipoProjetil = Fogo}] (Projetil {tipoProjetil = Gelo}) = []
handleNewProjetil [Projetil {tipoProjetil = Gelo}] (Projetil {tipoProjetil = Fogo}) = []

handleNewProjetil l _ = l

{-|
    A função 'inimigoVivo' verifica se um 'Inimigo' está vivo.

    ==__Exemplos de utilização__
    >>> inimigoVivo (Inimigo {vidaInimigo = 10})
    True
    >>> inimigoVivo (Inimigo {vidaInimigo = 0})
    False
-}
inimigoVivo :: Inimigo -- ^ Inimigo 
            -> Bool -- ^ Bool
inimigoVivo (Inimigo {vidaInimigo = vida}) = vida > 0

{-|
    A função 'calculaNovaPosicao' é responsável por calcular a nova posição de um 'Inimigo' com o passar do 'Tempo'.

    ==__Exemplos de utilização__
    >>> calculaNovaPosicao Norte (0,0) [] 1 2
    (0.0,-2.0)
    >>> calculaNovaPosicao Norte (0,0) [] 1 2
    (0.0,-2.0)
-}
calculaNovaPosicao :: [Projetil] 
                   -> Direcao -- ^ Direção
                   -> Posicao -- ^ Posição
                   -> Mapa -- ^ Mapa
                   -> Float -- ^ Velocidade
                   -> Float -- ^ Tempo
                   -> Posicao -- ^ Nova Posição
calculaNovaPosicao ps dir (x, y) _ v t = case map tipoProjetil ps of 
  [Resina] ->  case dir of
    Norte -> (x, y - v * t * 0.5)
    Sul   -> (x, y + v * t * 0.5)
    Este  -> (x + v * t * 0.5, y)
    Oeste -> (x - v * t * 0.5, y)
  [Gelo] -> case dir of 
    Norte -> (x, y - v * t * 0)
    Sul   -> (x, y + v * t * 0)
    Este  -> (x + v * t * 0, y)
    Oeste -> (x - v * t * 0, y)
  [Gelo, Resina] -> case dir of
    Norte -> (x, y - v * t * 0)
    Sul   -> (x, y + v * t * 0)
    Este  -> (x + v * t * 0, y)
    Oeste -> (x - v * t * 0, y)
  [Resina, Gelo] -> case dir of 
    Norte -> (x, y - v * t * 0)
    Sul   -> (x, y + v * t * 0)
    Este  -> (x + v * t * 0, y)
    Oeste -> (x - v * t * 0, y)
  [] -> case dir of
    Norte -> (x, y - v * t)
    Sul   -> (x, y + v * t)
    Este  -> (x + v * t, y)
    Oeste -> (x - v * t, y)
  _ -> case dir of 
    Norte -> (x, y - v * t)
    Sul   -> (x, y + v * t)
    Este  -> (x + v * t, y)
    Oeste -> (x - v * t, y)
 


{-|
    A função 'handleProjeteisInimigo' é responsável por atualizar os projéteis de um 'Inimigo' com o passar do 'Tempo'.

    ==__Exemplos de utilização__
    >>> handleProjeteisInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 5}]}) 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 3.0}], velocidadeInimigo = 1.0}
    >>> handleProjeteisInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 5}]}) 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 3.0}], velocidadeInimigo = 1.0}
-}      
{- proximaPosicao :: Direcao -> Posicao -> Float -> Float -> Posicao
proximaPosicao dir (x, y) v t = 
    case dir of
      Norte -> (x, y - v * t)
      Sul   -> (x, y + v * t)
      Este  -> (x + v * t, y)
      Oeste -> (x - v * t, y) -}
{-|
    A função 'calculaNovaDirecao' é responsável por calcular a nova direção de um 'Inimigo' com o passar do 'Tempo'.

    ==__Exemplos de utilização__
    >>> calculaNovaDirecao Norte [] (0,0) 1 2
    Norte
    >>> calculaNovaDirecao Norte [] (0,0) 1 2
    Norte
-}
calculaNovaDirecao :: Direcao -- ^ Direção
                   -> Base -- ^ Base
                   -> Mapa -- ^ Mapa
                   -> Posicao -- ^ Posição
                   -> Float -- ^ Velocidade
                   -> Float -- ^ Tempo
                   -> Direcao -- ^ Nova Direção
calculaNovaDirecao dir base mapa (x, y) v t
    | not (isValidPos novaPos mapa dir && isTerra novaPos mapa dir) = case dirValidas of
        (newDir:_) -> newDir
        _ -> dir
    | otherwise = dir
    where
        dirValidas = filter isValidAndTerra [Norte, Sul, Este, Oeste]
        novaPos = proximaPosicao dir (x, y) v t 
        isValidAndTerra d = let pos = proximaPosicao d (x, y) v t in isValidPos pos mapa d && isTerra pos mapa d && d /= oposta dir && pos /= novaPos
        oposta Norte = Sul
        oposta Sul   = Norte
        oposta Este  = Oeste
        oposta Oeste = Este

proximaPosicao :: Direcao -> Posicao -> Float -> Float -> Posicao
proximaPosicao dir (x, y) v t = 
    case dir of
      Norte -> (x, y - v * t)
      Sul   -> (x, y + v * t)
      Este  -> (x + v * t, y)
      Oeste -> (x - v * t, y)

{- escolheDirecao :: [Direcao] -> Direcao
escolheDirecao ds = unsafePerformIO $ do
    n <- randomRIO (0, length ds - 1)
    return (ds !! n)
 -}

{-|
    A função 'inimigoChegouBase' verifica se um 'Inimigo' chegou à 'Base'.

    ==__Exemplos de utilização__
    >>> inimigoChegouBase (Inimigo {posicaoInimigo = (0,0)}) (Base {posicaoBase = (0,0)})
    True
    >>> inimigoChegouBase (Inimigo {posicaoInimigo = (0,0)}) (Base {posicaoBase = (1,1)})
    False
-}
inimigoChegouBase :: Inimigo -- ^ Inimigo 
                  -> Base -- ^ Base
                  -> Bool -- ^ Bool
inimigoChegouBase (Inimigo {posicaoInimigo = (xInimigo,yInimigo)}) (Base {posicaoBase = (xBase,yBase)}) = 
    (round yInimigo) == (round yBase) && (round xInimigo) == (round xBase)