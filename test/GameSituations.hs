module GameSituations where

import LI12425

jogoTeste1 = Jogo {
    mapaJogo = [
      [Terra, Terra, Relva, Relva],
      [Relva, Terra, Terra, Relva],
      [Relva, Agua, Terra, Relva],
      [Agua, Agua, Terra, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (0,0), vidaInimigo = 50, velocidadeInimigo = 5, projeteisInimigo = []},
      Inimigo {posicaoInimigo = (2,2), vidaInimigo = 75, velocidadeInimigo = 8, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (1,1)},
      Torre {posicaoTorre = (3,3)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,3)},
      Portal {posicaoPortal = (0,2)}
    ],
    baseJogo = Base {vidaBase = 100, posicaoBase = (0,0), creditosBase = 100}
  }

-- | Exemplo de jogo 2 - Jogo válido

jogoTeste2 = Jogo {
    mapaJogo = [
      [Relva, Relva, Relva],
      [Terra, Terra, Terra],
      [Agua, Agua, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (1,1), vidaInimigo = 100, velocidadeInimigo = 3, projeteisInimigo = []},
      Inimigo {posicaoInimigo = (1,1), vidaInimigo = 80, velocidadeInimigo = 4, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (0,0)},
      Torre {posicaoTorre = (2,2)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,1)}
    ],
    baseJogo = Base {vidaBase = 100, posicaoBase = (0,0), creditosBase = 100}
  }


-- | Exemplo de jogo 3 - Inimigos não estão sobre terra

jogoTeste3 = Jogo {
    mapaJogo = [
      [Relva, Agua, Terra],
      [Agua, Terra, Terra],
      [Terra, Terra, Relva]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (0,1), vidaInimigo = 60, velocidadeInimigo = 5, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (2,2)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (1,2)}
    ]
  }

  -- | Exemplo de jogo 4 - Projeteis ativos

jogoTeste4 = Jogo {
    mapaJogo = [
      [Terra, Terra, Relva],
      [Relva, Relva, Terra],
      [Terra, Terra, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (2,2), vidaInimigo = 70, velocidadeInimigo = 10, projeteisInimigo = [Projetil {tipoProjetil = Fogo}]},
      Inimigo {posicaoInimigo = (1,1), vidaInimigo = 50, velocidadeInimigo = 8, projeteisInimigo = [Projetil {tipoProjetil = Gelo}, Projetil {tipoProjetil = Resina}]}
    ],
    torresJogo = [
      Torre {posicaoTorre = (0,0)},
      Torre {posicaoTorre = (2,1)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,2)}
    ]
  }


  -- | Exemplo de jogo 5 - Inimigo sobre portal e torre

jogoTeste5 = Jogo {
    mapaJogo = [
      [Terra, Relva, Relva],
      [Terra, Terra, Relva],
      [Relva, Relva, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (1,1), vidaInimigo = 90, velocidadeInimigo = 7, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (1,1)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (1,1)}
    ]
  }

-- | Exemplo de jogo 6 - Vida negativa

jogoTeste6 = Jogo {
    mapaJogo = [
      [Terra, Terra, Relva, Relva],
      [Relva, Terra, Terra, Relva],
      [Relva, Agua, Terra, Relva],
      [Agua, Agua, Terra, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (0,0), vidaInimigo = (-50), velocidadeInimigo = 5, projeteisInimigo = []},
      Inimigo {posicaoInimigo = (2,1), vidaInimigo = 75, velocidadeInimigo = 8, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (1,1)},
      Torre {posicaoTorre = (3,3)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,3)},
      Portal {posicaoPortal = (0,2)}
    ]
  }

-- | Exemplo de jogo 7 - Velocidade negativa

jogoTeste7 = Jogo {
    mapaJogo = [
      [Terra, Terra, Relva, Relva],
      [Relva, Terra, Terra, Relva],
      [Relva, Agua, Terra, Relva],
      [Agua, Agua, Terra, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (0,0), vidaInimigo = 50, velocidadeInimigo = (-5), projeteisInimigo = []},
      Inimigo {posicaoInimigo = (2,1), vidaInimigo = 75, velocidadeInimigo = 8, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (1,1)},
      Torre {posicaoTorre = (3,3)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,3)},
      Portal {posicaoPortal = (0,2)}
    ]
  }

-- | Exemplo de jogo 8 - Projeteis não normalizados

jogoTeste8 = Jogo {
    mapaJogo = [
      [Terra, Terra, Relva, Relva],
      [Relva, Terra, Terra, Relva],
      [Relva, Agua, Terra, Relva],
      [Agua, Agua, Terra, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (0,1), vidaInimigo = 50, velocidadeInimigo = 5, projeteisInimigo = [Projetil {tipoProjetil = Fogo}, Projetil {tipoProjetil = Fogo}]},
      Inimigo {posicaoInimigo = (2,1), vidaInimigo = 75, velocidadeInimigo = 8, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (1,1)},
      Torre {posicaoTorre = (3,3)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,3)},
      Portal {posicaoPortal = (0,2)}
    ]
  }


-- | Exemplo de jogo 9 - Projeteis normalizados

jogoTeste9 = Jogo {
    mapaJogo = [
      [Terra, Terra, Relva, Relva],
      [Relva, Terra, Terra, Relva],
      [Relva, Agua, Terra, Relva],
      [Agua, Agua, Terra, Terra]
    ],
    inimigosJogo = [
      Inimigo {posicaoInimigo = (0,0), vidaInimigo = 50, velocidadeInimigo = 5, projeteisInimigo = [(Projetil {tipoProjetil = Fogo}), (Projetil {tipoProjetil = Fogo})]},
      Inimigo {posicaoInimigo = (2,2), vidaInimigo = 75, velocidadeInimigo = 8, projeteisInimigo = []}
    ],
    torresJogo = [
      Torre {posicaoTorre = (1,1)},
      Torre {posicaoTorre = (3,3)}
    ],
    portaisJogo = [
      Portal {posicaoPortal = (2,3)},
      Portal {posicaoPortal = (0,2)}
    ]
  }