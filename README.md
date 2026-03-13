Neovim Configuration
====================

IMPORTANTE!!!
quando voce baixar o repositorio pode dar um monte de erro mas é por que precisa de varias coisas pre instaladas
como o lazy git e um monte de coisa pro lsp entt arruma tudo com o gpt e fica balinha

----------------------------------------
1. Sobre
----------------------------------------

Esta configuração utiliza Lua para organizar plugins,
configurações e keymaps. O foco é:

- Alta performance
- Plugins carregados sob demanda
- Interface limpa
- Experiência próxima a um IDE

----------------------------------------
2. Estrutura do Projeto
----------------------------------------

nvim/
│
├── init.lua
├── lazy-lock.json
├── lua/
│   ├── config/
│   │   ├── options.lua
│   │   ├── keymaps.lua
│   │   └── autocmds.lua
│   │
│   ├── plugins/
│   │   ├── lsp.lua
│   │   ├── completion.lua
│   │   ├── telescope.lua
│   │   ├── treesitter.lua
│   │   └── ui.lua
│   │
│   └── core/
│       ├── init.lua
│       └── lazy.lua
│
└── README.md


Descrição:

init.lua
Arquivo principal que inicializa o Neovim e carrega todas as configurações.

lua/config
Configurações básicas do editor.

lua/plugins
Configuração dos plugins utilizados.

lua/core
Sistema de bootstrap e carregamento de plugins.

lazy-lock.json
Arquivo que fixa versões de plugins instalados.

----------------------------------------
3. Requisitos
----------------------------------------

Antes de instalar esta configuração, certifique-se de ter:

- Neovim >= 0.9
- Git
- Ripgrep
- Node.js (para alguns LSPs)
- Nerd Font (para ícones)

----------------------------------------
4. Instalação
----------------------------------------

1. Faça backup da configuração atual:

rm -rf ~/.config/nvim

2. Clone o repositório:

git clone https://github.com/vitrlz/nvim ~/.config/nvim

3. Abra o Neovim:

nvim

Os plugins serão instalados automaticamente na primeira execução.

----------------------------------------
5. Plugins Principais
----------------------------------------

Gerenciamento de plugins
- lazy.nvim

Busca e navegação
- telescope.nvim

Syntax highlighting
- treesitter

LSP
- nvim-lspconfig

Autocomplete
- nvim-cmp

Interface
- lualine
- bufferline
- alpha-nvim

Git
- gitsigns

----------------------------------------
lembre se de usar o :LazySinc para sincronizar os plugins
----------------------------------------
6. Keymaps Principais

Leader: <Space> é a tecla de espaço para os atalhos

<leader>ff
Buscar arquivos

<leader>fg
Buscar texto no projeto

<leader>e
Abrir explorer

<leader>w
Salvar arquivo

<leader>q
Fechar buffer

gd
Ir para definição

gr
Ver referências

----------------------------------------
7. LSP

O LSP é usado para:

- Autocomplete
- Diagnóstico de erros
- Go to definition
- Refactor

Servidores comuns:

- lua_ls
- tsserver
- pyright
- rust_analyzer
- bashls

----------------------------------------
8. Atualizar Plugins

Para atualizar plugins:

:Lazy update

----------------------------------------
9. Customização

Você pode modificar:

lua/config/options.lua
Configurações do editor

lua/config/keymaps.lua
Atalhos personalizados

lua/plugins/
Adicionar ou remover plugins
