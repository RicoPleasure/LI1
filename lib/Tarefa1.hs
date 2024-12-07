{-|
Module      : Tarefa1
Description : Invariantes do Jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>


Módulo para a realização da Tarefa 1 de LI1 em 2024/25.
-}
module Tarefa1 where

import LI12425
import Utils.Utilitarios
import Utils.UtilitariosPortal
import Utils.UtilitariosBase

{-|
  A função 'validaJogo' valida, recorrendo a múltiplas validações feitas por funções auxiliares, se um dado estado de Jogo é valido

  ==__Objetos validados__
  * 'Portal': recorrendo á função 'validaPortais'. 
  * 'Base': recorrendo á função 'validaBase'.
  * 'Inimigos': recorrendo á função TODO:. 
  * 'Torre': recorrendo á função TODO:.
  * 'Mapa': recorrendo á função TODO:.

  Para além da validação de cada tipo de objetos presente no 'Jogo', a função 'validaJogo' também valida se existem sobreposições entre os vários objetos, recorrendo á função 'verificaCollision'

  ==__Exemplos de utilização__
  >>> validaJogo Jogo {mapaJogo = [], baseJogo = Base {posicaoBase = (2,0)}, portaisJogo = [Portal {posicaoPortal = (0,0)}], torresJogo = []}
  False
  >>> validaJogo Jogo {mapaJogo = [[Terra, Terra, Terra, Relva]], baseJogo = Base {posicaoBase = (2,0)}, portaisJogo = [], torresJogo = []}
  False
  >>> validaJogo Jogo {mapaJogo = [[Terra, Terra, Terra, Relva]], baseJogo = Base {posicaoBase = (2,0)}, portaisJogo = [Portal {posicaoPortal = (0,0), ondasPortal = []}], torresJogo = []}
  True
  
  TODO: Assim que todas as validações estiverem implementadas, verificar, alterar e adicionar mais exemplos.
-}
validaJogo :: Jogo -> Bool
validaJogo Jogo {
              mapaJogo = _,
              baseJogo = _,
              portaisJogo = [],
              torresJogo = _ } = False
validaJogo Jogo {
              mapaJogo = [],
              baseJogo = _,
              portaisJogo = _,
              torresJogo = _ } = False
validaJogo j@(Jogo { 
              mapaJogo = mapa,
              baseJogo = base,
              portaisJogo = portais,
              torresJogo = torres}) =
                validaPortais portais mapa base 
                && not (verificaSobreposicoes j)
                && validaBase mapa (posicaoBase base) (creditosBase base)

{-|
  A função 'verificaSobreposicoes' verifica, para cada objetos presente num 'Jogo', se esse está sobreposto a outro objeto que não devia.

  ==__Exemplos de utilização__
  >>> verificaSobreposicoes Jogo {baseJogo = Base {posicaoBase = (0,0)}, portaisJogo = [Portal {posicaoPortal = (1,0)}], torresJogo = [Torre {posicaoTorre = (2,0)}]}
  False
  >>> verificaSobreposicoes Jogo {baseJogo = Base {posicaoBase = (0,0)}, portaisJogo = [Portal {posicaoPortal = (0,0)}], torresJogo = [Torre {posicaoTorre = (2,0)}]}
  True
  >>> verificaSobreposicoes Jogo {baseJogo = Base {posicaoBase = (0,0)}, portaisJogo = [Portal {posicaoPortal = (2,0)}], torresJogo = [Torre {posicaoTorre = (2,0)}]}
  True
-}
verificaSobreposicoes :: Jogo -> Bool
verificaSobreposicoes (Jogo {baseJogo = base, portaisJogo = portais, torresJogo = torres}) = 
  verificaColisaoBasePortais portais torres base

