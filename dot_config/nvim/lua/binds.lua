local M = {}

M.setup = function()
	vim.keymap.set({ "n", "v" }, "ciq", 'ci"', {
		remap = true,
		desc = "Change inner quote",
	})

	vim.keymap.set({ "n", "v" }, "ciQ", "ci'", {
		remap = true,
		desc = "Change inner quote",
	})

	vim.keymap.set({ "n", "v" }, "caq", 'ai"', {
		remap = true,
		desc = "Change around quote",
	})

	vim.keymap.set({ "n", "v" }, "caQ", "ai'", {
		remap = true,
		desc = "Change around quote",
	})
end

return M
