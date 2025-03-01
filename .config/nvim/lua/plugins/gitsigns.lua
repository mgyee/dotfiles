return { -- Adds git related signs to the gutter, as well as utilities for managing changes
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup({
			on_attach = function(bufnr)
				local gitsigns = require("gitsigns")
				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end
				map("n", "<leader>gb", function()
					gitsigns.blame_line({ full = true })
				end, { desc = "Blame" })
				map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff" })
				map("n", "<leader>gD", function()
					gitsigns.diffthis("~")
				end, { desc = "Diff with HEAD~" })
				map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "Toggle Blame" })
				map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "Toggle Deleted" })
				map("n", "<leader>tw", gitsigns.toggle_word_diff, { desc = "Toggle Word Diff" })
			end,
		})
	end,
}
