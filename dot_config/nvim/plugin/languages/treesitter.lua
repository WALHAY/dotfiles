vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").setup({
	ensure_installed = {
		"lua",
		"vim",
		"vimdoc",
		"bash",
		"json",
		"yaml",
		"kotlin",
		"java",
	},

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},

	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<C-space>",
			node_incremental = "<C-space>",
			scope_incremental = false,
			node_decremental = "<bs>",
		},
	},
})
