local map = vim.keymap.set

-- Clear search highlights on <Esc>
map("n", "<Esc>", "<cmd>nohlsearch<CR>")

map("n", "<leader>w", "<cmd>update<CR>", { desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })

-- map("n", "<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
-- map("v", "<leader>/", "gc", { desc = "Toggle Comment", remap = true })

-- New Windows
map("n", "<leader>|", "<cmd>vsplit<CR>", { desc = "Split Window Right" })
map("n", "<leader>-", "<cmd>split<CR>", { desc = "Split Window Below" })

map("c", "<C-j>", "<C-n>")
map("c", "<C-k>", "<C-p>")

map("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Lazy" })

-- Window Navigation
-- map("n", "<C-h>", "<C-w>h")
-- map("n", "<C-l>", "<C-w>l")
-- map("n", "<C-k>", "<C-w>k")
-- map("n", "<C-j>", "<C-w>j")

vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
