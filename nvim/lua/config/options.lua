return {
	config = function()
		-- vim.g.neon_style = "dark"
		-- vim.cmd("colorscheme palenightfall")
		vim.cmd("colorscheme citruszest")
		-- vim.cmd("colorscheme aylin")
		-- vim.cmd("colorscheme fluoromachine")

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

		vim.lsp.enable("lua_ls")
		vim.lsp.enable("jdtls")
		vim.lsp.enable("clangd")
		vim.lsp.enable("gopls")
	end,
}
