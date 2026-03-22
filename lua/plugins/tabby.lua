return {
  "nanozuki/tabby.nvim",
  dependencies = {
    "EdenEast/nightfox.nvim",
  },
  config = function()
    vim.cmd("colorscheme carbonfox")

    local palette = require("nightfox.palette").load("carbonfox")

    local my_bg = "#161616"
    local fg = palette.fg1

    local theme = {
      -- FUNDO da área vazia (ESSA é a parte que você quer)
      fill = { bg = my_bg },

      head = {
        fg = palette.cyan.base,
        bg = my_bg,
        bold = true,
      },

      -- tab ativa
      current_tab = {
        fg = palette.cyan.base,
        bg = my_bg,
        bold = true,
      },

      -- tab inativa
      tab = {
        fg = fg,
        bg = my_bg,
      },

      tail = {
        fg = my_bg,
        bg = my_bg,
      },
    }

    require("tabby").setup({
      option = {
        theme = theme,
        tab_name = {
          name_fallback = function(tabid)
            return "tab " .. tabid
          end,
        },
      },

      line = function(line)
        return {
          -- margem esquerda
          { " ", hl = theme.fill },

          -- tabs
          line.tabs().foreach(function(tab)
            local is_current = tab.is_current()
            local hl = is_current and theme.current_tab or theme.tab

            local icon = is_current and "" or "" -- bolinha cheia / vazia

            return {
              " ",
              icon,
              " ",
              tab.name(),
              " ",
              hl = hl,
            }
          end),

          line.spacer(),

          -- lado direito opcional (minimal)
          {
            { " ", hl = theme.fill },
          },
        }
      end,
    })

    -- FORÇA o fundo da área sem tabs
    vim.api.nvim_set_hl(0, "TabLineFill", { bg = my_bg })
    vim.api.nvim_set_hl(0, "TabLine", { bg = my_bg })
    vim.api.nvim_set_hl(0, "TabLineSel", { bg = my_bg })

    vim.o.showtabline = 1
  end,
}
