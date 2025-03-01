return {
	"goolord/alpha-nvim",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		-- Set header
		dashboard.section.header.val = {
			[[                                                                       ]],
			[[                                                                     ]],
			[[       ████ ██████           █████      ██                     ]],
			[[      ███████████             █████                             ]],
			[[      █████████ ███████████████████ ███   ███████████   ]],
			[[     █████████  ███    █████████████ █████ ██████████████   ]],
			[[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
			[[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
			[[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
			[[                                                                       ]],
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New File", "<cmd>ene<CR>"),
			dashboard.button(
				"SPC   e",
				"  Toggle file explorer",
				"<cmd>Neotree toggle<CR>",
				{ desc = "Neotree Toggle" }
			),
			dashboard.button("SPC f f", "󰱼  Find File", "<cmd>Telescope find_files<CR>", { desc = "Find File" }),
			dashboard.button("SPC f w", "  Find Word", "<cmd>Telescope live_grep<CR>", { desc = "Find Word" }),
			dashboard.button("SPC   l", "󰒲  Lazy", "<cmd>Lazy<CR>", { desc = "Lazy" }),
			-- dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", "  Quit NVIM", "<cmd>qa<CR>"),
		}
		alpha.setup(dashboard.opts)
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
