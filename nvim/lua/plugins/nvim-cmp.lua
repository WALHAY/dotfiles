return {
	"hrsh7th/nvim-cmp",

	dependencies = {
		{
			"garymjr/nvim-snippets",
			opts = {
				friendly_snippets = true,
			},
			dependencies = { "rafamadriz/friendly-snippets" },
		},
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
	},
	config = function()
		require("cmp").setup({
			sources = {
				{ name = "nvim_lsp" },
				{ name = "snippets" },
				{ name = "buffer" },
			},
		})
	end,
}
