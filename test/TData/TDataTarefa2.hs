module TData.TDataTarefa2 where

import LI12425

-- Torres
torreGelo :: Torre
torreGelo = Torre {
  danoTorre = 5,
  projetilTorre = Projetil {
    tipoProjetil = Gelo,
    duracaoProjetil = Finita 10
  }
}

torreFogo :: Torre
torreFogo = Torre {
  danoTorre = 5,
  projetilTorre = Projetil {
    tipoProjetil = Fogo,
    duracaoProjetil = Finita 10
  }
}

torreResina :: Torre
torreResina = Torre {
  danoTorre = 5,
  projetilTorre = Projetil {
    tipoProjetil = Resina,
    duracaoProjetil = Finita 10
  }
}

-- Inimigos

inimigoSemProjeteis :: Inimigo
inimigoSemProjeteis = Inimigo {
    vidaInimigo = 0,
    projeteisInimigo = []
}

inimigoComFogo :: Inimigo
inimigoComFogo = Inimigo {
    vidaInimigo = 0,
    projeteisInimigo = [
        Projetil {
            tipoProjetil = Fogo,
            duracaoProjetil = Finita 10
        }
    ]
}

inimigoComGelo :: Inimigo
inimigoComGelo = Inimigo {
    vidaInimigo = 0,
    projeteisInimigo = [
        Projetil {
            tipoProjetil = Gelo,
            duracaoProjetil = Finita 10
        }
    ]
}

inimigoComResina :: Inimigo
inimigoComResina = Inimigo {
    vidaInimigo = 0,
    projeteisInimigo = [
        Projetil {
            tipoProjetil = Resina,
            duracaoProjetil = Finita 10
        }
    ]
}

