local map = vim.keymap.set

map({ "i", "n" }, "<leader>gh", "<esc>:ClangdSwitchSourceHeader<cr>", { desc = "Switch between src and header" })
