-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.3',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use({
	  'rose-pine/neovim',
  	  as = 'rose-pine',
	  config = function()
		  vim.cmd('colorscheme rose-pine')
      end
  })
--    use({
--	  'lourenci/github-colors',
--	  as = 'github-colors',
--	  config = function()
--		  vim.cmd('colorscheme github-colors')
--	  end
--  })

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v2.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},             -- Required
		  {'williamboman/mason.nvim'},           -- Optional
		  {'williamboman/mason-lspconfig.nvim'}, -- Optional

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},     -- Required
		  {'hrsh7th/cmp-nvim-lsp'}, -- Required
		  {'L3MON4D3/LuaSnip'},     -- Required
	  }
  }
  use('mfussenegger/nvim-dap')
  use{
      'barrett-ruth/live-server.nvim',
        build = 'yarn global add live-server',
        config = true
    }
    use 'freddiehaddad/feline.nvim'
    use 'nvim-tree/nvim-web-devicons'
--    use "lukas-reineke/indent-blankline.nvim"
    use 'rbong/vim-flog'
   -- use {
--        'nvim-lualine/lualine.nvim',
  --      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    --}
end)
