vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		sql = { "sqruff" },
	},
})

vim.keymap.set("n", "<leader>bf", function()
	require("conform").format({})
end, { desc = "Format buffer" })
