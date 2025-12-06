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
		"maxmx03/fluoromachine.nvim",
		lazy = true,
		enabled = false,
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
				styles = {},
				colors = function(_, color)
					return custom_first
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
	{
		"JoosepAlviste/palenightfall.nvim",
		lazy = true,
	},
	{
		"zootedb0t/citruszest.nvim",
		enabled = false,
		lazy = true,
		opts = {
			option = {
				transparent = true,
				italic = true,
				bold = true,
			},
		},
		priority = 1000,
	},
	{
		"AhmedAbdulrahman/aylin.vim",
		lazy = true,
	},
	{
		"rijulpaul/nightblossom.nvim",
		name = "nightblossom",
		lazy = false,
		priority = 1000,
		opts = {
			variant = "sakura", -- "spring", "sakura", "pastel"
			transparent = true, -- Enable background transparency
			integrations = {
				treesitter = true, -- TreeSitter highlighting
			},
		},
	},
	{
   		"ianklapouch/wildberries.nvim",
   		name = "wildberries",
		enabled = false,
	},
}
