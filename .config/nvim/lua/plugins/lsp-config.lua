return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",

		{ "j-hui/fidget.nvim", opts = {} },

		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-attach", {}),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("K", vim.lsp.buf.hover, "Hover")

				map("gD", vim.lsp.buf.declaration, "Goto Declaration")

				map("gd", "<cmd>Telescope lsp_definitions<CR>", "Goto Definition")

				map("gr", "<cmd>Telescope lsp_references<CR>", "Goto References")

				map("gI", "<cmd>Telescope lsp_implementations<CR>", "Goto Implementation")

				map("<leader>D", "<cmd>Telescope lsp_type_definitions<CR>", "Type Definition")

				map("<leader>ds", "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols")

				map("<leader>cw", "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "Workspace Symbols")

				map("<leader>cr", vim.lsp.buf.rename, "Rename")

				map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "v" })

				local client = vim.lsp.get_client_by_id(event.data.client_id)
				if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
					local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		local signs = { ERROR = "", WARN = "", INFO = "", HINT = "" }
		local diagnostic_signs = {}
		for type, icon in pairs(signs) do
			diagnostic_signs[vim.diagnostic.severity[type]] = icon
		end
		vim.diagnostic.config({ signs = { text = diagnostic_signs } })

		vim.api.nvim_set_keymap(
			"n",
			"<leader>cd",
			"<cmd>lua vim.diagnostic.open_float()<CR>",
			{ noremap = true, silent = true, desc = "Open Diagnostic Float" }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>d[",
			"<cmd>lua vim.diagnostic.goto_prev()<CR>",
			{ noremap = true, silent = true }
		)
		vim.api.nvim_set_keymap(
			"n",
			"<leader>d]",
			"<cmd>lua vim.diagnostic.goto_next()<CR>",
			{ noremap = true, silent = true }
		)

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		local servers = {
			clangd = {},
			-- gopls = {
			-- 	settings = {
			-- 		gopls = {
			-- 			analyses = {
			-- 				unusedparams = true,
			-- 			},
			-- 			usePlaceholders = true,
			-- 			completeUnimported = true,
			-- 			staticcheck = true,
			-- 			gofumpt = true,
			-- 			hints = {
			-- 				compositeLiteralFields = true,
			-- 				constantValues = true,
			-- 				functionTypeParameters = true,
			-- 				parameterNames = true,
			-- 			},
			-- 		},
			-- 	},
			-- },
			-- verible = {
			-- 	root_dir = function()
			-- 		return vim.uv.cwd()
			-- 	end,
			-- },
			pyright = {},
			-- rust_analyzer = {},
			-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
			--
			-- Some languages (like typescript) have entire language plugins that can be useful:
			--    https://github.com/pmizio/typescript-tools.nvim
			--
			-- But for many setups, the LSP (`ts_ls`) will work just fine
			-- ts_ls = {},
			--

			lua_ls = {
				-- cmd = { ... },
				-- filetypes = { ... },
				-- capabilities = {},
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
						-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
						-- diagnostics = { disable = { 'missing-fields' } },
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers)
		vim.list_extend(ensure_installed, {
			"stylua",
			-- "prettier",
			-- "eslint_d",
			"markdownlint",
			"black",
			"clang-format",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
