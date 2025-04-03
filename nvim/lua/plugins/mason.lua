return {
	{
		"williamboman/mason.nvim",
		config = true,
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"stylua",
				"clang-format",
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"clangd",
				"jdtls",
			},
			automatic_installation = true,
		},
	},
}
