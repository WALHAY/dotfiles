local M = {}

M.setup = function()
	vim.opt.clipboard = "unnamedplus"
	vim.opt.undofile = true
	vim.opt.termguicolors = true

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

	vim.o.foldmethod = "manual"
	vim.o.foldlevelstart = 99
	vim.o.foldlevel = 99
	vim.o.foldenable = false
end

return M
