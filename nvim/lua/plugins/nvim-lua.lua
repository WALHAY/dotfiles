return {
	{
		"folke/lazydev.nvim",
		lazy = false,
		opts = {
			library = {
				{
					path = "luvit-meta/library",
					words = {
						"vim%.uv",
					},
				},
			},
		},
	},
	{
		"Bilal2453/luvit-meta",
		lazy = true,
	},
}
