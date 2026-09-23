vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

local parsers = {
		"lua",
		"vim",
		"vimdoc",
		"bash",
		"json",
		"yaml",
		"kotlin",
		"java",
		"c",
		"cpp",
}

require("nvim-treesitter").setup({})
require("nvim-treesitter").install(parsers)

vim.api.nvim_create_autocmd("FileType", {
	callback = function(args)
		local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
		if language then
			pcall(vim.treesitter.start, args.buf, language)
		end
	end,
})

vim.api.nvim_create_autocmd("PackChanged", {
	pattern = "nvim-treesitter",
	callback = function()
		vim.schedule(function()
			require("nvim-treesitter").install(parsers)
		end)
	end,
})
