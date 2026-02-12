return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "pyright", "clangd", "html", "cssls" }
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require('cmp_nvim_lsp').default_capabilities()
			local lspconfig = require("lspconfig")

			-- Configuração para Lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/lua-language-server" },
				settings = {
					Lua = {
						runtime = {
							version = "LuaJIT",
						},
						diagnostics = {
							globals = { "vim" },
						},
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
					},
				},
			})

			-- Configuração para Pyright
			lspconfig.pyright.setup({
				capabilities = capabilities
			})

			-- Configuração para TypeScript
			lspconfig.ts_ls.setup({
				capabilities = capabilities
			})

			-- Configuração para Clangd (C/C++)
			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--background-index",
					"--clang-tidy",
					"--completion-style=detailed",
					"--header-insertion=never",
					"--query-driver=**/gcc.exe"
				},
			})
			-- Configuração para HTML
			lspconfig.html.setup({
				capabilities = capabilities,
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-html-language-server", "--stdio" },
			})

			-- Configuração para CSS
			lspconfig.cssls.setup({
				capabilities = capabilities,
				cmd = { vim.fn.stdpath("data") .. "/mason/bin/vscode-css-language-server", "--stdio" },
			})

			-- Atalhos de teclado para LSP
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
		end
	}
}

