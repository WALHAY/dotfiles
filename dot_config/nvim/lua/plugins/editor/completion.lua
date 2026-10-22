return function()
	vim.opt.completeopt = "menuone,noinsert,noselect"

	require("blink.cmp").setup({
		cmdline = { enabled = true, completion = {
			menu = { auto_show = true },
		} },
		keymap = {
			preset = "enter",
			["<Tab>"] = {
				"snippet_forward",
				function()
					if vim.bo.buftype ~= "" then
						return false
					end
					vim.api.nvim_feedkeys(vim.keycode("<Plug>(Tabout)"), "m", false)
					return true
				end,
				"fallback",
			},
			["<S-Tab>"] = {
				"snippet_backward",
				function()
					if vim.bo.buftype ~= "" then
						return false
					end
					vim.api.nvim_feedkeys(vim.keycode("<Plug>(TaboutBack)"), "m", false)
					return true
				end,
				"fallback",
			},
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
end
