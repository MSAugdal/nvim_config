local lsp = require("lsp-zero")
require("lspconfig").phpactor.setup({})

require("lspconfig").emmet_language_server.setup({
	settings = {
		["emmet_language_server"] = {
			filetypes = {
				"css",
				"eruby",
				"html",
				"htmldjango",
				"javascriptreact",
				"less",
				"pug",
				"sass",
				"scss",
				"typescriptreact",
				"php",
				"svelte",
			},
			root_dir = { ".git" },
			cmd = { "emmet-language-server", "--stdio" },
			single_file_support = true,
		},
	},
})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").dartls.setup({})

require("lspconfig").volar.setup({
	cmd = { "vue-language-server", "--stdio" },
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	init_options = {
		typescript = {
			tsdk = "/Users/msaugdal/.nvm/versions/node/v18.15.0/lib/node_modules/typescript/lib",
			-- Alternative location if installed as root:
			-- tsdk = '/usr/local/lib/node_modules/typescript/lib'
		},
	},
})
lsp.preset("recommended")

lsp.ensure_installed({
	"eslint",
	"tsserver",
	"pyright",
	"rust_analyzer",
	"clangd",
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<Enter>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["tsserver"] = { "javascript", "typescript" },
		["rust_analyzer"] = { "rust" },
		["clangd-format"] = { "php" },
	},
})
lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-h>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	vim.keymap.set("n", "<C-s>", function()
		vim.diagnostic.open_float()
	end, opts)
end)

lsp.setup()
vim.diagnostic.config({
	virtual_text = true,
})
