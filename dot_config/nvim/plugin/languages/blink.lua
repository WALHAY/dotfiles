vim.pack.add({
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
})

require("blink.cmp").setup({
	cmdline = { enabled = true, completion = {
		menu = { auto_show = true },
	} },
	keymap = {
		preset = "enter",
	},
	completion = {
		keyword = { range = "full" },
		accept = { auto_brackets = { enabled = false } },
	},
	sources = {
		default = { "lsp", "path", "buffer" },
	},
	signature = { enabled = true },
	fuzzy = { implementation = "prefer_rust" },
})
