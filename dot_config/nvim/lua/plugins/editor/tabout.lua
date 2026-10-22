return function()
	require("tabout").setup({
		-- Blink owns Tab and falls back to these Plug mappings.
		tabkey = "",
		backwards_tabkey = "",
		act_as_tab = true,
		act_as_shift_tab = false,
		completion = false,
		tabouts = {
			{ open = "'", close = "'" },
			{ open = '"', close = '"' },
			{ open = "`", close = "`" },
			{ open = "(", close = ")" },
			{ open = "[", close = "]" },
			{ open = "{", close = "}" },
		},
		exclude = { "TelescopePrompt", "NvimTree", "neo-tree", "snacks_picker_input", "oil" },
	})
end
