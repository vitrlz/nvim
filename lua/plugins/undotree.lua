return {
	"mbbill/undotree",
	config = function()
		vim.keymap.set("n", "<C-u>", function()
			vim.cmd("UndotreeToggle")
		end)
		vim.g.undotree_WindowLayout = 3
		vim.g.undotree_SetFocusWhenToggle = 1
	end,
}
