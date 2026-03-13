return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "onsails/lspkind.nvim", -- Plugin essencial para ícones bonitos
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local loader = require("luasnip.loaders.from_vscode")
      loader.lazy_load()
      loader.lazy_load({ 
        paths = { vim.fn.stdpath("config") .. "/snippets" } 
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "onsails/lspkind.nvim", -- Adicionado aqui também
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered(),
        },
        -- A MÁGICA DA APARÊNCIA ESTÁ AQUI:
        formatting = {
          format = lspkind.cmp_format({
            mode = 'symbol_text', -- mostra ícone e texto (ex:  Snippet)
            maxwidth = 50,
            ellipsis_char = '...',
            before = function (entry, vim_item)
              -- Identifica de onde vem o snippet (LSP, Snippet, Buffer)
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snip]",
                buffer = "[Buf]",
              })[entry.source.name]
              return vim_item
            end
          })
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<C-j>"] = cmp.mapping.select_next_item(),
          ["<C-k>"] = cmp.mapping.select_prev_item(),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
        }),
      })
    end,
  },
}

