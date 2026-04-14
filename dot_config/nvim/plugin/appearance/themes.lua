vim.pack.add({
	"https://github.com/zootedb0t/citruszest.nvim",
})

require("citruszest").setup({
	option = {
		transparent = true,
	},
})

vim.cmd("colorscheme citruszest")
