vim.g.mapleader = " "
-- Preserve Octo's existing localleader (backslash) explicitly.
vim.g.maplocalleader = "\\"

if vim.fn.has("nvim-0.12") == 0 then
	error("This configuration requires Neovim 0.12+ (vim.pack).")
end

require("config.options").setup()
require("config.packages").setup()
require("plugins").setup()
require("config.keymaps").setup()
