module Tempo where

import ImmutableTowers
import LI12425
import Desenhar

reageTempo :: Tempo -> Estado -> IO Estado
reageTempo _ e = return e
