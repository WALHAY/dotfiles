vim.pack.add({ "https://github.com/abecodes/tabout.nvim" })

require("tabout").setup({
	tabkey = "<Tab>",
	backwards_tabkey = "<S-Tab>",
	act_as_tab = true,
	act_as_shift_tab = false,
	completion = true,
	tabouts = {
		{ open = "'", close = "'" },
		{ open = '"', close = '"' },
		{ open = "`", close = "`" },
		{ open = "(", close = ")" },
		{ open = "[", close = "]" },
		{ open = "{", close = "}" },
	},
	exclude = { "TelescopePrompt", "NvimTree" },
})
