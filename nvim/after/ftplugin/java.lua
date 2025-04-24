if not vim.g.java_setup then
	vim.g.java_setup = true

	vim.notify("Setup: nvim-java")

	local java = require("java")

	java.setup({
		root_markers = {
			"settings.gradle",
			"settings.gradle.kts",
			"pom.xml",
			"build.gradle",
			"mvnw",
			"gradlew",
			"build.gradle",
			"build.gradle.kts",
			".git",
		},

		jdtls = {
			version = "v1.43.0",
		},

		lombok = {
			enable = true,
			version = "nightly",
		},

		-- load java test plugins
		java_test = {
			enable = true,
			version = "0.43.0",
		},

		-- load java debugger plugins
		java_debug_adapter = {
			enable = true,
			version = "0.58.1",
		},

		spring_boot_tools = {
			enable = false,
			version = "1.55.1",
		},

		notifications = {
			-- enable 'Configuring DAP' & 'DAP configured' messages on start up
			dap = false,
		},
	})

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
