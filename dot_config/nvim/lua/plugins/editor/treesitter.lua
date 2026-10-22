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
	"sql",
	"markdown",
	"markdown_inline", -- Noice, hover documentation and the keymap guide.
}

return function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({})
	local group = vim.api.nvim_create_augroup("ConfigTreesitter", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			local language = vim.treesitter.language.get_lang(vim.bo[args.buf].filetype)
			if language then
				pcall(vim.treesitter.start, args.buf, language)
			end
		end,
	})

	local function install_missing()
		if #vim.api.nvim_list_uis() == 0 then
			return
		end
		local installed = treesitter.get_installed("parsers")
		local missing = vim.tbl_filter(function(lang)
			return not vim.tbl_contains(installed, lang)
		end, parsers)
		if #missing > 0 then
			treesitter.install(missing)
		end
	end
	-- Only request missing parsers; update them when the plugin is updated.
	vim.api.nvim_create_autocmd("VimEnter", {
		group = group,
		once = true,
		callback = function()
			vim.schedule(install_missing)
		end,
	})
	vim.api.nvim_create_autocmd("PackChanged", {
		group = group,
		pattern = "nvim-treesitter",
		callback = function(args)
			if args.data and args.data.kind == "update" then
				vim.schedule(function()
					treesitter.update(parsers)
				end)
			end
		end,
	})
end
