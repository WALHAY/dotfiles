vim.pack.add({
	{
		src = "https://github.com/folke/snacks.nvim",
		name = "snacks.nvim",
	},
})

local snacks = require("snacks")

snacks.setup({
	picker = {
		enabled = true,
		filename = true,
		hidden = true,
		layout = {
			width = 0.6,
			height = 0.7,
		},
	},
	notifier = {
		enabled = true,
	},
	indent = {
		enabled = true,
	},
	words = {
		enabled = true,
	},
})

vim.keymap.set("n", "<C-p>", function()
	snacks.picker.files()
end, { desc = "Snacks: files" })
vim.keymap.set("n", "<leader>ff", function()
	snacks.picker.files()
end, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", function()
	snacks.picker.grep()
end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", function()
	snacks.picker.buffers()
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fj", function()
	snacks.picker.jumplist()
end, { desc = "Jumplist" })

vim.keymap.set("n", "<leader>fd", function()
	snacks.picker.diagnostics()
end, { desc = "Diagnostics" })
