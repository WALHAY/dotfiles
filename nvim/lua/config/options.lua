return {
	config = function()
		vim.cmd("colorscheme fluoromachine")

		vim.opt.clipboard = "unnamedplus"

		vim.opt.shiftwidth = 4
		vim.opt.tabstop = 4

		vim.wo.relativenumber = true
		vim.wo.number = true

		vim.g.autosave_notify = false
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		vim.diagnostic.config({
			virtual_text = false,
			virtual_lines = true,
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("jdtls")
	end,
}
