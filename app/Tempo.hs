module Tempo where

import ImmutableTowers
import LI12425
import Desenhar
import Tarefa3
import Utils.Utilitarios


reageTempo :: Tempo -> Estado -> IO Estado
reageTempo t (Estado {cena = ModoJogo Resumed ,immutableTowers = ImmutableTowers { jogo = jogo }, tema = temaAtual}) = return $ (Estado {cena = ModoJogo Resumed, immutableTowers = ImmutableTowers { jogo = novoJogo }, tema = temaAtual})
    where novoJogo = atualizaJogo t jogo

reageTempo t (Estado {cena = Debug ,immutableTowers = ImmutableTowers { jogo = jogo }, tema = temaAtual}) = return $ (Estado {cena = Debug, immutableTowers = ImmutableTowers { jogo = novoJogo }, tema = temaAtual})
    where novoJogo = atualizaJogo t jogo

reageTempo t e@(Estado {cena = ModoJogo Pause ,immutableTowers = ImmutableTowers { jogo = jogo }}) = return $ e

reageTempo _ e = return $ e