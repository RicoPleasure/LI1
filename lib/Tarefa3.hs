{-|
Module      : Tarefa3
Description : Mecânica do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 3 de LI1 em 2024/25.
-}
module Tarefa3 where

import LI12425

import Tarefa2
import Utils.UtilitariosPortal
import Utils.UtilitariosInimigo
import Utils.Utilitarios

{-|
    A função 'atualizaJogo' é responsável por aplicar a um 'Jogo', com o passar do tempo, as alterações previstas

    ==Funções desempenhadas
    * Atualizar a posição dos inimigos
    * Colocar inimigos de portais ativos no 'Jogo'
    * Atualizar as propriedades dependentes do tempo como p.ex. a 'tempoOnda' e 'entradaOnda'

    ==__Exemplos de utilização__
    >>> atualizaJogo 12 (Jogo { mapaJogo = [], inimigosJogo = [], lojaJogo = [], baseJogo = Base { vidaBase=10, posicaoBase = (0,0), creditosBase = 120 }, torresJogo = [], portaisJogo=[Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15}] }]})
    Jogo {baseJogo = Base {vidaBase = 10.0, posicaoBase = (0.0,0.0), creditosBase = 120}, portaisJogo = [Portal {posicaoPortal = (0.0,0.0), ondasPortal = [Onda {inimigosOnda = [], cicloOnda = 15.0, tempoOnda = 15.0, entradaOnda = -1.0}]}], torresJogo = [], mapaJogo = [], inimigosJogo = [Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}], lojaJogo = []}
    >>> atualizaJogo 12 (Jogo { mapaJogo = [], inimi    gosJogo = [], lojaJogo = [], baseJogo = Base { vidaBase=10, posicaoBase = (0,0), creditosBase = 120 }, torresJogo = [], portaisJogo=[Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}] }]})
    Jogo {baseJogo = Base {vidaBase = 10.0, posicaoBase = (0.0,0.0), creditosBase = 120}, portaisJogo = [Portal {posicaoPortal = (0.0,0.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}], cicloOnda = 15.0, tempoOnda = 14.0, entradaOnda = -1.0}]}], torresJogo = [], mapaJogo = [], inimigosJogo = [], lojaJogo = []}
-}
atualizaJogo :: Tempo -> Jogo -> Jogo
atualizaJogo t 
    j@Jogo {
        mapaJogo = mapa,
        baseJogo = base,
        portaisJogo = portais,
        torresJogo = torres,
        inimigosJogo = inimigos
    } = j {
        portaisJogo = newPortais,
        torresJogo = newTorres,
        inimigosJogo = inimigosFinal,
        baseJogo = baseFinal
    }
  where
    (newPortais, novosInimigos) = atualizaPortais t portais 
    inimigosComNovos = inimigos ++ novosInimigos
    (newTorres, inimigosDanoAplicado) = atualizaTorres t torres inimigosComNovos
    (inimigosFinal, baseFinal) = atualizaInimigos inimigosDanoAplicado base mapa t


-- Funções auxiliares
atualizaTorres :: Tempo -> [Torre] -> [Inimigo] -> ([Torre], [Inimigo])
atualizaTorres _ [] inimigos = ([], inimigos)
atualizaTorres t (torre:ts) inimigos =
    let (torreAtualizada, inimigosAtualizados) = atualizaTorre t torre inimigos
        (torresAtualizadas, inimigosFinal) = atualizaTorres t ts inimigosAtualizados
    in (torreAtualizada : torresAtualizadas, inimigosFinal)


atualizaTorre :: Tempo -> Torre -> [Inimigo] -> (Torre, [Inimigo])
atualizaTorre t torre inimigos
    | tempoTorre torre > 0 = (torre {tempoTorre = max 0 (tempoTorre torre - t)}, inimigos)
    | null inimigosZonaTorre = (torre, inimigos)
    | otherwise = (torreAtualizada, inimigosAtualizados)
  where
    inimigosZonaTorre = take (rajadaTorre torre) $ inimigosNoAlcance torre inimigos
    inimigosDanoAplicado = map (atingeInimigo torre) inimigosZonaTorre
    inimigosRestantes = filter (`notElem` inimigosZonaTorre) inimigos
    inimigosAtualizados = filtraInimigosVivos (inimigosDanoAplicado ++ inimigosRestantes)
    torreAtualizada = torre {tempoTorre = cicloTorre torre}

{-| 
    A função 'atualizaPortais' é responsável por atualizar uma lista de objetos do tipo 'Portal' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaPortal' para atualizar cada objeto.

    ==__Exemplos de utilização__
    >> atualizaPortais 2 [Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15}] [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 2, ataqueInimigo = 50, butimInimigo = 10, projeteisInimigo = []}]
    ([Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}], [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}, Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 2, ataqueInimigo = 50, butimInimigo = 10, projeteisInimigo = []}])  
-}
atualizaPortais :: Tempo -> [Portal] -> ([Portal], [Inimigo])
atualizaPortais _ [] = ([], [])
atualizaPortais t (p:ps) = (portalAtualizado : portaisAtualizados, inimigos ++ restoInimigos)
    where
        (portaisAtualizados, restoInimigos) = atualizaPortais t ps
        (portalAtualizado, inimigos) = atualizaPortal t p 

{-|
    A função 'atualizaPortal' é responsável por atualizar um objeto do tipo 'Portal' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaOndas' para atualizar as ondas do portal.

    ==__Exemplos de utilização__
    >>> atualizaPortal 2 (Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15}])
    (Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}], [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}]
-}
atualizaPortal :: Tempo -> Portal -> (Portal, [Inimigo])
atualizaPortal t p = 
    (p { ondasPortal = ondasAtualizadas }, inimigosGerados)
  where
    (ondasAtualizadas, inimigosGerados) = atualizaOndas t (ondasPortal p)

{-|
    A função 'atualizaOndas' é responsável por atualizar uma lista de objetos do tipo 'Onda' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaOnda' para atualizar cada objeto.

    ==__Exemplos de utilização__
    >>> atualizaOndas 2 [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15}]
    ([Onda {inimigosOnda = [], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}], [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}]
-}
atualizaOndas :: Tempo -> [Onda] -> ([Onda], [Inimigo])
atualizaOndas _ [] = ([], [])
atualizaOndas t (o:os) = (oAtualizada : ondasAtualizadas, inimigos ++ restoInimigos)
  where
    (oAtualizada, inimigos) = atualizaOnda t o
    (ondasAtualizadas, restoInimigos) = atualizaOndas t os

{-|
    A função 'atualizaOnda' é responsável por atualizar um objeto do tipo 'Onda' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaInimigos' para atualizar os inimigos da onda.

    ==__Exemplos de utilização__
    >>> atualizaOnda 2 (Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15})
    (Onda {inimigosOnda = [], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}, [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}]
-}
atualizaOnda :: Tempo -> Onda -> (Onda, [Inimigo])
atualizaOnda t onda
    | entradaOnda onda > 0 = (onda {entradaOnda = entradaOnda onda - t}, []) 
    | tempoOnda onda <= 0 && not (null (inimigosOnda onda)) = (onda {inimigosOnda = tail (inimigosOnda onda), tempoOnda = cicloOnda onda}, [head (inimigosOnda onda)])
    | otherwise = 
        (onda { tempoOnda = max 0 (tempoOnda onda - t) }, [])

{-|
    A função 'atualizaInimigos' é responsável por atualizar uma lista de objetos do tipo 'Inimigo' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaInimigo' para atualizar cada objeto.

    ==__Exemplos de utilização__
    >>> atualizaInimigos 2 [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}] (Base {vidaBase=10, posicaoBase = (0,0), creditosBase = 120}) [] 2
    ([], Base {vidaBase = 10, posicaoBase = (0.0,0.0), creditosBase = 120})
    >>> atualizaInimigos 2 [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}] (Base {vidaBase=10, posicaoBase = (0,0), creditosBase = 120}) [] 2
    ([Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}], Base {vidaBase = 10, posicaoBase = (0.0,0.0), creditosBase = 120})
-}
{- atualizaInimigos :: [Inimigo] -- ^ Lista de Inimigos 
                 -> Base -- ^ Base
                 -> Mapa -- ^ Mapa
                 -> Tempo -- ^ Tempo 
                 -> ([Inimigo], Base) -- ^ Lista de retorno de Inimigos e Base
atualizaInimigos [] base _ _  = ([], base)
atualizaInimigos (i:is) base mapa t 
    | inimigoChegouBase i base = atualizaInimigos is baseAtualizada mapa t
    | not (inimigoVivo inimigoAtualizado) = atualizaInimigos is baseComButim mapa t
    | otherwise = (inimigoAtualizado : restantes, novaBase)
  where 
    inimigoAtualizado = atualizaInimigo i base mapa t
    baseAtualizada = base {vidaBase = vidaBase base - ataqueInimigo i}
    baseComButim = base {creditosBase = creditosBase base + butimInimigo i}
    (restantes, novaBase) = atualizaInimigos is baseComButim mapa t -}

atualizaInimigos :: [Inimigo] -- ^ Lista de Inimigos 
                 -> Base -- ^ Base
                 -> Mapa -- ^ Mapa
                 -> Tempo -- ^ Tempo 
                 -> ([Inimigo], Base) -- ^ Lista de retorno de Inimigos e Base
atualizaInimigos [] base _ _  = ([], base)
atualizaInimigos (i:is) base mapa t
    | inimigoChegouBase i base = atualizaInimigos is baseAtualizada mapa t
    | not (inimigoVivo inimigoAtualizado) = atualizaInimigos is baseComButim mapa t
    | otherwise = (inimigoAtualizado : restantes, novaBase)
    where
        inimigoAtualizado = atualizaInimigo i base mapa t
        baseAtualizada = base {vidaBase = vidaBase base - ataqueInimigo i}
        baseComButim = base {creditosBase = creditosBase base + butimInimigo i}
        (restantes, novaBase) = atualizaInimigos is 
            (if inimigoVivo inimigoAtualizado 
            then base 
            else baseComButim) mapa t
{-| 
    A função 'atualizaInimigo' é responsável por atualizar um objeto do tipo 'Inimigo' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaPosicaoInimigo' para atualizar a posição do inimigo e 'handleProjeteisInimigo' para atualizar os projéteis do inimigo.

    ==__Exemplos de utilização__
    >>> atualizaInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}) (Base {vidaBase=10, posicaoBase = (0,0), creditosBase = 120}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}
    >>> atualizaInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}) (Base {vidaBase=10, posicaoBase = (0,0), creditosBase = 120}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}
-}

atualizaInimigo :: Inimigo -> Base -> Mapa -> Tempo -> Inimigo
atualizaInimigo i base mapa t = (atualizaProjetil t inimigoPosicaoAtualizada) {vidaInimigo = novaVida}
    where inimigoPosicaoAtualizada = atualizaPosicaoInimigo base i mapa t
          novaVida = atualizaVida t i 

atualizaVida :: Tempo -> Inimigo -> Float
atualizaVida t i = case map tipoProjetil (projeteisInimigo i) of
    [Fogo] -> vidaInimigo i - 5 * t
    _ -> vidaInimigo i


atualizaProjetil :: Tempo -> Inimigo -> Inimigo
atualizaProjetil t inimigo = inimigo {
  projeteisInimigo = projeteisAtivos
}
  where
    projeteisAtualizados = map (atualizaDuracaoProjetil t) (projeteisInimigo inimigo)
    projeteisAtivos = filter (\p -> duracaoProjetil p > Finita 0 || duracaoProjetil p == Infinita) projeteisAtualizados

    atualizaDuracaoProjetil :: Tempo -> Projetil -> Projetil
    atualizaDuracaoProjetil t p@Projetil { duracaoProjetil = Finita d } =
      p { duracaoProjetil = Finita (max 0 (d - t)) }
    atualizaDuracaoProjetil _ p = p

{-|
    A função 'atualizaPosicaoInimigo' é responsável por atualizar a posição de um 'Inimigo' com o passar do 'Tempo'.

    ==__Exemplos de utilização__
    >>> atualizaPosicaoInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, velocidadeInimigo = 1}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, velocidadeInimigo = 1}
    >>> atualizaPosicaoInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, velocidadeInimigo = 1}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, velocidadeInimigo = 1}
-}
atualizaPosicaoInimigo :: Base
                       -> Inimigo -- ^ Inimigo
                       -> Mapa -- ^ Mapa
                       -> Tempo -- ^ Tempo
                       -> Inimigo -- ^ Inimigo atualizado
atualizaPosicaoInimigo base inimigo@(Inimigo { posicaoInimigo = (x, y), direcaoInimigo = dir, velocidadeInimigo = v}) mapa t =
    inimigo { posicaoInimigo = novaPosicao, direcaoInimigo = novaDir }
    where 
        novaDir = calculaNovaDirecao dir base mapa (x, y) v t
        novaPosicao = calculaNovaPosicao (projeteisInimigo inimigo) novaDir (x, y) mapa v t

-- mod pelo numero de imagens total


{- jogoInimigosTorres :: Jogo
jogoInimigosTorres = Jogo {baseJogo = Base {vidaBase = 500.0, posicaoBase = (5.0,0.0), creditosBase = 9100}, portaisJogo = [Portal {posicaoPortal = (5.0,11.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []}], cicloOnda = 5.0, tempoOnda = 2.3333359, entradaOnda = -3.3332776e-2}]},Portal {posicaoPortal = (7.0,11.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []}], cicloOnda = 5.0, tempoOnda = 2.3333359, entradaOnda = -3.3332776e-2}]}], torresJogo = [Torre {posicaoTorre = (4.0,4.0), danoTorre = 30.0, alcanceTorre = 3.0, rajadaTorre = 3, cicloTorre = 5.0, tempoTorre = 0.0, projetilTorre = Projetil {tipoProjetil = Resina, duracaoProjetil = Infinita}},Torre {posicaoTorre = (2.0,4.0), danoTorre = 40.0, alcanceTorre = 2.0, rajadaTorre = 3, cicloTorre = 4.0, tempoTorre = 0.0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = Finita 5.0}}], mapaJogo = [[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Relva,Relva,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Agua,Agua,Agua,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Agua,Relva,Relva],[Relva,Relva,Relva,Terra,Terra,Terra,Relva,Relva,Agua,Relva,Relva],[Relva,Relva,Relva,Terra,Relva,Relva,Relva,Relva,Agua,Relva,Relva],[Relva,Relva,Relva,Terra,Terra,Terra,Relva,Relva,Relva,Relva,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Relva,Relva,Relva],[Relva,Agua,Agua,Agua,Relva,Terra,Terra,Terra,Relva,Relva,Relva],[Relva,Relva,Agua,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Relva],[Relva,Relva,Agua,Relva,Relva,Terra,Terra,Terra,Relva,Relva,Relva],[Relva,Agua,Agua,Agua,Relva,Terra,Relva,Terra,Relva,Relva,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Terra,Relva,Relva,Relva]], inimigosJogo = [Inimigo {posicaoInimigo = (5.7333326,9.033307), direcaoInimigo = Este, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,8.299964), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []}], lojaJogo = []} -}

