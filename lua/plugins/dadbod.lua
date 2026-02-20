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
			-- interface
			vim.g.db_ui_use_nerd_fonts = 1
			vim.g.db_ui_save_location = vim.fn.stdpath("config") .. "/db_ui_queries"
			vim.g.db_ui_show_database_icon = 1
			vim.g.db_ui_auto_execute_table_helpers = 1

			-- layout
			vim.g.db_ui_win_position = "right"
			vim.g.db_ui_winwidth = 40

			vim.api.nvim_create_autocmd("FileType", {
				pattern = "dbout",
				callback = function()
					vim.wo.foldenable = false
				end,
			})
		end,
	},

	-- completions opcionais
	{
		"kristijanhusak/vim-dadbod-completion",
		ft = { "sql", "mysql", "plsql" },
		dependencies = { "tpope/vim-dadbod" },
	},
}

