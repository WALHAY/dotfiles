vim.pack.add({ "https://github.com/stevearc/overseer.nvim" })

require("overseer").setup({
	task_win = {
		height = 0.8, -- 80% of screen height for log window
		width = 0.9, -- 90% width for wide logs
		border = "single", -- Optional: border style
		winblend = 0, -- No transparency
	},
	-- For list window (OverseerToggle)
	task_list = {
		width = 0.3, -- Keep list narrow
		height = 0.3,
	},
})

vim.keymap.set({ "n", "v", "o" }, "<leader>rr", "<cmd>OverseerToggle<CR>", { desc = "Toggle task runner" })
vim.keymap.set({ "n", "v", "o" }, "<leader>rj", "<cmd>OverseerRun<CR>", { desc = "Run task" })
