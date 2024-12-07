{-|
Module      : Utils.UtilitariosInimigo
Description : Coleção de funções utilitarias necessárias para trabalhar com os inimigos
Copyright   : Enrico Silva Prazeres <a112068@alunos.uminho.pt>
              Leandro Filipe Lourenço Carvalho <a112021@alunos.uminho.pt>

Utilitarios necessários para o trabalho com os inimigos no Jogo. Estes utilitarios são necessários p.ex para a validação das torres.
-}
module Utils.UtilitariosInimigo where

import LI12425

{-|
    A função 'reduzVidaInimigo' reduz a vida de um 'Inimigo' por um dado valor

    ==__Exemplos de utilização__
    >>> reduzVidaInimigo (Inimigo {vidaInimigo = 10}) 5
    Inimigo {vidaInimigo = 5}
    >>> reduzVidaInimigo (Inimigo {vidaInimigo = 10}) 15
    Inimigo {vidaInimigo = (-5)}
    >>> reduzVidaInimigo (Inimigo {vidaInimigo = 10}) 10
    Inimigo {vidaInimigo = 0}
-}
reduzVidaInimigo :: Inimigo -> Float -> Inimigo
reduzVidaInimigo inimigo dano = 
        inimigo {vidaInimigo = vida - dano}
    where
        vida = vidaInimigo inimigo

{-|
    A função 'handleHitByProjetil' altera o 'Inimigo' conforme o esperado, quando este é atingido por um 'Projetil' e recorre para tal à função auxiliar 'handleNewProjetil'

    ==__Observações__
    * Quando um inimigo já se encontra sob o efeito de 'Fogo' ou 'Gelo' e é atingido por um projetil do outro tipo ('Fogo' ou 'Gelo'), estes cancelam os seus efeitos mutuamente.
    * A combinação dos projeteis 'Fogo' e 'Resina' dobra a duração do efeito do 'Projetil' do tipo 'Fogo'
    * Quando o inimigo se encontra sob o efeito de um certo 'Projetil' e é atingido por outro do mesmo tipo, as suas durações são somada.

    ==__Exemplos de utilização__
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [] }) (Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 })
    Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }) (Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 })
    Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 20 }] }
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }) (Projetil { tipoProjetil = Resina, duracaoProjetil = 2 })
    Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 20 }] }
    >>> handleHitByProjetil (Inimigo { projeteisInimigo = [Projetil { tipoProjetil = Fogo, duracaoProjetil = 10 }] }) (Projetil { tipoProjetil = Gelo, duracaoProjetil = 2 })
    Inimigo { projeteisInimigo = [] }
-}
handleHitByProjetil :: Inimigo -> Projetil -> Inimigo
handleHitByProjetil inimigo projetil = 
        inimigo { projeteisInimigo = handleNewProjetil projeteis projetil }
    where
        projeteis = projeteisInimigo inimigo

{-|
    A função 'handleNewProjetil' serve como função auxiliar para a função 'handleHitByProjetil' e decide o que fazer com o Projetil que atingiu o Inimigo consultando para tal os projeteis já presentes no Inimigo.

    ==__Exemplos de utilização__
    >>> handleNewProjetil [] (Projetil {tipoProjetil = Fogo, duracaoProjetil = 5})
    [Projetil {tipoProjetil = Fogo, duracaoProjetil = 5}]
    >>> handleNewProjetil [Projetil {tipoProjetil = Fogo, duracaoProjetil = 1}] (Projetil {tipoProjetil = Fogo, duracaoProjetil = 5})
    [Projetil {tipoProjetil = Fogo, duracaoProjetil = 6}]
    >>> handleNewProjetil [Projetil {tipoProjetil = Gelo, duracaoProjetil = 1}] (Projetil {tipoProjetil = Fogo, duracaoProjetil = 5})
    []
    >>> handleNewProjetil [Projetil {tipoProjetil = Fogo, duracaoProjetil = 1}] (Projetil {tipoProjetil = Resina, duracaoProjetil = 5})
    [Projetil {tipoProjetil = Fogo, duracaoProjetil = 2}]
-}
handleNewProjetil :: [Projetil] -> Projetil -> [Projetil]
handleNewProjetil [] p = [p]
handleNewProjetil ((Projetil {tipoProjetil = Fogo, duracaoProjetil = dur}):xs) 
            (Projetil {tipoProjetil = Fogo, duracaoProjetil = durNew}) = (Projetil {tipoProjetil = Fogo, duracaoProjetil = dur+durNew}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Gelo, duracaoProjetil = dur}):xs) 
            (Projetil {tipoProjetil = Gelo, duracaoProjetil = durNew}) = (Projetil {tipoProjetil = Gelo, duracaoProjetil = dur+durNew}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Resina, duracaoProjetil = dur}):xs) 
            (Projetil {tipoProjetil = Resina, duracaoProjetil = durNew}) = (Projetil {tipoProjetil = Resina, duracaoProjetil = dur+durNew}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Resina}):xs) 
            (Projetil {tipoProjetil = Fogo, duracaoProjetil = durFogo}) = (Projetil {tipoProjetil = Fogo, duracaoProjetil = 2*durFogo}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Fogo, duracaoProjetil = durFogo}):xs) 
            (Projetil {tipoProjetil = Resina}) = (Projetil {tipoProjetil = Fogo, duracaoProjetil = 2*durFogo}) : xs
handleNewProjetil ((Projetil {tipoProjetil = Fogo}):xs) (Projetil {tipoProjetil = Gelo}) = xs
handleNewProjetil ((Projetil {tipoProjetil = Gelo}):xs) (Projetil {tipoProjetil = Fogo}) = xs
handleNewProjetil l _ = l

