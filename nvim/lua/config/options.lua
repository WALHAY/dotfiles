return {
	config = function()
		vim.cmd("colorscheme fluoromachine")

		vim.opt.shiftwidth = 4
		vim.opt.tabstop = 4

		vim.wo.relativenumber = true
		vim.wo.number = true

		vim.g.autosave_notify = false
		vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
	end,
}
