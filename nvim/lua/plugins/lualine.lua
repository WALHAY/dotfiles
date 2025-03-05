return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	opts = {
		theme = "fluoromachine",
		globalstatus = true,
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
		},
		winbar = {
			lualine_a = { { "filename", path = 1 } },
			lualine_b = { "navic" },
		},
		inactive_winbar = {
			lualine_a = { { "filename", path = 1 } },
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
	},
}
