if not vim.g.java_setup then
	vim.g.java_setup = true

	local java = require("java")

	java.setup({})

	require("lspconfig").jdtls.setup({})

	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("JavaLspAttach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "Java: " .. desc })
			end

			map("<leader>jc", java.refactor.extract_constant, "Extract Constant")
			map("<leader>jv", java.refactor.extract_variable, "Extract Variable")
			map("<leader>jo", java.refactor.extract_variable_all_occurrence, "Extract All Occurences")
			map("<leader>jm", java.refactor.extract_method, "Extract Method")
			map("<leader>jf", java.refactor.extract_field, "Extract Field")
		end,
	})
end
