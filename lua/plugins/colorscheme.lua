return {
	"EdenEast/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				transparent = false,
				styles = {
					comments = "italic",
					keywords = "bold",
					types = "italic,bold",
				},
			},
			-- [CORREÇÃO] Usamos groups para linkar as cores sem quebrar a compilação
			groups = {
				carbonfox = {
					-- Força as janelas flutuantes (Oil, Dressing, CMP) a terem profundidade
					-- Usamos "bg1" ou "bg0" do próprio tema para evitar o erro de CSS
					NormalFloat = { bg = "#161616" },
					FloatBorder = { fg = "fg3", bg = "#161616" },

					-- Ajusta o menu de Autocompletar (Snippets/CMP)
					Pmenu = { bg = "#161616" },
					PmenuSel = { bg = "#2d2d2d", fg = "none" },

					-- Sincroniza o Telescope com o resto das janelas
					TelescopeNormal = { bg = "#161616" },
					TelescopeBorder = { fg = "fg3", bg = "#161616" },
					TelescopePromptNormal = { bg = "#2d2d2d" },
					TelescopePromptBorder = { fg = "fg3", bg = "#2d2d2d" },
				},
			},
		})

		vim.cmd.colorscheme("carbonfox")
	end,
}

