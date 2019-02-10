

windows:
  - pdbA:
      layout: main-vertical
      panes:
        - CdInPdbA:
          - cd pdbA
          - nvim FindMax.py
        - SideZSH:
          - cd pdbA
          - zsh
  - nini:
      layout: main-vertical
      panes:
        - Ni:
          - nvim
        - ZSH:
          - zsh
  - One:
      layout: tiled
      panes:
        - BigBASH:
          - bash
  - io:
      layout: tiled
      panes:
        - ZSH1:
          - zsh
        - FISH2:
          - fish
        - SH3:
          - sh
        - BASH4:
          - bash

windows:
  - pdbA:
      layout: main-vertical
      panes:
        - nvim pdbA/FindMax.py
        - zsh
  - nVim:
      layout: main-vertical
      panes:
        - nvim
        - zsh
  - OneP:
      layout: tiled
      panes:
        - zsh
        - bash
  - io4P:
      layout: tiled
      panes:
        - zsh
        - fish
        - sh
        - bash
