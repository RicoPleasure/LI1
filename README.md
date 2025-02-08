# Projeto realizado em Laboratórios de Informática I

O jogo consiste num Tower Defense padrão (com torres, inimigos e a base). O objetivo é impedir que os inimigos alcancem a base.

## Funcionalidades extras
- Editor de mapas
- Diferentes temas
- Sistema de saves

## Falhas
- Movimentos dos inimigos quando há 2 caminhos ou mais.

## Imagens do jogo

![image](https://github.com/user-attachments/assets/e21704eb-8ca9-4243-a561-80831f66af61)
![image](https://github.com/user-attachments/assets/ad6b49ea-e806-4700-8df7-2707edde7baa)
![image](https://github.com/user-attachments/assets/c8851d8c-c7a0-4c81-962a-4350d36658bc)

## **Nota do projeto:** 18

## Desenvolvido por 
- Enrico Silva Prazeres
- Leandro Filipe Lourenço Carvalho

## Executável

Pode compilar e executar o programa através dos comandos `build` e `run` do Cabal.

```bash
cabal run --verbose=0
```

## Interpretador

Para abrir o interpretador do Haskell (GHCi) com o projeto carregado, utilize o comando `repl` do Cabal

```bash
cabal repl
```

## Testes

O projecto utiliza a biblioteca [HUnit](https://hackage.haskell.org/package/HUnit) para fazer testes unitários.

Execute os testes com o comando `test` do Cabal e utilize a flag `--enable-coverage` para gerar um relatório de cobertura de testes.

```bash
cabal test --enable-coverage
```

Execute os exemplos da documentação como testes com a biblioteca
[`doctest`](https://hackage.haskell.org/package/doctest). Para instalar o
executavel utilize o comando `cabal install doctest`.

```bash
cabal repl --build-depends=QuickCheck,doctest --with-ghc=doctest --verbose=0
```

## Documentação

A documentação do projeto pode ser gerada recorrendo ao [Haddock](https://haskell-haddock.readthedocs.io/).

```bash
cabal haddock
```
