module TData.TDataTarefa3 where

import LI12425

jogo1 :: Jogo
jogo1 = Jogo {
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

jogoInimigosTorres :: Jogo
jogoInimigosTorres = Jogo {baseJogo = Base {vidaBase = 500.0, posicaoBase = (5.0,0.0), creditosBase = 9100}, portaisJogo = [Portal {posicaoPortal = (5.0,11.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (5.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []}], cicloOnda = 5.0, tempoOnda = 2.3333359, entradaOnda = -3.3332776e-2}]},Portal {posicaoPortal = (7.0,11.0), ondasPortal = [Onda {inimigosOnda = [Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,11.0), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []}], cicloOnda = 5.0, tempoOnda = 2.3333359, entradaOnda = -3.3332776e-2}]}], torresJogo = [Torre {posicaoTorre = (4.0,4.0), danoTorre = 30.0, alcanceTorre = 3.0, rajadaTorre = 3, cicloTorre = 5.0, tempoTorre = 0.0, projetilTorre = Projetil {tipoProjetil = Resina, duracaoProjetil = Infinita}},Torre {posicaoTorre = (2.0,4.0), danoTorre = 40.0, alcanceTorre = 2.0, rajadaTorre = 3, cicloTorre = 4.0, tempoTorre = 0.0, projetilTorre = Projetil {tipoProjetil = Fogo, duracaoProjetil = Finita 5.0}}], mapaJogo = [[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Relva,Relva,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Agua,Agua,Agua,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Agua,Relva,Relva],[Relva,Relva,Relva,Terra,Terra,Terra,Relva,Relva,Agua,Relva,Relva],[Relva,Relva,Relva,Terra,Relva,Relva,Relva,Relva,Agua,Relva,Relva],[Relva,Relva,Relva,Terra,Terra,Terra,Relva,Relva,Relva,Relva,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Relva,Relva,Relva],[Relva,Agua,Agua,Agua,Relva,Terra,Terra,Terra,Relva,Relva,Relva],[Relva,Relva,Agua,Relva,Relva,Relva,Relva,Terra,Relva,Relva,Relva],[Relva,Relva,Agua,Relva,Relva,Terra,Terra,Terra,Relva,Relva,Relva],[Relva,Agua,Agua,Agua,Relva,Terra,Relva,Terra,Relva,Relva,Relva],[Relva,Relva,Relva,Relva,Relva,Terra,Relva,Terra,Relva,Relva,Relva]], inimigosJogo = [Inimigo {posicaoInimigo = (5.7333326,9.033307), direcaoInimigo = Este, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []},Inimigo {posicaoInimigo = (7.0,8.299964), direcaoInimigo = Norte, vidaInimigo = 200.0, velocidadeInimigo = 1.0, ataqueInimigo = 100.0, butimInimigo = 200, projeteisInimigo = []}], lojaJogo = []}

