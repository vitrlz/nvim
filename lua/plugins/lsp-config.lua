return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { 
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp", -- Garante que as capabilities do autocomplete funcionem
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup({
        -- Lista de servidores que você quer garantir que estejam instalados
        ensure_installed = { "lua_ls", "ts_ls", "pyright", "clangd", "html", "cssls" },
        
        handlers = {
          -- Configuração padrão para todos os servidores (evita repetição de código)
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = capabilities,
            })
          end,

          -- Configurações específicas para servidores que precisam de ajustes extras:
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  diagnostics = { globals = { "vim" } },
                  workspace = { checkThirdParty = false },
                },
              },
            })
          end,

          ["clangd"] = function()
            lspconfig.clangd.setup({
              capabilities = capabilities,
              cmd = {
                "clangd",
                "--background-index",
                "--clang-tidy",
                "--header-insertion=never",
              },
            })
          end,
        },
      })

      -- Atalhos de teclado globais para o LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
    end,
  },
}

