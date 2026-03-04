return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		options = {
			-- theme = 'horizon',
			theme = 'citruszest',
			globalstatus = true,
			icons_enabled = true,
			disabled_filetypes = {
				winbar = {
					"snacks_dashboard",
					"Outline",
					"neo-tree",
				},
			},
			ignore_focus = {
				"neo-tree",
			},
		},
		winbar = {
			lualine_a = {
				{ "filename", path = 1 },
			},
			lualine_b = { "navic" },
		},
		inactive_winbar = {
			lualine_a = {
				{ "filename", path = 1 },
			},
			lualine_b = { "navic" },
		},
		inactive_sections = {
			lualine_a = {
				"mode",
			},
			lualine_b = {
				"branch",
				"diff",
				"diagnostics",
			},
		},
		extensions = { "neo-tree" },
	},
}
