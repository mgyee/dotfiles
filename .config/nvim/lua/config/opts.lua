-- Editor options
local opt = vim.opt

opt.number = true
opt.relativenumber = true

vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

vim.deprecate = function() end

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
})

opt.syntax = "on"
opt.autoindent = true
opt.cursorline = true

opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2

opt.smartindent = true
opt.autoindent = true

opt.ruler = true

opt.mouse = "a"

-- vim.opt.title = true

opt.ttimeoutlen = 0 -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
opt.wildmenu = true -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
opt.showcmd = true -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
opt.inccommand = "split" -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.

opt.splitright = true
opt.splitbelow = true

opt.termguicolors = true

opt.ignorecase = true
opt.smartcase = true

opt.scrolloff = 10

opt.swapfile = false
