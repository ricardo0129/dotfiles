-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use { 'catppuccin/nvim', as = 'catppuccin' }

  use { 'stevearc/conform.nvim' }

  use { 'github/copilot.vim' }

  use {
      'nvim-tree/nvim-tree.lua',
      requires = {
        'nvim-tree/nvim-web-devicons', -- optional
      },
  }

  use { 'christoomey/vim-tmux-navigator' }

  use 'neovim/nvim-lspconfig'             -- LSP support
  use 'hrsh7th/nvim-cmp'                  -- Completion engine
  use 'hrsh7th/cmp-nvim-lsp'              -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'                -- Buffer completions
  use 'hrsh7th/cmp-path'                  -- Path completions
  use 'L3MON4D3/LuaSnip'                  -- Snippet engine
  use 'saadparwaiz1/cmp_luasnip'          -- Snippet completions
  use 'hrsh7th/vim-vsnip'

  use { 'mrcjkb/rustaceanvim' }
  use { 'akinsho/toggleterm.nvim', tag = '*' }

  -- Theme tokyo night
  use { 'folke/tokyonight.nvim'  }


end)
