local map = vim.keymap.set

map("n", "<leader>gh", "<esc>:ClangdSwitchSourceHeader<cr>", { desc = "Switch between .c/.h" })
