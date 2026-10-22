return function()
	require("citruszest").setup({
		option = {
			transparent = true,
		},
	})

	vim.cmd.colorscheme("citruszest")
end
