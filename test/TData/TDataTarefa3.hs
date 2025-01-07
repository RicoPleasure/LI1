module TData.TDataTarefa3 where

import LI12425

jTest1 :: Jogo
jTest1 = Jogo { 
    mapaJogo = [], 
    inimigosJogo = [], 
    lojaJogo = [], 
    baseJogo = Base { 
        vidaBase=10, 
        posicaoBase = (0,0), 
        creditosBase = 120 
    }, 
    torresJogo = [], 
    portaisJogo=[
        Portal {
            posicaoPortal = (0,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Norte, 
                            vidaInimigo = 10, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        }
                    ], 
                    entradaOnda = 0, 
                    tempoOnda = 0, 
                    cicloOnda = 15
                }
            ] 
        }
    ]
}

jTestMultipleOndas :: Jogo
jTestMultipleOndas = Jogo { 
    mapaJogo = [], 
    inimigosJogo = [], 
    lojaJogo = [], 
    baseJogo = Base { 
        vidaBase=10, 
        posicaoBase = (0,0), 
        creditosBase = 120 
    }, 
    torresJogo = [], 
    portaisJogo=[
        Portal {
            posicaoPortal = (0,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Norte, 
                            vidaInimigo = 10, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        },
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Sul, 
                            vidaInimigo = 12, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        }
                    ], 
                    entradaOnda = 0, 
                    tempoOnda = 0, 
                    cicloOnda = 15
                },
                Onda {
                    inimigosOnda = [
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Norte, 
                            vidaInimigo = 10, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        }
                    ], 
                    entradaOnda = 10, 
                    tempoOnda = 15, 
                    cicloOnda = 15
                }
            ] 
        }
    ]
}

jTestTempoOndaNotOver :: Jogo
jTestTempoOndaNotOver = Jogo { 
    mapaJogo = [], 
    inimigosJogo = [], 
    lojaJogo = [], 
    baseJogo = Base { 
        vidaBase=10, 
        posicaoBase = (0,0), 
        creditosBase = 120 
    }, 
    torresJogo = [], 
    portaisJogo=[
        Portal {
            posicaoPortal = (0,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Norte, 
                            vidaInimigo = 10, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        }
                    ], 
                    entradaOnda = 0, 
                    tempoOnda = 15, 
                    cicloOnda = 15
                }
            ] 
        }
    ]
}

jTestEntradaOndaNotOver :: Jogo
jTestEntradaOndaNotOver = Jogo { 
    mapaJogo = [], 
    inimigosJogo = [], 
    lojaJogo = [], 
    baseJogo = Base { 
        vidaBase=10, 
        posicaoBase = (0,0), 
        creditosBase = 120 
    }, 
    torresJogo = [], 
    portaisJogo=[
        Portal {
            posicaoPortal = (0,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Norte, 
                            vidaInimigo = 10, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        }
                    ], 
                    entradaOnda = 2, 
                    tempoOnda = 15, 
                    cicloOnda = 15
                }
            ] 
        }
    ]
}

jTestAtualizaMultiplePortais :: Jogo
jTestAtualizaMultiplePortais = Jogo { 
    mapaJogo = [], 
    inimigosJogo = [], 
    lojaJogo = [], 
    baseJogo = Base { 
        vidaBase=10, 
        posicaoBase = (0,0), 
        creditosBase = 120 
    }, 
    torresJogo = [], 
    portaisJogo=[
        Portal {
            posicaoPortal = (0,0), 
            ondasPortal = [
                Onda {
                    inimigosOnda = [
                        Inimigo {
                            posicaoInimigo = (0,0), 
                            direcaoInimigo = Norte, 
                            vidaInimigo = 10, 
                            velocidadeInimigo = 1, 
                            ataqueInimigo = 10, 
                            butimInimigo = 2, 
                            projeteisInimigo = []
                        }
                    ], 
                    entradaOnda = 2, 
                    tempoOnda = 15, 
                    cicloOnda = 15
                }
            ] 
        },
        Portal {
            posicaoPortal = (1,0), 
            ondasPortal = [] 
        }
    ]
}
