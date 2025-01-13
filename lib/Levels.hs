{-|
Module      : Levels
Description : Levels do jogo
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Este módulo contém a definição dos níveis do jogo.
-}
module Levels where

import LI12425
import Utils.Utilitarios

{-|
    Nível 1 do jogo.
-}
level1 :: Jogo
level1 = Jogo {
        baseJogo = Base {
            vidaBase = 500,
            posicaoBase = (5,0),
            creditosBase = 500
        },
        portaisJogo = [ Portal 
        {
                posicaoPortal = (5,11),
                ondasPortal = [Onda {
                        inimigosOnda = [
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        }, 
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = [
                        ]},
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        }        
                        ],
                        cicloOnda = 5,
                        tempoOnda = 2,
                        entradaOnda = 2
                }
                ]
        

        }],
        torresJogo = [] ,
        mapaJogo = [
                [r, r, r, r, r, t, r, r, r, r, r],
                [r, r, r, r, r, t, r, a, a, a, r],
                [r, r, r, r, r, t, r, r, a, r, r],
                [r, r, r, t, t, t, r, r, a, r, r],
                [r, r, r, t, r, r, r, r, a, r, r],
                [r, r, r, t, t, t, r, r, r, r, r],
                [r, r, r, r, r, t, r, r, r, r, r],
                [r, a, a, a, r, t, t, t, r, r, r],
                [r, r, a, r, r, r, r, t, r, r, r],
                [r, r, a, r, r, t, t, t, r, r, r],
                [r, a, a, a, r, t, r, r, r, r, r],
                [r, r, r, r, r, t, r, r, r, r, r]
        ],

        inimigosJogo = [],
        lojaJogo = []
    }

{-|
    Nível 2 do jogo.
-}
level2 :: Jogo
level2 = Jogo {
    baseJogo = Base {
        vidaBase = 100,
        posicaoBase = (10,1),
        creditosBase = 500
    },
    portaisJogo = [ Portal {
        posicaoPortal = (0,9),
        ondasPortal = [
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 3,
                tempoOnda = 4,
                entradaOnda = 5
            },
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 4,
                tempoOnda = 4,
                entradaOnda = 30
            }
        ]
    }],
    torresJogo = [],
    mapaJogo = [
                [r, r, r, r, r, r, r, r, r, r, r],
                [r, a, r, r, r, r, r, t, t, t, t],
                [r, a, r, t, t, t, t, t, r, r, r],
                [r, a, r, t, r, r, r, r, r, r, r],
                [r, a, r, t, t, t, r, a, a, a, r],
                [r, a, r, r, r, t, r, r, r, a, r],
                [r, a, a, a, r, t, t, t, r, a, r],
                [r, r, r, r, r, r, r, t, r, a, r],
                [r, r, r, t, t, t, t, t, r, a, r],
                [t, t, t, t, r, r, r, r, r, a, r],
                [r, r, r, r, r, r, r, r, r, r, r]
        ],
    inimigosJogo = [],
    lojaJogo = []
}

{-|
    Nível 3 do jogo.
-}
level3 :: Jogo
level3 = Jogo {
    baseJogo = Base {
        vidaBase = 100,
        posicaoBase = (10,1),
        creditosBase = 500
    },
    portaisJogo = [ Portal {
        posicaoPortal = (0,1),
        ondasPortal = [
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 8,
                tempoOnda = 15,
                entradaOnda = 15
            },
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 4,
                tempoOnda = 4,
                entradaOnda = 90
            }
        ]
    }],
    torresJogo = [],
    mapaJogo = [
                [r, r, r, r, r, r, r, r, r, r, r],
                [t, t, t, r, r, r, r, r, t, t, t],
                [r, r, t, r, t, t, t, r, t, r, r],
                [a, r, t, r, t, a, t, r, t, r, a],
                [a, r, t, a, t, a, t, a, t, r, a],
                [a, r, t, a, t, a, t, a, t, r, a],
                [a, r, t, a, t, a, t, a, t, r, a],
                [a, r, t, a, t, r, t, a, t, r, a],
                [a, r, t, t, t, r, t, t, t, r, a],
                [a, r, r, r, r, r, r, r, r, r, a],
                [a, a, a, a, a, a, a, a, a, a, a]
        ],
    inimigosJogo = [],
    lojaJogo = []
}

{-|
    Nível 4 do jogo.
-}
level4 :: Jogo
level4 = Jogo {
    baseJogo = Base {
        vidaBase = 100,
        posicaoBase = (5,5),
        creditosBase = 500
    },
    portaisJogo = [ Portal {
        posicaoPortal = (0,0),
        ondasPortal = [
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 4,
                tempoOnda = 4,
                entradaOnda = 4
            },
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                ],
                cicloOnda = 3,
                tempoOnda = 3,
                entradaOnda = 15
            },
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
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
                entradaOnda = 60
            }
        ]
    }],
    torresJogo = [],
    mapaJogo = [
                [t, t, a, a, a, a, a, a, a, a, a],
                [a, t, r, t, t, t, t, t, t, t, a],
                [a, t, r, t, r, r, r, r, r, t, a],
                [a, t, r, t, r, t, t, t, r, t, a],
                [a, t, r, t, a, t, a, t, r, t, a],
                [a, t, r, t, a, t, a, t, r, t, a],
                [a, t, r, t, a, a, a, t, r, t, a],
                [a, t, r, t, t, t, t, t, r, t, a],
                [a, t, r, r, r, r, r, r, r, t, a],
                [a, t, t, t, t, t, t, t, t, t, a],
                [a, a, a, a, a, a, a, a, a, a, a]
        ],
    inimigosJogo = [],
    lojaJogo = []
}

{-|
    Nível 5 do jogo.
-}
level5 :: Jogo
level5 = Jogo {
    baseJogo = Base {
        vidaBase = 100,
        posicaoBase = (7,11),
        creditosBase = 500
    },
    portaisJogo = [ Portal {
        posicaoPortal = (3,10),
        ondasPortal = [
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
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
            },
            Onda {
                inimigosOnda = [
                        Inimigo {
                        posicaoInimigo = (7,11),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                }        
                ],
                cicloOnda = 10,
                tempoOnda = 20,
                entradaOnda = 20
        }
        ]
    }],
    torresJogo = [],
    mapaJogo = [
        [a, a, r, t, t, t, t, t, r, a, a],
        [a, r, t, t, r, r, r, t, t, r, a],
        [r, t, t, r, r, r, r, r, t, t, r],
        [r, t, r, a, t, r, a, t, r, t, r],
        [r, t, r, a, t, r, a, t, r, t, r],
        [r, t, r, a, t, r, a, t, r, t, r],
        [r, t, t, r, r, r, r, r, t, t, r],
        [r, r, t, t, r, r, r, t, t, r, r],
        [r, r, r, t, a, a, a, t, r, r, r],
        [a, r, r, t, a, a, a, t, r, r, a],
        [a, a, r, t, a, a, a, t, r, a, a]
        ],

    inimigosJogo = [],
    lojaJogo = []
}

{-|
    Estado inicial do editor de mapas do jogo.
-}
mapaInicialEditorDeMapas :: Jogo
mapaInicialEditorDeMapas =  Jogo {
        baseJogo = Base {
            vidaBase = 100,
            posicaoBase = (0,0),
            creditosBase = 500
        },
        portaisJogo = [ Portal {
        posicaoPortal = (3,10),
        ondasPortal = [
            Onda {
                inimigosOnda = [
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
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
            },
            Onda {
                inimigosOnda = [
                        Inimigo {
                        posicaoInimigo = (7,11),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                }        
                ],
                cicloOnda = 10,
                tempoOnda = 20,
                entradaOnda = 20
        }
        ]
    }],
        torresJogo = [],
        mapaJogo = [
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v],
          [v, v, v, v, v, v, v, v, v, v, v]
        ]  ,
        inimigosJogo = [],
        lojaJogo = [
                (100, Torre 
                        {
                                posicaoTorre = (0,0), 
                                danoTorre = 20, 
                                alcanceTorre = 2,
                                rajadaTorre = 1,
                                cicloTorre = 1,
                                tempoTorre = 1,
                                projetilTorre = Projetil 
                                        {
                                                tipoProjetil = Fogo,
                                                duracaoProjetil = 1
                                        
                                                }})
                                ,
                (200, Torre 
                        {
                                posicaoTorre = (0,0), 
                                danoTorre = 20, 
                                alcanceTorre = 2,
                                rajadaTorre = 1,
                                cicloTorre = 1,
                                tempoTorre = 1,
                                projetilTorre = Projetil 
                                        {
                                                tipoProjetil = Gelo,
                                                duracaoProjetil = 1
                                        
                                                }})
                                ,
                (300, Torre 
                        {
                                posicaoTorre = (0,0), 
                                danoTorre = 20, 
                                alcanceTorre = 2,
                                rajadaTorre = 1,
                                cicloTorre = 1,
                                tempoTorre = 1,
                                projetilTorre = Projetil 
                                        {
                                                tipoProjetil = Resina,
                                                duracaoProjetil = 1
                                        
                                                }})]
        }

{-|
    Terreno terra
-}
t :: Terreno 
t = Terra

{-|
    Terreno relva
-}
r :: Terreno
r = Relva

{-|
    Terreno água
-}
a :: Terreno
a = Agua

{-|
    Terreno vazio (utilizado para o editor de mapas)
-}
v :: Terreno
v = Vazio