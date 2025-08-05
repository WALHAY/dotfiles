return {
	"hedyhli/outline.nvim",
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	opts = {
		outline_window = {
			auto_jump = true,
			auto_close = true,
			show_relative_numbers = true,
			show_cursorline = true,
		},
		symbol_folding = {
			autofold_depth = 2,
		},
	},
	keys = {
		{ "<leader>o", "<cmd>Outline<cr>", desc = "Toggle File Symbols" },
	},
}
