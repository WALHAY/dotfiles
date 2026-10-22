return function()
	require("conform").setup({
		formatters_by_ft = {
			sh = { "shfmt" },
			bash = { "shfmt" },
			lua = { "stylua" },
			sql = { "sqruff" },
			java = { "palantir-java-format" },
			kotlin = { "ktlint" },
			c = { "clang-format" },
			cpp = { "clang-format" },
		},
	})
end
