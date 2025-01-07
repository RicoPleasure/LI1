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
        (novosInimigos, baseAtualizada) = handleInimigos inimigos base mapa t

handleInimigos :: [Inimigo] -- ^ Lista de Inimigos 
               -> Base -- ^ Base
               -> Mapa -- ^ Mapa
               -> Float -- ^ Tempo 
               -> ([Inimigo],Base) -- ^ Lista de retorno de Inimigos
handleInimigos [] base _ _  = ([],base)
handleInimigos (i:is) base mapa t 
    | inimigoChegouBase i base = handleInimigos is baseAtualizada mapa t
    | not (inimigoVivo inimigoAtualizado) = handleInimigos is baseComButim mapa t
    | otherwise = (inimigoAtualizado : restantes, novaBase)
        where 
            inimigoAtualizado = handleInimigo i base mapa t
            baseAtualizada = base {vidaBase = vidaBase base - ataqueInimigo i}
            baseComButim  = base {creditosBase = creditosBase base + butimInimigo i}
            (restantes, novaBase) = handleInimigos is base mapa t

handleInimigo :: Inimigo -- ^ Inimigo 
              -> Base -- ^ Base
              -> Mapa -- ^ Mapa
              -> Float -- ^ Tempo 
              -> Inimigo -- ^ Inimigo de retorno
handleInimigo i base mapa t = atualizaPosicaoInimigo inimigoComEfeitosAplicados mapa t
    where 
        inimigoComEfeitosAplicados = handleProjeteisInimigo i t
    
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
                       -> Mapa -- ^ Mapa
                       -> Float -- ^ Tempo
                       -> Inimigo -- ^ Inimigo atualizado
atualizaPosicaoInimigo inimigo@(Inimigo { posicaoInimigo = (x, y), direcaoInimigo = dir, velocidadeInimigo = v }) mapa t =
    inimigo { posicaoInimigo = novaPosicao }
    where 
        novaDir = calculaNovaDirecao dir mapa (x,y) v t 
        novaPosicao = calculaNovaPosicao novaDir (x, y) mapa v t

calculaNovaPosicao :: Direcao -- ^ Direção
                   -> Posicao -- ^ Posição
                   -> Mapa -- ^ Mapa
                   -> Float -- ^ Velocidade
                   -> Float -- ^ Tempo
                   -> Posicao -- ^ Nova Posição
calculaNovaPosicao dir (x, y) mapa v t = case dir of
    Norte -> (x, y - v * t)
    Sul   -> (x, y + v * t)
    Este  -> (x + v * t, y)
    Oeste -> (x - v * t, y)
   
calculaNovaDirecao :: Direcao -- ^ Direção
                   -> Mapa -- ^ Mapa
                   -> Posicao -- ^ Posição
                   -> Float -- ^ Velocidade
                   -> Float -- ^ Tempo
                   -> Direcao -- ^ Nova Direção
calculaNovaDirecao dir mapa (x,y) v t
    |   isValidPos (move dir (move dir (x,y) v t) v t) mapa && isTerra (move dir (move dir (x,y) v t) v t) mapa = dir
    |   otherwise = case dir of
        Norte -> if isValidPos (x, y - v * t) mapa && isTerra (x, y - v * t) mapa then Norte else dir
        Sul   -> if isValidPos (x, y + v * t) mapa && isTerra (x, y + v * t) mapa then Sul else dir
        Este  -> if isValidPos (x - v * t, y) mapa && isTerra (x - v * t, y) mapa then Este else dir
        Oeste -> if isValidPos (x + v * t, y) mapa && isTerra (x + v * t, y) mapa then Oeste else dir

move :: Direcao -> Posicao -> Float -> Float -> Posicao
move dir (x, y) v t = case dir of
    Norte -> (x, y - v * t)
    Sul   -> (x, y + v * t)
    Este  -> (x - v * t, y)
    Oeste -> (x + v * t, y)

isValidPos :: Posicao -> Mapa -> Bool
isValidPos (x, y) mapa = x >= 0 && y >= 0 && (floor y) < length mapa && (floor x) < length (head mapa)

isTerra :: Posicao -> Mapa -> Bool
isTerra (x, y) mapa = case getPosicaoMapa (x, y) mapa of
    Terra -> True
    _     -> False

getPosicaoMapa :: Posicao -- ^ Posição
               -> Mapa -- ^ Mapa
               -> Terreno -- ^ Terreno
getPosicaoMapa (x, y) mapa = (mapa !! (floor y)) !! (floor x)

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