local M = {}

-- Register each dependency exactly once; nvim-pack-lock.json pins revisions.
M.specs = {
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/williamboman/mason.nvim",
	"https://github.com/williamboman/mason-lspconfig.nvim",
	"https://github.com/abecodes/tabout.nvim",
	{ src = "https://github.com/saghen/blink.cmp", version = vim.version.range("^1") },
	"https://github.com/LunarVim/breadcrumbs.nvim",
	"https://github.com/zootedb0t/citruszest.nvim",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/vyfor/cord.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/akinsho/git-conflict.nvim",
	"https://github.com/lewis6991/gitsigns.nvim",
	"https://github.com/oclay1st/gradle.nvim",
	"https://github.com/AlexandrosAlexiou/intellij-server.nvim",
	"https://github.com/AlexandrosAlexiou/kotlin.nvim",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-mini/mini.sessions",
	"https://github.com/nvim-mini/mini.starter",
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/folke/noice.nvim",
	{ src = "https://github.com/rcarriga/nvim-notify", name = "notify" },
	"https://github.com/SmiteshP/nvim-navic",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/pwntester/octo.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/stevearc/overseer.nvim",
	"https://github.com/folke/snacks.nvim",
	{ src = "https://github.com/JavaHello/spring-boot.nvim", version = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0" },
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/folke/trouble.nvim",
	"https://github.com/folke/which-key.nvim",
}

function M.setup()
	vim.pack.add(M.specs)
end

function M.clean()
	local unused = {}
	for _, plugin in ipairs(vim.pack.get()) do
		if not plugin.active then
			unused[#unused + 1] = plugin.spec.name
		end
	end
	table.sort(unused)
	if #unused == 0 then
		vim.notify("No unused plugins.")
		return
	end
	local prompt = "Remove unused plugins?\n" .. table.concat(unused, "\n")
	if vim.fn.confirm(prompt, "&Yes\n&No", 2) == 1 then
		vim.pack.del(unused)
	end
end

return M
