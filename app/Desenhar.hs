module Desenhar where

import Graphics.Gloss
import ImmutableTowers

import LI12425

desenhaLinha :: [Terreno] -> Int -> [Picture]
desenhaLinha [] = []
desenhaLinha (h:t) = color green

desenha :: ImmutableTowers -> Picture
desenha ImmutableTowers { jogo = Jogo {mapaJogo = (h:t)}} = desenhaLinha h
desenha _ = undefined
--desenha _ = Translate (-450) 0 $ Scale 0.5 0.5 $ Text "Welcome to Immutable Towers!"
