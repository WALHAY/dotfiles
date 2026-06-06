vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	{
		src = "https://github.com/JavaHello/spring-boot.nvim",
		version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
	},
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-java/nvim-java",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/AlexandrosAlexiou/kotlin.nvim",
})

require("oil").setup()
require("trouble").setup()
require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "kotlin_lsp" },
	automatic_enable = {
		exclude = { "kotlin_lsp" },
	},
})

require("java").setup({
	jdk = { auto_install = false },
	jdtls = {
		soversion = nil,
	},
	spring_boot_tools = { enable = false },
	java_test = { enable = true },
	java_debug_adapter = { enable = true },
})

require("kotlin").setup({
	jre_path = os.getenv("JAVA_HOME"),

	jvm_args = {
		"-Xmx2g",
	},

	root_markers = {
		"build.gradle",
		"build.gradle.kts",
		"settings.gradle",
		"settings.gradle.kts",
		"pom.xml",
		"mvnw",
		".git",
	},

	inlay_hints = {
		enabled = true, -- Master switch: enable/disable all inlay hints

		-- Parameter hints (show parameter names in function calls)
		parameters = true, -- foo(name: "value", age: 42)
		parameters_compiled = true, -- Show parameter names for compiled code
		parameters_excluded = false, -- Show hints for excluded parameters (usually false)

		-- Type hints (show inferred types)
		types_property = true, -- val name: String = "foo"
		types_variable = true, -- val count: Int = 42
		function_return = true, -- fun foo(): String { }
		function_parameter = true, -- fun foo(name: String) { }

		-- Lambda hints
		lambda_return = true, -- { x -> x * 2 }: (Int) -> Int
		lambda_receivers_parameters = true, -- Show receivers and parameters

		-- Other hints
		value_ranges = true, -- Show hints for ranges
		kotlin_time = true, -- Show kotlin.time warnings
	},
})

vim.keymap.set("n", "grh", function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end, { desc = "Toggle inlay hints" })

vim.lsp.enable("jdtls")
vim.lsp.enable("lua_ls")
