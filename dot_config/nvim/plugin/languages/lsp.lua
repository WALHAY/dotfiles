vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/AlexandrosAlexiou/kotlin.nvim",
	{
		src = "https://github.com/JavaHello/spring-boot.nvim",
		version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
	},
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/nvim-java/nvim-java",
})

require("mason").setup()
require("mason-lspconfig").setup()

require("java").setup({
	jdk = { auto_install = true },
	jdtls = {
		version = "1.58.0",
	},
	spring_boot_tools = { enable = false },
	java_test = { enable = true },
	java_debug_adapter = { enable = true },
})

vim.lsp.enable("jdtls")
vim.lsp.enable("lua_ls")
vim.lsp.enable("kotlin_lsp")
