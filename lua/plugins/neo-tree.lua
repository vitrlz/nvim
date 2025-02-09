return
	{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", 
      "muniftanjim/nui.nvim",
    },
		config = function () 
			-- atalho para abrir o neo-tree 
			vim.keymap.set('n', '<C-n>', ":Neotree filesystem reveal right<CR>", {})
		end
	}

