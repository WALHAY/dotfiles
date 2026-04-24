local M = {}

M.setup = function()
	vim.g.mapleader = " "

	vim.opt.clipboard = "unnamedplus"

	vim.opt.numberwidth = 3
	vim.opt.signcolumn = "yes:1"
	vim.opt.statuscolumn = "%l%s"

	vim.opt.scrolloff = 10

	vim.opt.shiftwidth = 4
	vim.opt.tabstop = 4
	vim.opt.wrap = true

	vim.wo.relativenumber = true
	vim.wo.number = true

	vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

	vim.diagnostic.config({
		virtual_text = true,
		virtual_lines = false,
	})
	require('vim._core.ui2').enable({})
end

return M
