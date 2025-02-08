local function custom_which_key()
	local which_key = require("which-key")

	local opts = {
		mode = "n", -- NORMAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local vopts = {
		mode = "v", -- VISUAL mode
		prefix = "<leader>",
		buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
		silent = true, -- use `silent` when creating keymaps
		noremap = true, -- use `noremap` when creating keymaps
		nowait = true, -- use `nowait` when creating keymaps
	}

	local mappings = {
		-- ToggleTerm
		x = { "<cmd>ToggleTerm direction=horizontal size=15<cr>", "Toggle Terminal" },
		-- NeoGit
		g = {
			g = { "<cmd>Neogit<cr>", "Open NeoGit" },
		},
		-- Neovim-Project
		k = {
			name = "Projects",
			s = { "<cmd>Telescope projects<cr>", "Load Recent Project" },
		},
		-- Explorer
		e = { "<cmd>Neotree toggle<cr>", "Explorer" },
		-- Hop
		h = {
			name = "Hop",
			w = { "<cmd>HopWord<cr>", "Hop Word" },
			f = { "<cmd>HopPattern<cr>", "Hop Pattern" },
			l = { "<cmd>HopLine<cr>", "Hop Line" },
		},
		-- Neoclip
		C = { "<cmd>Telescope neoclip<cr>", "Clipboard" },
		--  Nvim-window
		w = { "<cmd>lua require('nvim-window').pick()<cr>", "Window Selector" },
	}

	local vmappings = {}

	which_key.register(mappings, opts)
	which_key.register(vmappings, vopts)
end

return {
	config = function()
		custom_which_key()

		-- ## LAZY VIM MAPPINGS ## --

		local map = vim.keymap.set

		-- Hop
		map("", "f", "<cmd>HopChar1AC<cr>")
		map("", "F", "<cmd>HopChar1BC<cr>")

		-- Move Lines
		map("n", "<D-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
		map("n", "<D-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
		map("i", "<D-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
		map("i", "<D-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
		map("v", "<D-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
		map("v", "<D-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })

		-- buffers
		-- map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
		-- map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
		map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
		map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
		map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

		-- Clear search with <esc>
		map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

		-- Add undo break-points
		map("i", ",", ",<c-g>u")
		map("i", ".", ".<c-g>u")
		map("i", ";", ";<c-g>u")

		-- save file
		map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save File" })

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
