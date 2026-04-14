vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/AlexandrosAlexiou/kotlin.nvim",
})

require("mason").setup()
require("mason-lspconfig").setup()

local null_ls = require("null-ls")

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.ktlint,
		null_ls.builtins.diagnostics.ktlint,

		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.selene,

		null_ls.builtins.formatting.shfmt,
		null_ls.builtins.formatting.google_java_format,
	},
})

require("kotlin").setup({
	root_markers = {
		"gradlew",
		".git",
		"mvnw",
		"settings.gradle",
	},

	jre_path = nil, -- Use bundled JRE (recommended)

	jdk_for_symbol_resolution = nil, -- Auto-detect from project

	jvm_args = {
		"-Xmx4g", -- Increase max heap (useful for large projects)
	},

	inlay_hints = {
		enabled = true, -- Enable inlay hints (auto-enable on LSP attach)
		parameters = true, -- Show parameter names
		parameters_compiled = true, -- Show compiled parameter names
		parameters_excluded = false, -- Show excluded parameter names
		types_property = true, -- Show property types
		types_variable = true, -- Show local variable types
		function_return = true, -- Show function return types
		function_parameter = true, -- Show function parameter types
		lambda_return = true, -- Show lambda return types
		lambda_receivers_parameters = true, -- Show lambda receivers/parameters
		value_ranges = true, -- Show value ranges
		kotlin_time = true, -- Show kotlin.time warnings
	},
})
