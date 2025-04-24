return {
	config = function()
		vim.g.neon_style = "dark"
		vim.cmd("colorscheme neon")

		vim.opt.clipboard = "unnamedplus"

		vim.opt.shiftwidth = 4
		vim.opt.tabstop = 4
		vim.opt.wrap = true

		vim.wo.relativenumber = true
		vim.wo.number = true

		vim.g.autosave_notify = false
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

		vim.diagnostic.config({
			virtual_text = true,
			virtual_lines = false,
		})

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("jdtls")
		vim.lsp.enable("pylsp")
		vim.lsp.enable("clangd")
		vim.lsp.enable("asm_lsp")
	end,
}
