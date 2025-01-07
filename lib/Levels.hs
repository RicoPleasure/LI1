module Levels where

import LI12425
import Utils.Utilitarios

level1 :: Jogo
level1 = Jogo {
        baseJogo = Base {
            vidaBase = 100,
            posicaoBase = (5,0),
            creditosBase = 350
        },
        portaisJogo = [ Portal 
        {
                posicaoPortal = (5,10),
                ondasPortal = [Onda {
                        inimigosOnda = [
                        Inimigo {
                                posicaoInimigo = (5,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        }, 
                        Inimigo {
                                posicaoInimigo = (5,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (5,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (5,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = [
                        ]},
                        Inimigo {
                                posicaoInimigo = (5,10),
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
        

        },Portal 
        {
                posicaoPortal = (7,10),
                ondasPortal = [Onda {
                        inimigosOnda = [
                        Inimigo {
                                posicaoInimigo = (7,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 4,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        }, 
                        Inimigo {
                                posicaoInimigo = (7,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 4,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (7,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 4,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (7,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 4,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = [
                        ]},
                        Inimigo {
                                posicaoInimigo = (7,10),
                                direcaoInimigo = Norte,
                                vidaInimigo = 100,
                                velocidadeInimigo = 4,
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
                [r, r, r, t, t, t, r, r, a, r, r],
                [r, r, r, t, r, r, r, r, a, r, r],
                [r, r, r, t, t, t, r, r, a, r, r],
                [r, r, r, r, r, t, r, r, r, r, r],
                [r, a, a, a, r, t, t, t, r, r, r],
                [r, r, a, r, r, r, r, t, r, r, r],
                [r, r, a, r, r, t, t, t, r, r, r],
                [r, a, a, a, r, t, r, t, r, r, r],
                [r, r, r, r, r, t, r, t, r, r, r]
        ],

        inimigosJogo = [],
        lojaJogo = []
    }

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
                        vidaInimigo = 120,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
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
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
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
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,9),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 2,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 4,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 2,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 100,
                        velocidadeInimigo = 4,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,1),
                        direcaoInimigo = Este,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 2,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 4,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 2,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 4,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 2,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 4,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (0,0),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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

level5 :: Jogo
level5 = Jogo {
    baseJogo = Base {
        vidaBase = 100,
        posicaoBase = (7,10),
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
                        vidaInimigo = 120,
                        velocidadeInimigo = 2,
                        ataqueInimigo = 120,
                        butimInimigo = 300,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 100,
                        velocidadeInimigo = 4,
                        ataqueInimigo = 100,
                        butimInimigo = 200,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 150,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 150,
                        butimInimigo = 400,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    }
                    ,
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
                        projeteisInimigo = []
                    },
                    Inimigo {
                        posicaoInimigo = (3,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 80,
                        velocidadeInimigo = 3,
                        ataqueInimigo = 80,
                        butimInimigo = 150,
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
                        posicaoInimigo = (5,10),
                        direcaoInimigo = Norte,
                        vidaInimigo = 3000,
                        velocidadeInimigo = 1,
                        ataqueInimigo = 99999,
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

mapaInicialEditorDeMapas :: Jogo
mapaInicialEditorDeMapas =  Jogo {
        baseJogo = Base {
            vidaBase = 100,
            posicaoBase = (0,0),
            creditosBase = 350
        },
        portaisJogo = [],
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


t :: Terreno 
t = Terra

r :: Terreno
r = Relva

a :: Terreno
a = Agua

v :: Terreno
v = Vazio