return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		local map = vim.keymap.set
		map("n", "<leader>e", "<cmd>Neotree toggle<CR>", { desc = "Neotree Toggle" })
		map("n", "<leader>r", "<cmd>Neotree focus<CR>", { desc = "Neotree Focus" })
	end,
}
