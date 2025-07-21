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
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			java = { "gradle", "spotlessApply" },
			c = { "clang-format" },
			python = { "autopep8" },
			cpp = { "clang-format", "-style=Microsoft" },
		},
	},
}
