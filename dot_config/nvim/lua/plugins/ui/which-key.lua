return function()
	local wk = require("which-key")
	wk.setup()
	wk.add({
		{ "<leader>b", group = "buffer" },
		{ "<leader>f", group = "find" },
		{ "<leader>G", group = "Gradle" },
		{ "<leader>o", group = "GitHub" },
		{ "<leader>p", group = "plugins" },
		{ "<leader>q", group = "session" },
		{ "<leader>r", group = "run" },
		{ "<leader>x", group = "diagnostics" },
	})
end
