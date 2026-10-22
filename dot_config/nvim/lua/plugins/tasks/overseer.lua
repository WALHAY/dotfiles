return function()
	require("overseer").setup({
		task_win = {
			padding = 2,
			border = "single",
			win_opts = { winblend = 0, wrap = true },
		},
		task_list = {
			min_width = 0.3,
			max_width = 0.3,
			min_height = 0.3,
			max_height = 0.3,
		},
	})
end
