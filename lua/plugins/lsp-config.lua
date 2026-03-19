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
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- [BORDAS] Configura o estilo global das bordas (ajuste para "rounded" ou "single")
			local border = "rounded"

			-- [BORDAS] Aplica bordas nas janelas flutuantes do LSP (Hover e Signature)
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

			-- [BORDAS] Aplica bordas na janela do comando :LspInfo
			require('lspconfig.ui.windows').default_options.border = border

			-- [BORDAS] Aplica bordas nos diagnósticos flutuantes (erros/avisos)
			vim.diagnostic.config({
				float = { border = border },
			})

			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright", "clangd", "html", "cssls" },

				handlers = {
					function(server_name)
						lspconfig[server_name].setup({
							capabilities = capabilities,
						})
					end,

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

			-- Atalhos de teclado
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code Action" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "LSP Go to Definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "LSP References" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
		end,
	},
}

