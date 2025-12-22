-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
	noremap = true,
	silent = true,
	desc = "Toggle NvimTree",
})

-- OR setup with some options
require("nvim-tree").setup({
	sort = {
		sorter = "case_sensitive",
	},
	view = {
		width = 20,
	},
	renderer = {
		icons = {
			show = {
				file = false,
				folder = false,
				folder_arrow = false,
				git = false,
			},
		},
	},
	filters = {
		dotfiles = true,
	},
})
