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

  use{
      'neovim/nvim-lspconfig', 
      opts = {
        inlay_hints = { enabled = true },
      }
  }

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

end)
