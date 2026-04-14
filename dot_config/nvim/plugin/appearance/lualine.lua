vim.pack.add({
	"https://github.com/SmiteshP/nvim-navic",
	"https://github.com/LunarVim/breadcrumbs.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
})

require("nvim-navic").setup({
	lsp = {
		auto_attach = true,
		separator = " \u{e0b1} ",
		highlight = false,
		depth_limit = 0,
		depth_limit_indicator = "..",
		lazy_update_context = false,
	},
})

require("breadcrumbs").setup()

require("lualine").setup({
	options = {
		theme = "citruszest",
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
})
