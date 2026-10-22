return function()
	require("intellij-server").setup({
		filetypes = { "java" },
		capabilities = require("blink.cmp").get_lsp_capabilities(),
	})
end
