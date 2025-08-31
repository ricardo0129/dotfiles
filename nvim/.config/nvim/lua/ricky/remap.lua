-- Remap Leader
vim.g.mapleader = " "


-- Dir Navigation
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Selecting Macro
vim.keymap.set("n", "<leader>sa", "gg<S-v>G")
vim.keymap.set("n", "<leader>sp", "<S-v>}")


-- Competitive Programming Stuff
vim.keymap.set("n", "<leader>rt", ":0read ~/template.cpp<CR>")
vim.api.nvim_set_keymap('n', '<leader>bw', ':!~/build.sh ' .. string.sub(vim.fn.expand('%'), 1, -5) .. '<CR>', {noremap = true})


-- Disable the default tmux navigator mappings
vim.g.tmux_navigator_no_mappings = 1

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}

-- Disable default mappings
vim.g.tmux_navigator_no_mappings = 1

-- Key mappings for Tmux navigation
map('n', '<C-h>', ':TmuxNavigateLeft<CR>', opts)
map('n', '<C-j>', ':TmuxNavigateDown<CR>', opts)
map('n', '<C-k>', ':TmuxNavigateUp<CR>', opts)
map('n', '<C-l>', ':TmuxNavigateRight<CR>', opts)
map('n', '<C-\\>', ':TmuxNavigatePrevious<CR>', opts)
