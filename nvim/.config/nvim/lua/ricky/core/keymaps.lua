-- Remap Leader
vim.g.mapleader = " "

-- Disable the default tmux navigator mappings
vim.g.tmux_navigator_no_mappings = 1

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Disable default mappings
vim.g.tmux_navigator_no_mappings = 1

-- Key mappings for Tmux navigation
map("n", "<C-h>", ":TmuxNavigateLeft<CR>", opts)
map("n", "<C-j>", ":TmuxNavigateDown<CR>", opts)
map("n", "<C-k>", ":TmuxNavigateUp<CR>", opts)
map("n", "<C-l>", ":TmuxNavigateRight<CR>", opts)

map("n", "<leader>re", "<cmd>restart<cr>", {
    desc = "Restart Neovim (:restart)",
})
