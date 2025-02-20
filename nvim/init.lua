require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"

vim.g.neovide_no_idle = true
vim.g.neovide_refresh_rate = 144

require("config.options").config()
require("config.keymaps").config()
