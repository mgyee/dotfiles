return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local actions = require("telescope.actions")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<Esc>"] = actions.close,
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")
		local map = vim.keymap.set
		-- map("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
		-- map("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		map("n", "<leader>ff", builtin.find_files, { desc = "Find File (root)" })
		map("n", "<leader>fF", function()
			builtin.find_files({ cwd = require("telescope.utils").buffer_dir() })
		end, { desc = "Find File (cwd)" })
		-- map("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
		map("n", "<leader>fw", builtin.live_grep, { desc = "Find Word" })
		-- map("n", "<leader>fg", builtin.live_grep, { desc = "[F]ind by [G]rep" })
		map("n", "<leader>fd", builtin.diagnostics, { desc = "Find Diagnostic" })
		-- map("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		map("n", "<leader>fr", builtin.oldfiles, { desc = "Find Recent File" })
		map("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })

		-- Slightly advanced example of overriding default behavior and theme
		map("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "Fuzzily search in current buffer" })

		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		map("n", "<leader>f/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "Find in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		map("n", "<leader>fn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "Find Neovim Files" })
	end,
}
