local function custom_which_key()
	local which_key = require("which-key")

	which_key.add({
		{ "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
	})
end

return {
	config = function()
		custom_which_key()

		-- ## LAZY VIM MAPPINGS ## --

		local map = vim.keymap.set

		-- Move Lines
		map("n", "<D-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
		map("n", "<D-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
		map("i", "<D-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
		map("i", "<D-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
		map("v", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
		map("v", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

		-- buffers
		map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		map("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

		-- Clear search with <esc>
		map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

		-- Add undo break-points
		map("i", ",", ",<c-g>u")
		map("i", ".", ".<c-g>u")
		map("i", ";", ";<c-g>u")

		-- Terminal Mappings
		map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
		map("t", "<C-/>", "<cmd>close<cr>", { desc = "Hide Terminal" })
		map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

		-- windows
		map("n", "<leader>w", "<c-w>", { desc = "Windows", remap = true })
		map("n", "<leader>-", "<C-W>s", { desc = "Split Window Below", remap = true })
		map("n", "<leader>|", "<C-W>v", { desc = "Split Window Right", remap = true })
		map("n", "<leader>wd", "<C-W>c", { desc = "Delete Window", remap = true })

		-- tabs
		map("n", "<C-a>", "<cmd>BufferLineMovePrev<cr>", { desc = "Move Tab Left" })
		map("n", "<C-d>", "<cmd>BufferLineMoveNext<cr>", { desc = "Move Tab Right" })
	end,
}
