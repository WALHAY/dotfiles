return {
	"stevearc/conform.nvim",
	lazy = false,
	event = "BufWritePre",
	cmd = "ConformInfo",
	keys = {
		{
			"<leader>bf",
			function()
				require("conform").format({
					async = true,
					lsp_fallback = true,
					on_formatter = function(bufnr)
						-- reload file after fmt
						vim.cmd("checktime")
					end,
				})
			end,
			mode = "",
			desc = "Format Buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			java = { "spotless" },
			c = { "clang-format" },
			python = { "autopep8" },
			cpp = { "clang-format" },
		},
		formatters = {
			spotless = {
				command = "gradle",
				args = { "spotlessApply" },
				stdin = false,
			},
		},
	},
}
