{-|
Module      : LI12425
Description : Definições base do jogo
Copyright   : Nelson Estevão <d12733@di.uminho.pt>
              Olga Pacheco   <omp@di.uminho.pt>
              Pedro Peixoto  <d14110@di.uminho.pt>
              Xavier Pinho   <d12736@di.uminho.pt>

Tipos de dados e funções auxiliares para a realização do projeto de LI1 em 2024/25.
-}
module LI12425 (
    -- * Tipos de dados
    -- ** Básicos
    Creditos, Direcao(..), Distancia, Duracao(..), Posicao, Semente, Tempo,
    -- ** Mapas
    Mapa, Terreno(..),
    -- ** Entidades
    Base(..), Torre(..), Portal(..), Inimigo(..), TipoProjetil(..), Projetil(..),
    -- ** Jogo
    Jogo(..), Cena(..), Onda(..), Loja, TipoTorre(..), OpcaoMenuInicial(..), OpcaoContinueNew(..), SelectGameMode(..), SelectLevel(..), OpcaoSaveMap(..), EstadoEditor(..), OpcaoModoJogo(..), Config(..), Themes(..), TelaFinal(..), OpcaoVitoria(..), OpcaoDerrota(..),
    -- * Funções auxiliares
    geraAleatorios,
    -- * Funções para instancia Num Duração
    addDuracao, multDuracao, absDuracao, signumDuracao, fromIntegerDuracao, negateDuracao

    ) where
        
import System.Random (mkStdGen, randoms)


-- | Tipo de terreno do mapa.
data Terreno
  = -- | Torres constroem-se sobre o relvado do mapa.
    Relva
  | -- | A base e os portais constroem-se sobre caminhos de terra do mapa. Além disso, inimigos movem-se sobre estes terrenos.
    Terra
  | -- | Água para efeito decorativo, mas onde não se pode construir, nem os inimigos se podem mover.
    Agua
  |
    Vazio
  deriving (Eq, Show, Read)

-- | Mapa do jogo composto por uma matriz de terrenos.
type Mapa = [[Terreno]]

-- | Coordenada bilateral de uma entidade no jogo, representante do seu centro.
-- O referencial tem origem no canto superior esquerdo, com eixos x e y positivos para a direita e para baixo, respectivamente.
type Posicao = (Float, Float)

-- | Moeda do jogo.
type Creditos = Int

-- | Base de operações do jogador.
data Base = Base
  { -- | Vida da base. Quando esta chega a zero, o jogador perde o jogo.
    vidaBase :: Float,
    -- | Posição da base no mapa. A base deve estar sobre um terreno de terra.
    posicaoBase :: Posicao,
    -- | Balanço de créditos do jogador.
    creditosBase :: Creditos
  }
  deriving (Show, Read)

-- | Distância entre duas posições.
type Distancia = Float

-- | Tempo em segundos.
type Tempo = Float

-- | Representa uma duração em segundos
data Duracao
  = -- | Duração em segundos
    Finita Tempo
  | -- | Duração infinita
    Infinita
  deriving (Eq, Show, Ord, Read)

instance Num Duracao where
  (+) = addDuracao
  (*) = multDuracao
  abs = absDuracao
  signum = signumDuracao
  fromInteger = fromIntegerDuracao
  negate = negateDuracao

-- | Torre que dispara projéteis contra inimigos.
data Torre = Torre
  { -- | Posição da torre no mapa.
    posicaoTorre :: Posicao,
    -- | Redução de vida no inimigo pelo impacto do projétil.
    danoTorre :: Float,
    -- | Alcance circular da torre.
    alcanceTorre :: Float,
    -- | Número de máximo de inimigos simultaneamente atingidos por uma rajada de tiros.
    rajadaTorre :: Int,
    -- | Ciclo de tempo entre rajadas de tiros.
    cicloTorre :: Tempo,
    -- | Tempo restante para a próxima rajada de tiros.
    tempoTorre :: Tempo,
    -- | Efeito secundário associado ao tipo de projétil da torre.
    projetilTorre :: Projetil
  }
  deriving (Show, Read)

-- | Loja de torres disponíveis para construir por uma quantidade de créditos.
type Loja = [(Creditos, Torre)]

-- | Tipo de projétil disparado por uma torre.
data TipoProjetil = Fogo | Gelo | Resina
  deriving (Eq, Show, Read)

-- | Projétil aplicado por uma torre.
data Projetil = Projetil
  { -- | Tipo de projétil.
    tipoProjetil :: TipoProjetil,
    -- | Duração do efeito do projétil no inimigo.
    duracaoProjetil :: Duracao
  }
  deriving (Show, Read)

-- | Direção de movimento de uma entidade no jogo.
data Direcao
  = Norte
  | Sul
  | Este  
  | Oeste
  deriving (Eq, Show, Read)

-- | Inimigo que se move em direção à base do jogador.
data Inimigo = Inimigo
  { -- | Posição do inimigo no mapa.
    posicaoInimigo :: Posicao,
    -- | Direção do último movimento do inimigo.
    direcaoInimigo :: Direcao,
    -- | Vida do inimigo.
    vidaInimigo :: Float,
    -- | Velocidade do inimigo.
    velocidadeInimigo :: Float,
    -- | Dano causado pelo inimigo na base do jogador.
    ataqueInimigo :: Float,
    -- | Créditos que o jogador recebe ao derrotar o inimigo.
    butimInimigo :: Creditos,
    -- | Efeitos secundários ativos no inimigo.
    projeteisInimigo :: [Projetil]
  }
  deriving (Show, Read)

instance Eq Inimigo where
    i1 == i2 = posicaoInimigo i1 == posicaoInimigo i2 &&
               direcaoInimigo i1 == direcaoInimigo i2 &&
               vidaInimigo i1 == vidaInimigo i2 &&
               velocidadeInimigo i1 == velocidadeInimigo i2 &&
               ataqueInimigo i1 == ataqueInimigo i2 &&
               butimInimigo i1 == butimInimigo i2 &&
               projeteisInimigo i1 == projeteisInimigo i2

instance Eq Projetil where
    i1 == i2 =  tipoProjetil i1 == tipoProjetil i2 &&
                duracaoProjetil i1 == duracaoProjetil i2


-- | Onda de inimigos que saem de um portal.
data Onda = Onda
  { -- | Inimigos que compõem a onda.
    inimigosOnda :: [Inimigo],
    -- | Tempo em segundos entre a entrada de cada inimigo.
    cicloOnda :: Tempo,
    -- | Tempo restante, em segundos, para a entrada do próximo inimigo da onda.
    tempoOnda :: Tempo,
    -- | Tempo restante, em segundos, para a entrada da onda.
    entradaOnda :: Tempo
  }
  deriving (Show, Read)

-- | Portal de entrada de inimigos no mapa.
data Portal = Portal
  { -- | Posição do portal no mapa. O portal deve estar sobre um terreno de terra.
    posicaoPortal :: Posicao,
    -- | Ondas de inimigos que saem do portal.
    ondasPortal :: [Onda]
  }
  deriving (Show, Read)

-- | Estado do jogo. Um jogo é composto pela base, vários portais, várias torres, um mapa, vários inimigos e a loja.
data Jogo = Jogo
  { -- | Base de operações do jogador.
    baseJogo :: Base,
    -- | Portais de entrada de inimigos no mapa.
    portaisJogo :: [Portal],
    -- | Torres construídas pelo jogador.
    torresJogo :: [Torre],
    -- | Mapa retangular do jogo.
    mapaJogo :: Mapa,
    -- | Inimigos em movimento no mapa.
    inimigosJogo :: [Inimigo],
    -- | Loja de torres disponíveis para construir.
    lojaJogo :: Loja
  }
  deriving (Show, Read)

-- | Tipos de torres disponíveis. Usado para a seleção de torres na loja e no editor de mapas.
data TipoTorre = Torre1
               | Torre2 
               | Torre3 

-- | Opções disponíveis no menu inicial.
data OpcaoMenuInicial = Jogar 
                      | Opcoes 
                      | Sair
-- | Opções disponíveis para continuar ou iniciar um novo jogo.
data OpcaoContinueNew = ContinueGame 
                      | NewGame

-- | Modos de jogo disponíveis.
data SelectGameMode = Levels
                    | Creator

-- | Níveis disponíveis para jogo.
type SelectLevel = Int 

-- | Opções disponíveis para salvar ou não o mapa. SaveMapa para salvar e NoSaveMapa para não salvar.
data OpcaoSaveMap = SaveMapa | NoSaveMapa

-- | Estado do editor de mapas.
data EstadoEditor = OpcaoEditorTerreno Terreno
                  | OpcaoEditorTorre TipoTorre
                  | OpcaoEditorBase
                  | OpcaoEditorPortal
                  | AdicionaTerreno Terreno (Int,Int)
                  | AdicionaTorreEditor TipoTorre (Int,Int)
                  | AdicionaBase (Int,Int)
                  | AdicionaPortal (Int,Int)

-- | Opções disponíveis no modo de jogo.
data OpcaoModoJogo = Resumed 
                   | Pause 
                   | Loja TipoTorre

-- | Telas que aparecem ao terminar um jogo.
data TelaFinal = Vitoria OpcaoVitoria
               | Derrota OpcaoDerrota

-- | Opções disponíveis ao ganhar um jogo.
data OpcaoVitoria = MenuVitoria
                  | NextLevel

-- | Opções disponíveis ao perder um jogo.
data OpcaoDerrota = MenuDerrota
                  | TentarNovamente

-- | Opções de configuração disponíveis.
data Config = Themes
            | Audio
            | Voltar
          
-- | Temas disponíveis para o jogo.
data Themes = Tema1 
            | Tema2 
            | Tema3

-- | Cena do jogo.
data Cena = MenuInicial OpcaoMenuInicial
          | OpcaoJogar OpcaoContinueNew
          | SelectGameMode SelectGameMode
          | SelectLevel SelectLevel
          | Options Config 
          | ThemesMenu Themes
          | EditorDeMapas EstadoEditor
          | ModoJogo OpcaoModoJogo 
          | AdicionaTorre TipoTorre (Int,Int)
          | Debug
          | LoadGame Int
          | SaveGame OpcaoSaveMap
          | TelaFinal TelaFinal

-- | Valor inicial que determina a sequência de números pseudo-aleatórios.
type Semente = Int

{-| Função que gera uma lista de números aleatórios a partir de uma 'Semente'.

== Exemplos

>>> geraAleatorios 2425 3
[9108974057934916489,3509742222561512871,1534041518507426227]

>>> geraAleatorios 10 1
[3575835729477015470]
-}
geraAleatorios :: Semente -> Int -> [Int]
geraAleatorios s c = take c $ randoms (mkStdGen s)

-- Funções para instância de Num de Duracao

{-|
  'addDuracao' é responsável por somar valores do tipo 'Duracao'

  ==__Exemplos de utilização__
  >>> addDuracao (Finita 5) (Finita (-5))
  Finita 0
  >>> addDuracao Infinita (Finita 5)
  Infinita
  >>> addDuracao Infinita Infinita
  Infinita
-}
addDuracao :: Duracao -> Duracao -> Duracao
addDuracao Infinita _ = Infinita
addDuracao _ Infinita = Infinita
addDuracao (Finita x) (Finita y) = Finita $ x + y

{-|
  'multDuracao' é responsável por calcular o produto de valores do tipo 'Duracao'

  ==__Exemplos de utilização__
  >>> multDuracao (Finita 5) (Finita (-5))
  Finita (-25.0)
  >>> multDuracao Infinita (Finita 5)
  Infinita
  >>> multDuracao Infinita Infinita
  Infinita
-}
multDuracao :: Duracao -> Duracao -> Duracao
multDuracao Infinita (Finita _) = Infinita
multDuracao (Finita _) Infinita = Infinita
multDuracao (Finita x) (Finita y) = Finita $ x * y
multDuracao _ _ = error "Illegal operation performed"

{-|
  A função 'absDuracao' é responsável por calcular o valor absoluto de um valor do tipo 'Duracao'

  ==__Exemplos de utilização__
  >>> absDuracao Infinita
  Infinita
  >>> absDuracao (Finita (-5))
  Finita 5
-}
absDuracao :: Duracao -> Duracao
absDuracao Infinita = Infinita
absDuracao (Finita x) = Finita $ abs x

{-|
  A função 'signumDuracao' é responsável por calcular o sinal de uma 'Duracao'

  ==__Exemplos de utilização__
  >>> signumDuracao Infinita
  Finita 1.0
  >>> signumDuracao (Finita 5)
  Finita 1.0
-}
signumDuracao :: Duracao -> Duracao
signumDuracao Infinita = Finita 1
signumDuracao (Finita x)
    | x < 0 = Finita (-1)
    | x == 0 = Finita 0
    | otherwise = Finita 1

{-|
  A função 'fromIntegerDuracao' converte um Integer em uma 'Duracao'

  ==__Exemplos de utilização__
  >>> fromIntegerDuracao 5
  Finita 5.0
-}
fromIntegerDuracao :: Integer -> Duracao
fromIntegerDuracao x = Finita (fromIntegral x :: Float)

{-|
  A função 'negateDuracao' calcula o valor simétrico de uma 'Duracao'

  ==__Exemplos de utilização__
  >>> negateDuracao (Finita 5)
  Finita (-5.0)
-}
negateDuracao :: Duracao -> Duracao
negateDuracao Infinita = Infinita
negateDuracao (Finita x) = Finita $ (-1) * x