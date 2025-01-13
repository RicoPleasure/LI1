{-|
Module      : Utils.UtilitariosEditor
Description : Coleção de funções utilitarias para o editor de mapas
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com o editor de mapas.
-}
module Utils.UtilitariosEditor where

import LI12425
import Utils.UtilitariosTorre
import Utils.Utilitarios

{-|
    A função 'insereTerrenoNaPosicao' insere um 'Terreno' numa dada posição do 'Mapa'.

    ==__Exemplos de utilização__
    >>> insereTerrenoNaPosicao [[Terra, Relva], [Agua, Terra]] (1,1) Relva
    [[Terra, Relva], [Agua, Relva]]
-}
insereTerrenoNaPosicao :: Mapa -> (Int, Int) -> Terreno -> Mapa
insereTerrenoNaPosicao mapa (x, y) terreno =
    [ if i == y then atualizaLinha linha x terreno else linha
    | (linha, i) <- zip mapa [0..]
    ]
  where
    atualizaLinha linha x terreno =
        [ if j == x then terreno else elem
        | (elem, j) <- zip linha [0..]
        ]

{-| 
    A função 'isValidTower' verifica se uma dada posição é válida no mapa.

    ==__Exemplos de utilização__
    >>> isValidTower (1,1) [[Terra, Relva], [Agua, Terra]] [Torre {posicaoTorre = (0,0), alcanceTorre = 1, danoTorre = 5, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = 15}}]
    True
-}
isValidTower :: Posicao -> Mapa -> [Torre] -> Bool
isValidTower (x,y) mapa torres = checkPositionRelva (x,y) mapa && not (verificaCollisionTorres torres)

{-| 
    A função 'inserePortalNaLista' insere um 'Portal' numa dada posição da lista de 'Portais'.

    ==__Exemplos de utilização__
    >>> inserePortalNaLista [] (1,1)
    [Portal {posicaoPortal = (1,1), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (1,1), vidaInimigo = 10, velocidadeInimigo = 1, direcaoInimigo = Norte}], cicloOnda = 3, tempoOnda = 20, entradaOnda = 20}]}]
-}
inserePortalNaLista :: [Portal] -> Posicao -> [Portal]  
inserePortalNaLista portais (x,y) = portais ++ [Portal {posicaoPortal = (x,y), ondasPortal = [
    Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (x,y),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 2,
                tempoOnda = 2,
                entradaOnda = 3
            }
]}] 

{-|
    A função 'validaPortalEditor' verifica se uma dada posição é válida no mapa.
    
    ==__Exemplos de utilização__
    >>> validaPortalEditor (1,1) [[Terra, Relva], [Agua, Terra]]
    True
    >>> validaPortalEditor (1,2) [[Terra, Relva], [Agua, Terra]]
    False
-}
validaPortalEditor :: (Int,Int) -> Mapa -> Bool
validaPortalEditor (x,y) m =
    validaPosicaoObjeto (fromIntegral x, fromIntegral y) m && checkPositionTerra (fromIntegral x, fromIntegral y) m

