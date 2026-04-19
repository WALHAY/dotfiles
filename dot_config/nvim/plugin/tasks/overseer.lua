vim.pack.add({ "https://github.com/stevearc/overseer.nvim" })

require("overseer").setup()

vim.keymap.set({ "n", "v", "o" }, "<leader>rr", "<cmd>OverseerToggle<CR>", { desc = "Toggle task runner" })
vim.keymap.set({ "n", "v", "o" }, "<leader>rj", "<cmd>OverseerRun<CR>", { desc = "Run task" })
