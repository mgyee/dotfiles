return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		icons = {
			mappings = false,
		},
		spec = {
			{ "<leader>c", group = "code", mode = { "n", "x" } },
			{ "<leader>b", group = "buffer" },
			-- { "<leader>d", group = "[D]ocument" },
			-- { "<leader>r", group = "[R]ename" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			-- { "<leader>w", group = "workspace" },
			{ "<leader>t", group = "toggle" },
			-- { "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
		},
	},
}
