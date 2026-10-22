return function()
	-- Completion capabilities must be set before Mason enables any server.
	vim.lsp.config("*", {
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	})

	require("mason").setup()
	require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "clangd", "bashls", "kotlin_lsp" },
		automatic_enable = { exclude = { "kotlin_lsp", "jdtls", "java_language_server" } },
	})

	-- kotlin.nvim and intellij-server own JVM servers.
	vim.lsp.enable({ "lua_ls", "clangd", "bashls" })
end
