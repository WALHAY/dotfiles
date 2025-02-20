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
					"Outline",
				},
				statusline = {
					"neo-tree",
					"Outline",
				},
			},
			always_show_winbar = true,
		},
		winbar = {
			lualine_a = { { "filename", path = 1 } },
			lualine_b = { "navic" },
		},
	},
}
