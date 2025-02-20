return {
	config = function()
		vim.cmd("colorscheme zitchdog-night")

		vim.opt.shiftwidth = 4
		vim.opt.tabstop = 4

		vim.wo.relativenumber = true
		vim.wo.number = true
	end,
}
