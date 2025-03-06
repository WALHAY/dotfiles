return {
	{
		"nyoom-engineering/oxocarbon.nvim",
		lazy = true,
	},
	{
		"theamallalgi/zitchdog",
		lazy = true,
	},
	{
		"eldritch-theme/eldritch.nvim",
		lazy = true,
	},
	{
		"maxmx03/fluoromachine.nvim",
		lazy = true,
		config = function()
			local custom_first = {
				comments = { italic = true, fg = "#8c7aa9" },
				functions = { fg = "#b388eb" },
				variables = {},
				numbers = {},
				constants = { bold = true, fg = "#fa198b" }, -- #60b2e5
				parameters = { fg = "#8093f1" },
				keywords = { fg = "#60b2e5" },
				types = { fg = "#fa43a1" },
			}

			local custom_second = {
				comments = { italic = true },
				functions = {},
				variables = {},
				numbers = {},
				constants = { bold = true },
				parameters = { fg = "#8ae9c1" },
				keywords = { fg = "#087e8b" },
				types = { fg = "#ff5a5f" },
			}

			require("fluoromachine").setup({
				theme = "retrowave",
				brightness = 0.05,
				glow = true,
				transparent = false,
				styles = custom_first,
				colors = function(_, color)
					local darken = color.darken
					return {
						orange = "#436ee1",
						yellow = "#acadfe",
						purple = "#fa189b",
						red = "#fa43a1",
					}
				end,
				overrides = {},
				plugins = {
					bufferline = true,
					cmp = true,
					dashboard = true,
					editor = true,
					gitsign = true,
					hop = true,
					ibl = true,
					illuminate = true,
					lazy = true,
					minicursor = true,
					ministarter = true,
					minitabline = true,
					ministatusline = true,
					navic = true,
					neogit = true,
					neotree = true,
					noice = true,
					notify = true,
					lspconfig = true,
					syntax = true,
					telescope = true,
					treesitter = true,
					tree = true,
					wk = true,
				},
			})
		end,
	},
}
