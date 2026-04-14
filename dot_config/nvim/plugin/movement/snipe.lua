vim.pack.add({
	"https://github.com/leath-dub/snipe.nvim",
})

local snipe = require("snipe")

snipe.setup({
	position = "center"
})

vim.keymap.set({"n", "v", "x"}, "gb", function () snipe.open_buffer_menu() end, { desc = "Snipe buffer" })
