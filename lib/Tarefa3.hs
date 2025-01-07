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
    >>> atualizaJogo 12 (Jogo { mapaJogo = [], inimigosJogo = [], lojaJogo = [], baseJogo = Base { vidaBase=10, posicaoBase = (0,0), creditosBase = 120 }, torresJogo = [], portaisJogo=[Portal {posicaoPortal = (0,0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}], entradaOnda = 0, tempoOnda = 15, cicloOnda = 15}] }]})
    Jogo {baseJogo = Base {vidaBase = 10.0, posicaoBase = (0.0,0.0), creditosBase = 120}, portaisJogo = [Portal {posicaoPortal = (0.0,0.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}], cicloOnda = 15.0, tempoOnda = 14.0, entradaOnda = -1.0}]}], torresJogo = [], mapaJogo = [], inimigosJogo = [], lojaJogo = []}
-}
atualizaJogo :: Tempo -- ^ Tempo 
             -> Jogo -- ^ Jogo
             -> Jogo -- ^ Jogo de retorno
atualizaJogo t 
    j@Jogo {
        mapaJogo = mapa,
        baseJogo = base,
        portaisJogo = portais,
        torresJogo = torres,
        inimigosJogo = inimigos
    } = j {portaisJogo = newPortais, inimigosJogo = proximaPosicao, baseJogo = baseAtualizada}
    where
        (newPortais, newInimigos) = atualizaPortais t (portaisJogo j)
        (proximaPosicao, baseAtualizada) = atualizaInimigos (inimigos ++ newInimigos) base mapa t

-- Funções auxiliares

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
atualizaOndas t (o:os) =
    (oAtualizada : ondasAtualizadas, inimigos ++ restoInimigos)
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
    | entradaOnda onda > 0 = 
        (onda {entradaOnda = entradaOnda onda - t}, []) 
    | tempoOnda onda <= 0 && not (null (inimigosOnda onda)) = 
        (onda {inimigosOnda = tail (inimigosOnda onda), tempoOnda = cicloOnda onda}, [head (inimigosOnda onda)])
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
atualizaInimigos :: [Inimigo] -- ^ Lista de Inimigos 
               -> Base -- ^ Base
               -> Mapa -- ^ Mapa
               -> Float -- ^ Tempo 
               -> ([Inimigo],Base) -- ^ Lista de retorno de Inimigos
atualizaInimigos [] base _ _  = ([],base)
atualizaInimigos (i:is) base mapa t 
    | inimigoChegouBase i base = atualizaInimigos is baseAtualizada mapa t
    | not (inimigoVivo inimigoAtualizado) = atualizaInimigos is baseComButim mapa t
    | otherwise = (inimigoAtualizado : restantes, novaBase)
        where 
            inimigoAtualizado = atualizaInimigo i base mapa t
            baseAtualizada = base {vidaBase = vidaBase base - ataqueInimigo i}
            baseComButim  = base {creditosBase = creditosBase base + butimInimigo i}
            (restantes, novaBase) = atualizaInimigos is base mapa t

{-| 
    A função 'atualizaInimigo' é responsável por atualizar um objeto do tipo 'Inimigo' com o passar do 'Tempo'. Para tal, recorre á função 'atualizaPosicaoInimigo' para atualizar a posição do inimigo e 'handleProjeteisInimigo' para atualizar os projéteis do inimigo.

    ==__Exemplos de utilização__
    >>> atualizaInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}) (Base {vidaBase=10, posicaoBase = (0,0), creditosBase = 120}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}
    >>> atualizaInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, vidaInimigo = 10, velocidadeInimigo = 1, ataqueInimigo = 10, butimInimigo = 2, projeteisInimigo = []}) (Base {vidaBase=10, posicaoBase = (0,0), creditosBase = 120}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, vidaInimigo = 10.0, velocidadeInimigo = 1.0, ataqueInimigo = 10.0, butimInimigo = 2, projeteisInimigo = []}
-}
atualizaInimigo :: Inimigo -- ^ Inimigo 
              -> Base -- ^ Base
              -> Mapa -- ^ Mapa
              -> Float -- ^ Tempo 
              -> Inimigo -- ^ Inimigo de retorno
atualizaInimigo i base mapa t = atualizaPosicaoInimigo inimigoComEfeitosAplicados mapa t
    where 
        inimigoComEfeitosAplicados = handleProjeteisInimigo i t

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

{-|
    A função 'atualizaPosicaoInimigo' é responsável por atualizar a posição de um 'Inimigo' com o passar do 'Tempo'.

    ==__Exemplos de utilização__
    >>> atualizaPosicaoInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, velocidadeInimigo = 1}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, velocidadeInimigo = 1}
    >>> atualizaPosicaoInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, velocidadeInimigo = 1}) [] 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, velocidadeInimigo = 1}
-}
atualizaPosicaoInimigo :: Inimigo -- ^ Inimigo
                       -> Mapa -- ^ Mapa
                       -> Float -- ^ Tempo
                       -> Inimigo -- ^ Inimigo atualizado
atualizaPosicaoInimigo inimigo@(Inimigo { posicaoInimigo = (x, y), direcaoInimigo = dir, velocidadeInimigo = v }) mapa t =
    inimigo { posicaoInimigo = novaPosicao, direcaoInimigo = novaDir }
    where 
        novaDir = calculaNovaDirecao dir mapa (x, y) v t 
        novaPosicao = calculaNovaPosicao novaDir (x, y) mapa v t

{-|
    A função 'atualizaInimigo' é responsável por atualizar um objeto do tipo 'Inimigo' com o passar do 'Tempo'. Para tal, recorre á função 'handleProjeteisInimigo' para atualizar os projéteis do inimigo.

    ==__Exemplos de utilização__
    >>> atualizaInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 5}]}) 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 3.0}], velocidadeInimigo = 1.0}
    >>> atualizaInimigo (Inimigo {posicaoInimigo = (0,0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 5}]}) 2
    Inimigo {posicaoInimigo = (0.0,0.0), direcaoInimigo = Norte, projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = Finita 3.0}], velocidadeInimigo = 1.0}
-}
handleProjeteisInimigo :: Inimigo -> Float -> Inimigo
handleProjeteisInimigo inimigo@(Inimigo { posicaoInimigo = posicao, direcaoInimigo = direcao, projeteisInimigo = projeteis, velocidadeInimigo = velocidade, vidaInimigo = vida }) t =
    case projeteis of
        [Projetil {tipoProjetil = Gelo, duracaoProjetil = duracao}] ->
            let novaVelocidade = if duracao > 0 then 0 else velocidade
                novaDuracao = duracao - (Finita t)
            in inimigo
                { projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = novaDuracao}],
                  velocidadeInimigo = novaVelocidade }
        [Projetil {tipoProjetil = Fogo, duracaoProjetil = duracao}] -> 
            inimigo { projeteisInimigo = [Projetil {tipoProjetil = Fogo, duracaoProjetil = duracao}], vidaInimigo = vida - 15 }
        [Projetil {tipoProjetil = Resina, duracaoProjetil = duracao}] -> 
            inimigo { projeteisInimigo = [Projetil {tipoProjetil = Resina, duracaoProjetil = duracao}], velocidadeInimigo = max 0 (velocidade - 5) }
        _ -> inimigo