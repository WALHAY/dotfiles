local M = {}

-- Dependencies are registered first in config/packages.lua.
-- Keep the setup order explicit: UI backends -> completion -> LSP -> integrations.
M.modules = {
	"plugins.ui.theme",
	"plugins.ui.notify",
	"plugins.navigation.snacks",
	"plugins.ui.noice",
	"plugins.editor.tabout",
	"plugins.editor.completion",
	"plugins.editor.treesitter",
	"plugins.lsp",
	"plugins.lsp.java",
	"plugins.lsp.kotlin",
	"plugins.navigation.neo-tree",
	"plugins.navigation.oil",
	"plugins.navigation.flash",
	"plugins.editor.formatting",
	"plugins.editor.trouble",
	"plugins.git.gitsigns",
	"plugins.git.conflicts",
	"plugins.git.octo",
	"plugins.tasks.overseer",
	"plugins.tasks.gradle",
	"plugins.ui.lualine",
	"plugins.sessions",
	"plugins.ui.starter",
	"plugins.ui.cord",
	"plugins.ui.which-key",
}

function M.setup()
	for _, name in ipairs(M.modules) do
		require(name)()
	end
end

return M
