{-|
Module      : Tarefa3
Description : Mecânica do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 3 de LI1 em 2024/25.
-}
module Tarefa3 where

import LI12425
import Tarefa2 (ativaInimigo)

{-|
    A função 'atualizaJogo' é responsável por aplicar a um 'Jogo', com o passar do tempo, as alterações previstas

    ==Funções desempenhadas
    * Colocar inimigos de portais ativos no 'Jogo'
    * Atualizar as propriedades dependentes do tempo como p.ex. a 'tempoOnda' e 'entradaOnda'

    ==__Exemplos de utilização__
    >>> atualizaJogo 12 (Jogo { mapaJogo = [], inimigosJogo = [], lojaJogo = [], baseJogo = Base { vidaBase=10, posicaoBase = (0,0), creditosBase = 120 }, torresJogo = [], portaisJogo=[Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15}] }]})
    Jogo {baseJogo = Base {vidaBase = 10.0, posicaoBase = (0.0,0.0), creditosBase = 120}, portaisJogo = [Portal {posicaoPortal = (0.0,0.0), ondasPortal = [Onda {inimigosOnda = [], cicloOnda = 15.0, tempoOnda = 15.0, entradaOnda = -1.0}]}], torresJogo = [], mapaJogo = [], inimigosJogo = [Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}], lojaJogo = []}
    >>> atualizaJogo 12 (Jogo { mapaJogo = [], inimigosJogo = [], lojaJogo = [], baseJogo = Base { vidaBase=10, posicaoBase = (0,0), creditosBase = 120 }, torresJogo = [], portaisJogo=[Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}] }]})
    Jogo {baseJogo = Base {vidaBase = 10.0, posicaoBase = (0.0,0.0), creditosBase = 120}, portaisJogo = [Portal {posicaoPortal = (0.0,0.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}], cicloOnda = 15.0, tempoOnda = 14.0, entradaOnda = -1.0}]}], torresJogo = [], mapaJogo = [], inimigosJogo = [], lojaJogo = []}
-}
atualizaJogo :: Tempo -> Jogo -> Jogo
atualizaJogo t j = 
        j {portaisJogo = newPortais, inimigosJogo = newInimigos}
    where
        (newPortais, newInimigos) = atualizaPortais (portaisJogo j) (inimigosJogo j)

-- Funções auxiliares

{-|
    A função 'atualizaPortais' é responsável por atualizar uma lista de objetos do tipo 'Portal' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaPortal' para atualizar cada objeto.

    ==__Exemplos de utilização__
    >>> atualizaPortais [] []
    ([], [])
    >>> atualizaPortais [] [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 2, ataqueInimigo = 50, butimInimigo = 10, projeteisInimigo = []}]
    ([], [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 2, ataqueInimigo = 50, butimInimigo = 10, projeteisInimigo = []}])
    >>> atualizaPortais [Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 0, cicloOnda = 15}] [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 2, ataqueInimigo = 50, butimInimigo = 10, projeteisInimigo = []}]
    ([Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}], [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}, Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 2, ataqueInimigo = 50, butimInimigo = 10, projeteisInimigo = []}])
-}
atualizaPortais :: [Portal] -> [Inimigo] -> ([Portal], [Inimigo])
atualizaPortais [] is= ([], is)
atualizaPortais (p:ps) is = (newPortal : updatedPortais, newInimigos ++ newInimigos2)
    where
        (newPortal, newInimigos) = atualizaPortal p is
        (updatedPortais, newInimigos2) = atualizaPortais ps is

{-|
    A função 'atualizaPortal' atualiza um 'Portal' com o decorrer do 'Tempo'.

    ==Alterações efetuadas
    *Atualização dos argumentos dependentes do 'Tempo' como p.ex. 'tempoOnda' e 'entradaOnda'
    *Ativação de Inimigos de Portais que cumpram os requisitos para tal.

    ==__Exemplos de utilização__
    >>> atualizaPortal (Portal { posicaoPortal = (0,0), ondasPortal = [Onda { inimigosOnda = [Inimigo { posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 10, projeteisInimigo = [] }], cicloOnda = 15, tempoOnda = 2, entradaOnda = -1 }] }) []
    (Portal { posicaoPortal = (0,0), ondasPortal = [Onda { inimigosOnda = [Inimigo { posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 10, projeteisInimigo = [] }], cicloOnda = 15, tempoOnda = 0, entradaOnda = -2 }] }, [])
    >>> atualizaPortal (Portal { posicaoPortal = (0,0), ondasPortal = [Onda { inimigosOnda = [Inimigo { posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 10, projeteisInimigo = [] }], cicloOnda = 15, tempoOnda = 0, entradaOnda = -1 }] }) []
    (Portal { posicaoPortal = (0,0), ondasPortal = [Onda { inimigosOnda = [], cicloOnda = 15, tempoOnda = 15, entradaOnda = -2 }] }, [Inimigo { posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 10, projeteisInimigo = [] }])
-}
atualizaPortal :: Portal -> [Inimigo] -> (Portal, [Inimigo])
atualizaPortal p = ativaInimigo (p {ondasPortal = atualizaOndas (ondasPortal p)})

{-|
    A função 'atualizaOndas' modifica uma lista de objetos do tipo 'Onda' com o decorrer do 'Tempo'.

    ==Alterações efetuadas
    * Enquanto o valor 'entradaOnda' for maior que 0, esse decresce conforme o tempo e os restantes valores permanecem inalterados
    * Quando a 'entradaOnda' for igual ou menor que 0, também o valor 'tempoOnda' decresce conforme o tempo.

    ==__Exemplos de utilização__
    >>> atualizaOndas []
    []
    >>> atualizaOndas [Onda {inimigosOnda = [], cicloOnda = 10, tempoOnda = 10, entradaOnda = 2}]
    [Onda {inimigosOnda = [], cicloOnda = 10, tempoOnda = 10, entradaOnda = 1}]
    >>> atualizaOndas [Onda {inimigosOnda = [], cicloOnda = 10, tempoOnda = 10, entradaOnda = 2}, Onda {inimigosOnda = [], cicloOnda = 10, entradaOnda = 0, tempoOnda = 10}]
    [Onda {inimigosOnda = [], cicloOnda = 10, tempoOnda = 10, entradaOnda = 1}, Onda {inimigosOnda = [], cicloOnda = 10, entradaOnda = -1, tempoOnda = 9}]
-}
atualizaOndas :: [Onda] -> [Onda]
atualizaOndas [] = []
atualizaOndas (o:os)
    | entrada <= 0 = o {entradaOnda = entrada - 1, tempoOnda = tempo - 1} : atualizaOndas os
    | otherwise = o {entradaOnda = entrada - 1} : atualizaOndas os
    where
        entrada = entradaOnda o
        tempo = tempoOnda o
