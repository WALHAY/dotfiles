return {
	"akinsho/bufferline.nvim",
	lazy = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {}
	-- config = function()
	-- 	local colors = vim.g.colors
	-- 	local red = colors.red
	-- 	local black = colors.black
	-- 	local cyan = colors.cyan
	-- 	local main = {
	-- 		bg = cyan,
	-- 		fg = black,
	-- 	}
	--
	-- 	local inverted_main = {
	-- 		fg = cyan,
	-- 		bg = black,
	-- 	}
	--
	-- 	require("bufferline").setup({
	-- 		options = {
	-- 			truncate_names = true,
	-- 			max_name_length = 15,
	-- 			max_prefix_length = 10,
	-- 			separator_style = { "\u{e0b8}", "\u{e0b9}" },
	-- 			themable = true,
	-- 			indicator = {
	-- 				icon = "\u{e0b8} ",
	-- 			},
	-- 		},
	--
	-- 		highlights = {
	-- 			modified_selected = {
	-- 				bg = cyan,
	-- 				fg = red,
	-- 			},
	-- 			buffer_selected = main,
	-- 			separator_selected = inverted_main,
	-- 			separator = inverted_main,
	-- 			close_button_selected = main,
	-- 			indicator_selected = main,
	-- 		},
	-- 	})
	-- end,
}
