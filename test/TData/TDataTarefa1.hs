module TData.TDataTarefa1 where

import LI12425

-- Valid test-game-configuration


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
    inimigosJogo = [Inimigo {
        posicaoInimigo = (1,0),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = []
    }],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua



-- Testdata for objects of the type 'Torre'

jogoTorreTerrenoInvalido :: Jogo
jogoTorreTerrenoInvalido = Jogo {
    mapaJogo = [
        [r, t, r, a, a],
        [r, t, t, t, a],
        [r, r, a, t, r],
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

jogoTorreAlcanceInvalido :: Jogo
jogoTorreAlcanceInvalido = Jogo {
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
            alcanceTorre = 0,
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

jogoTorreRajadaInvalido :: Jogo
jogoTorreRajadaInvalido = Jogo {
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
            alcanceTorre = 2,
            rajadaTorre = 0,
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

jogoTorresSobrepostas :: Jogo
jogoTorresSobrepostas = Jogo {
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
            alcanceTorre = 2,
            rajadaTorre = 2,
            cicloTorre = 10,
            tempoTorre = 5,
            projetilTorre = Projetil {
                tipoProjetil = Fogo,
                duracaoProjetil = Finita 20
            }
        },
        Torre {
            posicaoTorre = (2,2),
            danoTorre = 5,
            alcanceTorre = 2,
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


-- Testdata for Map testing

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
            posicaoTorre = (2,1),
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



-- Testdata for objects of the type 'Portal'

jogoValidoInvalidPortalPos :: Jogo
jogoValidoInvalidPortalPos = Jogo {
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

-- Testdata for objects of the type 'Base'

jogoInvalidBasePos :: Jogo
jogoInvalidBasePos = Jogo {
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
        posicaoBase = (0,0),
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

-- Testdata for objects of the type 'Inimigo'

jogoValidoInimigosDentroSemProjetil :: Jogo
jogoValidoInimigosDentroSemProjetil = Jogo {
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
    inimigosJogo = [Inimigo {
        posicaoInimigo = (1,0),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = []
        }],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoInvalidoInimigosDentroComProjetil :: Jogo
jogoInvalidoInimigosDentroComProjetil = Jogo {
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
    inimigosJogo = [Inimigo {
        posicaoInimigo = (1,0),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 20
        },
        Projetil {
            tipoProjetil = Resina,
            duracaoProjetil = Finita 30
        }
        ]
        }],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua


jogoValidoInimigosForaComProjetil :: Jogo
jogoValidoInimigosForaComProjetil = Jogo {
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
    inimigosJogo = [Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 20
        },
        Projetil {
            tipoProjetil = Resina,
            duracaoProjetil = Finita 30
        }]
    }],
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoInvalidoInimigosForaComProjeteisNaoNormalizados :: Jogo
jogoInvalidoInimigosForaComProjeteisNaoNormalizados = Jogo {
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
    inimigosJogo = [
    Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 20
        },
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 30
        }
        ]
    }],
    
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua


jogoInvalidoInimigosComCombinacaoInvalidaProjetil :: Jogo
jogoInvalidoInimigosComCombinacaoInvalidaProjetil = Jogo {
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
    inimigosJogo = [
    Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 20
        },
        Projetil {
            tipoProjetil = Fogo,
            duracaoProjetil = Finita 30
        }
        ]
    }],
    
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoValidoProjetilFogo :: Jogo
jogoValidoProjetilFogo = Jogo {
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
    inimigosJogo = [
    Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Fogo,
            duracaoProjetil = Finita 20
        }
        ]
    }
    ],
    
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua

jogoValidoProjetilGelo :: Jogo
jogoValidoProjetilGelo = Jogo {
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
    inimigosJogo = [
    Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 20
        }
        ]
    }
    ],
    
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua


jogoValidoProjetilResina :: Jogo
jogoValidoProjetilResina = Jogo {
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
    inimigosJogo = [
    Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = [
        Projetil {
            tipoProjetil = Resina,
            duracaoProjetil = Finita 20
        }
        ]
    }
    ],
    
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua


jogoValidoSemProjetil :: Jogo
jogoValidoSemProjetil = Jogo {
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
    inimigosJogo = [
    Inimigo {
        posicaoInimigo = (1,1),
        direcaoInimigo = Norte,
        vidaInimigo = 200,
        velocidadeInimigo = 30,
        ataqueInimigo = 50,
        butimInimigo = 50,
        projeteisInimigo = []
    }
    ],
    
    lojaJogo = []
} where 
    r = Relva
    t = Terra
    a = Agua
