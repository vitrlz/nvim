return {
	-- dadbod core
	{
		"tpope/vim-dadbod",
	},

	-- dadbod UI
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = { "tpope/vim-dadbod" },
		cmd = { "DBUI", "DBUIToggle", "DBUIAddConnection", "DBUIFindBuffer" },
		init = function()
			-- Garante que suas conexões apareçam (Pasta do seu config)
			vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui_queries"
			
			-- Interface básica estável
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_auto_execute_table_helpers = 1
			vim.g.db_ui_win_position = "right"
			vim.g.db_ui_winwidth = 40

			-- CONFIGURAÇÃO PARA OUTPUTS GRANDES (Resolve o problema original)
			vim.g.db_ui_max_query_results = 2000 
			vim.g.db_ui_max_column_width = 100

			-- Autocomando simples para não esconder o texto em "folds"
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dbout",
				callback = function()
					vim.wo.foldenable = false
				end,
			})
		end,
	},

	-- completions
	{
		"kristijanhusak/vim-dadbod-completion",
		ft = { "sql", "mysql", "plsql" },
		dependencies = { "tpope/vim-dadbod" },
	},
}

