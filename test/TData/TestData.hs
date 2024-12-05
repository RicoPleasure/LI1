module TData.TestData where

import LI12425

jogoValido :: Jogo
jogoValido = Jogo {
    mapaJogo = [
        [r, t, r, a, a],
        [r, t, t, t, a],
        [r, r, r, t, r],
        [r, r, r, t, t]
    ],
    portaisJogo = [
        Portal {
            posicaoPortal = (1,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = 50
                },
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = -1
                }
        ]},
        Portal {
            posicaoPortal = (1,1), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = 50
                },
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = -1
                }
        ]}
    ],
    baseJogo = Base {
        vidaBase = 5,
        posicaoBase = (4,3),
        creditosBase = 100
    },
    torresJogo = [
        Torre {
            posicaoTorre = (2,2),
            danoTorre = 5,
            alcanceTorre = 5,
            rajadaTorre = 2,
            cicloTorre = 10,
            tempoTorre = 5,
            projetilTorre = Projetil {
                tipoProjetil = Fogo,
                duracaoProjetil = Finita 20
            }
        }
    ],
    inimigosJogo = [],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoValidoMapTest :: Jogo
jogoValidoMapTest = Jogo {
    mapaJogo = [
        [r, t, r, a, a],
        [t, t, r, r, a],
        [t, r, t, t, t],
        [t, t, t, r, t]
    ],
    portaisJogo = [
        Portal {
            posicaoPortal = (1,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = 50
                },
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = -1
                }
        ]}
    ],
    baseJogo = Base {
        vidaBase = 5,
        posicaoBase = (4,3),
        creditosBase = 100
    },
    torresJogo = [
        Torre {
            posicaoTorre = (2,2),
            danoTorre = 5,
            alcanceTorre = 5,
            rajadaTorre = 2,
            cicloTorre = 10,
            tempoTorre = 5,
            projetilTorre = Projetil {
                tipoProjetil = Fogo,
                duracaoProjetil = Finita 20
            }
        }
    ],
    inimigosJogo = [],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoInvalidPortalPos :: Jogo
jogoInvalidPortalPos = Jogo {
    mapaJogo = [
        [r, t, r, a, a],
        [r, r, r, r, a],
        [r, r, r, r, a],
        [r, r, r, r, a]
    ],
    portaisJogo = [
        Portal {
            posicaoPortal = (1,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = 50
                },
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = -1
                }
        ]}
    ],
    baseJogo = Base {
        vidaBase = 5,
        posicaoBase = (3,3),
        creditosBase = 100
    },
    torresJogo = [
        Torre {
            posicaoTorre = (2,2),
            danoTorre = 5,
            alcanceTorre = 5,
            rajadaTorre = 2,
            cicloTorre = 10,
            tempoTorre = 5,
            projetilTorre = Projetil {
                tipoProjetil = Fogo,
                duracaoProjetil = Finita 20
            }
        }
    ],
    inimigosJogo = [],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoNoPortals :: Jogo
jogoNoPortals = Jogo {
    mapaJogo = [
        [r, t, r, a, a],
        [r, t, t, t, a],
        [r, r, r, t, r],
        [r, r, r, t, t]
    ],
    portaisJogo = [],
    baseJogo = Base {
        vidaBase = 5,
        posicaoBase = (4,3),
        creditosBase = 100
    },
    torresJogo = [
        Torre {
            posicaoTorre = (2,2),
            danoTorre = 5,
            alcanceTorre = 5,
            rajadaTorre = 2,
            cicloTorre = 10,
            tempoTorre = 5,
            projetilTorre = Projetil {
                tipoProjetil = Fogo,
                duracaoProjetil = Finita 20
            }
        }
    ],
    inimigosJogo = [],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoNoMap :: Jogo
jogoNoMap = Jogo {
    mapaJogo = [],
    portaisJogo = [
        Portal {
            posicaoPortal = (1,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = 50
                },
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = -1
                }
        ]},
        Portal {
            posicaoPortal = (1,1), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = 50
                },
                Onda {
                    inimigosOnda = [], -- TODO: define inimigos
                    cicloOnda = 0,
                    tempoOnda = 0,
                    entradaOnda = -1
                }
        ]}
    ],
    baseJogo = Base {
        vidaBase = 5,
        posicaoBase = (4,3),
        creditosBase = 100
    },
    torresJogo = [
        Torre {
            posicaoTorre = (2,2),
            danoTorre = 5,
            alcanceTorre = 5,
            rajadaTorre = 2,
            cicloTorre = 10,
            tempoTorre = 5,
            projetilTorre = Projetil {
                tipoProjetil = Fogo,
                duracaoProjetil = Finita 20
            }
        }
    ],
    inimigosJogo = [],
    lojaJogo = []
}

