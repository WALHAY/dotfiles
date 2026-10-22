return function()
	require("nvim-navic").setup({
		separator = " \u{e0b1} ",
		highlight = false,
		depth_limit = 0,
		depth_limit_indicator = "..",
		lazy_update_context = false,
		lsp = {
			auto_attach = true,
		},
	})

	-- Lualine owns the winbar; breadcrumbs is kept installed for optional use.

	require("lualine").setup({
		options = {
			globalstatus = true,
			icons_enabled = true,
			disabled_filetypes = {
				winbar = {
					"snacks_dashboard",
					"ministarter",
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
end
