return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		-- options = {
		-- 	theme = "horizon",
		-- },
		winbar = {
			lualine_a = { "navic", color_correction = "dynamic" },
		},
	},
}
