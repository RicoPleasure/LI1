module Tempo where

import ImmutableTowers
import LI12425
import Desenhar
import Tarefa2
import Tarefa3
import Utils.Utilitarios


reageTempo :: Tempo -> ImmutableTowers -> IO ImmutableTowers
reageTempo t (ImmutableTowers {cena = ModoJogo Resumed , jogo = jogo, tema = temaAtual, slotSave = slot}) = 
    let novoJogo = atualizaJogo t jogo
        cenaFinal = if ganhouJogo novoJogo 
                        then TelaFinal (Vitoria MenuVitoria)
                        else TelaFinal (Derrota MenuDerrota)
    in if (terminouJogo novoJogo) 
        then return (ImmutableTowers {cena = cenaFinal, jogo = novoJogo, tema = temaAtual, slotSave = slot})
        else return (ImmutableTowers {cena = ModoJogo Resumed, jogo = novoJogo, tema = temaAtual, slotSave = slot})

reageTempo t (ImmutableTowers {cena = ModoJogo (Loja opcao) , jogo = jogo, tema = temaAtual, slotSave = slot}) = 
    let novoJogo = atualizaJogo t jogo
        cenaFinal = if ganhouJogo novoJogo 
                        then TelaFinal (Vitoria MenuVitoria)
                        else TelaFinal (Derrota MenuDerrota)
    in if (terminouJogo novoJogo) 
        then return (ImmutableTowers {cena = cenaFinal, jogo = novoJogo, tema = temaAtual, slotSave = slot})
        else return (ImmutableTowers {cena = ModoJogo (Loja opcao), jogo = novoJogo, tema = temaAtual, slotSave = slot})

reageTempo t (ImmutableTowers {cena = AdicionaTorre torre (x,y) , jogo = jogo, tema = temaAtual, slotSave = slot}) = 
    let novoJogo = atualizaJogo t jogo
        cenaFinal = if ganhouJogo novoJogo 
                        then TelaFinal (Vitoria MenuVitoria)
                        else TelaFinal (Derrota MenuDerrota)
    in if (terminouJogo novoJogo) 
        then return (ImmutableTowers {cena = cenaFinal, jogo = novoJogo, tema = temaAtual, slotSave = slot})
        else return (ImmutableTowers {cena = AdicionaTorre torre (x,y), jogo = novoJogo, tema = temaAtual, slotSave = slot})


reageTempo t (ImmutableTowers {cena = Debug ,jogo = jogo, tema = temaAtual, slotSave = slot}) = return $ (ImmutableTowers {cena = Debug, jogo = novoJogo, tema = temaAtual, slotSave = slot})
    where novoJogo = atualizaJogo t jogo

reageTempo t e@(ImmutableTowers {cena = ModoJogo Pause ,jogo = jogo, slotSave = slot}) = return $ e

reageTempo _ e = return $ e