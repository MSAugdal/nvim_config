-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.3",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
		cond = true,
	})
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end,
		cond = not vim.g.vscode,
	})

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate", cond = not vim.g.vscode })
	use({ "theprimeagen/harpoon", cond = true })
	use({ "mbbill/undotree", cond = true })
	use({ "tpope/vim-fugitive", cond = true })
	use({ "mhartington/formatter.nvim", cond = true })

	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
		},
	})
	use("mfussenegger/nvim-dap")
	use("freddiehaddad/feline.nvim")
	use("nvim-tree/nvim-web-devicons")
	use("rbong/vim-flog")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
