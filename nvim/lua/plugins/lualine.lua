return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		options = {
			icons_enabled = true,
			disabled_filetypes = {
				winbar = {
					"neo-tree",
					"snacks_dashboard",
				},
				statusline = {
					"neo-tree",
				},
			},
		},
		winbar = {
			lualine_a = { "filename" },
			lualine_b = { "navic" },
		},
	},
}
