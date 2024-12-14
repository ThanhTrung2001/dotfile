# dotfile

Configuration for working environment on Window

- from https://scoop.sh/#/apps?q=docker & VUNGUYENCODER

PS:

1. Please run file : RUN.PS1 as ADMINISTRATOR in powershell.
2. Please know that your install package/app/folder will contains in C:/User/<Username>/scoop folder, so REMEMBER TO ADD THE RIGHT PATH
3. in path_for_user_environment, add path like an array
4. in system_variable, add key = "value" to hash table

Environment

- clink
- ripgrep
- oh-my-posh
  - config like oh-my-posh website
- powershell 7 -> set powershell7 to the default
- neovim + clone GitHub nvchad
  - git clone https://github.com/ThanhTrung2001/NvChad_Config.git $env:LOCALAPPDATA\nvim
  - put nvim folder in User/<Name>/AppData/Local/
- git
- msys2
  after install, follow this link
  - https://code.visualstudio.com/docs/cpp/config-mingw
- flutter (sdk, path)
  - should add path into environment variable for window after install
- nodejs - nvm
- .net sdk
  - should setup directly by https://dotnet.microsoft.com/en-us/download
- python
- java
  - like dotnet, should setup directly and manage path
    -sql server - install directly
  - smss
  - sql server 2022
- sqlite
  -p ath

App & features

- wsl
- docker
- vscode
- visual studio
- postman
- localsend
- scrcpy
- sql
- VMware work station
- godot, aseprite, figma, pinterest, notion
- winrar
