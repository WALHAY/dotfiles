return {
	"okuuva/auto-save.nvim",
	version = "^1.0.0",
	opts = {
		enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
		trigger_events = { -- see :h events
			immediate_save = { "bufleave", "focuslost", "quitpre", "vimsuspend" }, -- vim events that trigger an immediate save
			defer_save = { "insertleave", "textchanged" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
			cancel_deferred_save = { "insertenter" }, -- vim events that cancel a pending deferred save
		},
		-- function that takes the buffer handle and determines whether to save the current buffer or not
		-- return true: if buffer is ok to be saved
		-- return false: if it's not ok to be saved
		-- if set to `nil` then no specific condition is applied
		condition = nil,
		write_all_buffers = false, -- write all buffers when the current one meets `condition`
		noautocmd = false, -- do not execute autocmds when saving
		lockmarks = false, -- lock marks when saving, see `:h lockmarks` for more details
		debounce_delay = 3000, -- delay after which a pending save is executed
		-- log debug messages to 'auto-save.log' file in neovim cache directory, set to `true` to enable
		debug = false,
	},
}
