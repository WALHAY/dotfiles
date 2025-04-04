return {
	"gbprod/yanky.nvim",
	lazy = true,
	event = "TextYankPost",
	cmd = { "YankyClearHistory", "YankyRingHistory" },
	opts = {
		ring = {
			history_length = 100,
			storage = "shada",
			storage_path = vim.fn.stdpath("data") .. "/databases/yanky.db", -- Only for sqlite storage
			sync_with_numbered_registers = true,
			cancel_event = "update",
			ignore_registers = { "_" },
			update_register_on_cycle = false,
			permanent_wrapper = nil,
		},
		picker = {
			select = {
				action = nil, -- nil to use default put action
			},
		},
		system_clipboard = {
			sync_with_ring = true,
			clipboard_register = nil,
		},
		preserve_cursor_position = {
			enabled = true,
		},
		textobj = {
			enabled = true,
		},
	},
}
