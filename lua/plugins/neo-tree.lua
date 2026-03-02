return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "muniftanjim/nui.nvim",
  },
  opts = {
    -- 1. Personalização Geral da GUI
    window = {
      width = 30,
      position = "right",
      mappings = {
        ["<space>"] = "none", -- Desativa o preview se incomodar
      },
    },
    default_component_configs = {
      indent = {
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "  ",
      },
    },
  },
  config = function(_, opts)
    -- 2. Aplicar Cores para o Carbonfox (Fundo e Texto)
    -- Isso garante que o fundo do Neo-tree seja igual ao do resto do editor
    vim.api.nvim_set_hl(0, "NeoTreeNormal", { link = "Normal" })
    vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { link = "NormalNC" })
    vim.api.nvim_set_hl(0, "NeoTreeWinSeparator", { fg = "#2a2a2a", bg = "none" }) -- Ajuste a cor da linha divisória

    -- Setup inicial com as opções acima
    require("neo-tree").setup(opts)

    -- Atalho (ajustado para usar a função execute recomendada)
    vim.keymap.set('n', '<C-n>', ":Neotree filesystem reveal right toggle<CR>", { desc = "Toggle Neo-tree" })
  end
}

