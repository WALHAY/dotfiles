return {
	"stevearc/conform.nvim",
	lazy = false,
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format Buffer",
		},
	},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				java = { "./gradlew spotlessApply" },
				c = { "clang-format" },
				python = { "autopep8" },
				cpp = { "clang-format", "-style=Microsoft" },
			},
		})
	end,
}
