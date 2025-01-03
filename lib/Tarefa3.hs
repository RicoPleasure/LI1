{-|
Module      : Tarefa3
Description : Mecânica do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 3 de LI1 em 2024/25.
-}
module Tarefa3 where

import LI12425

{- | Função que atualiza o estado do jogo, tendo em conta o tempo que passou desde a última atualização. 

== Exemplo de utilização:

-}
atualizaJogo :: Tempo -- ^ Tempo 
             -> Jogo -- ^ Jogo
             -> Jogo -- ^ Jogo de retorno
atualizaJogo t 
    jogo@Jogo {
        mapaJogo = mapa,
        baseJogo = base,
        portaisJogo = portais,
        torresJogo = torres,
        inimigosJogo = inimigos
    } =  Jogo {
        mapaJogo = mapa,
        baseJogo = baseAtualizada,
        portaisJogo = portais,
        torresJogo = torres,
        inimigosJogo = novosInimigos
    }
    where 
        (novosInimigos, baseAtualizada) = handleInimigos inimigos base t

handleInimigos :: [Inimigo] -- ^ Lista de Inimigos 
               -> Base -- ^ Base
               -> Float -- ^ Tempo 
               -> ([Inimigo],Base) -- ^ Lista de retorno de Inimigos
handleInimigos [] base _  = ([],base)
handleInimigos (i:is) base t 
    | inimigoChegouBase i base = handleInimigos is baseAtualizada t
    | not (inimigoVivo inimigoAtualizado) = handleInimigos is baseComButim t
    | otherwise = (inimigoAtualizado : restantes, novaBase)
        where 
            inimigoAtualizado = handleInimigo i base t
            baseAtualizada = base {vidaBase = vidaBase base - ataqueInimigo i}
            baseComButim  = base {creditosBase = creditosBase base + butimInimigo i}
            (restantes, novaBase) = handleInimigos is base t

handleInimigo :: Inimigo -- ^ Inimigo 
              -> Base -- ^ Base
              -> Float -- ^ Tempo 
              -> Inimigo -- ^ Inimigo de retorno
handleInimigo i base t = atualizaPosicaoInimigo inimigosComEfeitosAplicados t
    where 
        inimigosComEfeitosAplicados = handleProjeteisInimigo i t
    
inimigoChegouBase :: Inimigo -- ^ Inimigo 
                  -> Base -- ^ Base
                  -> Bool -- ^ Bool
inimigoChegouBase 
    (Inimigo {posicaoInimigo = (xInimigo,yInimigo)}) 
    (Base {posicaoBase = (xBase,yBase)}) 
    = yInimigo == yBase && xInimigo == xBase

inimigoVivo :: Inimigo -- ^ Inimigo 
            -> Bool -- ^ Bool
inimigoVivo (Inimigo {vidaInimigo = vida}) = vida > 0

atualizaPosicaoInimigo :: Inimigo -- ^ Inimigo
                       -> Float -- ^ Tempo
                       -> Inimigo -- ^ Inimigo atualizado
atualizaPosicaoInimigo inimigo@(Inimigo { posicaoInimigo = (x, y), direcaoInimigo = dir, velocidadeInimigo = v }) t =
    inimigo { posicaoInimigo = novaPosicao }
  where
    novaPosicao = case dir of
        Norte -> (x, y - v * t)
        Sul   -> (x, y + v * t)
        Este  -> (x - v * t, y)
        Oeste -> (x + v * t, y)

handleProjeteisInimigo :: Inimigo -- ^ Inimigo
                        -> Float -- ^ Tempo
                        -> Inimigo -- ^ Inimigo atualizado com efeitos de projéteis
handleProjeteisInimigo inimigo@(Inimigo { posicaoInimigo = posicao, direcaoInimigo = direcao, projeteisInimigo = projeteis, velocidadeInimigo = velocidade, vidaInimigo = vida }) t = 
    case projeteis of
        [Projetil {tipoProjetil = Gelo, duracaoProjetil = duracao}] -> inimigoGelo duracao
        [Projetil {tipoProjetil = Fogo, duracaoProjetil = duracao}] -> inimigoFogo duracao
        [Projetil {tipoProjetil = Resina, duracaoProjetil = duracao}] -> inimigoResina duracao
        _ -> inimigo
  where
    inimigoGelo duracao = inimigo 
        { projeteisInimigo = [Projetil {tipoProjetil = Gelo, duracaoProjetil = addDuracao duracao (Finita (-t))}],
          velocidadeInimigo = 0 
        }
    inimigoFogo duracao = inimigo 
        { projeteisInimigo = [Projetil {tipoProjetil = Fogo, duracaoProjetil = addDuracao duracao (Finita (-t))}],
          vidaInimigo = vida - 15 
        }
    inimigoResina duracao = inimigo 
        { projeteisInimigo = [Projetil {tipoProjetil = Resina, duracaoProjetil = addDuracao duracao (Finita (-t))}],
          velocidadeInimigo = max 0 (velocidade - 5) 
        }
    