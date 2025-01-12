module TData.TDataTarefa2 where

import LI12425

-- Torres
torreGelo :: Torre
torreGelo = Torre {
  posicaoTorre = (3,3),
  danoTorre = 20,
  projetilTorre = Projetil {
    tipoProjetil = Gelo,
    duracaoProjetil = Finita 1
  },
  alcanceTorre = 5,
  rajadaTorre = 3,
  cicloTorre = 5,
  tempoTorre = 0
}

torreFogo :: Torre
torreFogo = Torre {
  posicaoTorre = (0,0),
  danoTorre = 40,
  projetilTorre = Projetil {
    tipoProjetil = Fogo,
    duracaoProjetil = Finita 5
  },
  alcanceTorre = 2,
  rajadaTorre = 3,
  cicloTorre = 4,
  tempoTorre = 0
}

torreResina :: Torre
torreResina = Torre {
  posicaoTorre = (1,1),
  danoTorre = 30,
  projetilTorre = Projetil {
    tipoProjetil = Resina,
    duracaoProjetil = Infinita
  },
  alcanceTorre = 3,
  rajadaTorre = 3,
  cicloTorre = 6,
  tempoTorre = 0
}

-- Inimigos

inimigoSemProjeteis :: Inimigo
inimigoSemProjeteis = Inimigo {
    posicaoInimigo = (0,0),
    direcaoInimigo = Norte,
    velocidadeInimigo = 1,
    ataqueInimigo = 100,
    vidaInimigo = 100,
    butimInimigo = 10,
    projeteisInimigo = []
}

inimigoComFogo :: Inimigo
inimigoComFogo = Inimigo {
    posicaoInimigo = (0,0),
    direcaoInimigo = Norte,
    velocidadeInimigo = 1,
    ataqueInimigo = 100,    
    vidaInimigo = 100,
    butimInimigo = 10,
    projeteisInimigo = [
        Projetil {
            tipoProjetil = Fogo,
            duracaoProjetil = Finita 5
        }
    ]
}

inimigoComGelo :: Inimigo
inimigoComGelo = Inimigo {
    posicaoInimigo = (0,0),
    direcaoInimigo = Norte,
    velocidadeInimigo = 1,
    ataqueInimigo = 100,
    vidaInimigo = 100,
    butimInimigo = 10,
    projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 1
        }
    ]
}

inimigoComResina :: Inimigo
inimigoComResina = Inimigo {
    posicaoInimigo = (0,0),
    direcaoInimigo = Norte,
    velocidadeInimigo = 1,
    ataqueInimigo = 100,
    vidaInimigo = 100,
    projeteisInimigo = [
        Projetil {
            tipoProjetil = Resina,
            duracaoProjetil = Infinita
        }
    ]
}

-- Portais
portalComOndaAtivaEInimigoParaAtivar :: Portal
portalComOndaAtivaEInimigoParaAtivar = Portal {
  posicaoPortal = (0,0),
  ondasPortal = [
    Onda {
      entradaOnda = 0,
      tempoOnda = 0,
      cicloOnda = 15,
      inimigosOnda = [
        inimigoComFogo
      ]
    }
  ]
}

portalComOndaAtivaEInimigoParaAtivarMultOndas :: Portal
portalComOndaAtivaEInimigoParaAtivarMultOndas = Portal {
  posicaoPortal = (0,0),
  ondasPortal = [
    Onda {
      entradaOnda = 1,
      tempoOnda = 0,
      cicloOnda = 15,
      inimigosOnda = [
        inimigoComFogo
      ]
    },
    Onda {
      entradaOnda = 0,
      tempoOnda = 0,
      cicloOnda = 15,
      inimigosOnda = [
        inimigoComFogo
      ]
    }
  ]
}

portalComOndaAtivaSemInimigoParaAtivar :: Portal
portalComOndaAtivaSemInimigoParaAtivar = Portal {
  posicaoPortal = (0,0),
  ondasPortal = [
    Onda {
      entradaOnda = 0,
      tempoOnda = 1,
      cicloOnda = 15,
      inimigosOnda = [
        inimigoComFogo
      ]
    }
  ]
}

portalSemOndaAtiva :: Portal
portalSemOndaAtiva = Portal {
  posicaoPortal = (0,0),
  ondasPortal = [
    Onda {
      entradaOnda = 1,
      tempoOnda = 0,
      cicloOnda = 15,
      inimigosOnda = [
        inimigoComFogo
      ]
    }
  ]
}

tOnda :: Onda
tOnda = Onda {
      entradaOnda = 0,
      tempoOnda = 0,
      cicloOnda = 15,
      inimigosOnda = [
        inimigoComFogo
      ]
    }


jogoValido :: Jogo
jogoValido = Jogo {
        baseJogo = Base {
            vidaBase = 500,
            posicaoBase = (5,0),
            creditosBase = 10000
        },
        portaisJogo = [ Portal 
        {
                posicaoPortal = (5,11),
                ondasPortal = [Onda {
                        inimigosOnda = [
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 200,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        }, 
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 200,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 200,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = []
                        },
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 200,
                                velocidadeInimigo = 1,
                                ataqueInimigo = 100,
                                butimInimigo = 200,
                                projeteisInimigo = [
                        ]},
                        Inimigo {
                                posicaoInimigo = (5,11),
                                direcaoInimigo = Norte,
                                vidaInimigo = 200,
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
        

        }
        ],
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
    where
        r = Relva
        t = Terra
        a = Agua

jogoTerminado :: Jogo
jogoTerminado = Jogo {
        baseJogo = Base {
            vidaBase = 500,
            posicaoBase = (5,0),
            creditosBase = 10000
        },
        portaisJogo = [ Portal 
        {
                posicaoPortal = (5,11),
                ondasPortal = [Onda {
                        inimigosOnda = [],
                        cicloOnda = 5,
                        tempoOnda = 2,
                        entradaOnda = 2
                }
                ]
        

        }
        ],
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
    where
        r = Relva
        t = Terra
        a = Agua