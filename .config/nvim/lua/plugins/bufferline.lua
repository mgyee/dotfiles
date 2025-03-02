return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local map = vim.keymap.set
		map("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Buffer" })
		map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next Buffer" })
		map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
		require("bufferline").setup()
	end,
}
