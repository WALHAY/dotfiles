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

local jdtls_source = "brew" -- Set to "brew" to use Homebrew's JDTLS.
local mason_jdtls_path = vim.fn.stdpath("data") .. "/mason/packages/jdtls"
local jdtls_path
local ensure_installed = { "kotlin_lsp", "clangd" }

if jdtls_source == "mason" then
	jdtls_path = mason_jdtls_path
	table.insert(ensure_installed, "jdtls")
elseif jdtls_source == "brew" then
	local brew_prefix = vim.fn.systemlist({ "brew", "--prefix", "jdtls" })[1]
	if vim.v.shell_error ~= 0 or not brew_prefix then
		error("Unable to resolve Homebrew JDTLS. Install it with `brew install jdtls`.")
	end
	jdtls_path = brew_prefix .. "/libexec"
else
	error('Invalid jdtls_source: expected "mason" or "brew"')
end

require("mason-lspconfig").setup({
	ensure_installed = ensure_installed,
	automatic_enable = {
		exclude = { "kotlin_lsp", "jdtls" },
	},
})

require("java").setup({
	lombok = {
		enable = false,
	},
	jdk = { auto_install = false },
	jdtls = {
		auto_install = false,
		path = jdtls_path,
	},
	spring_boot_tools = { enable = false },
	java_test = { enable = false },
	java_debug_adapter = { enable = false },
})

require("kotlin").setup({
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

vim.lsp.config("*", {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.keymap.set("n", "grh", function()
	local bufnr = vim.api.nvim_get_current_buf()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })
end, { desc = "Toggle inlay hints" })

vim.lsp.enable("jdtls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
