# init before to be available for plugins
require("config.colors").config()
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.clipboard = "unnamedplus"

vim.g.neovide_no_idle = true
vim.g.neovide_refresh_rate = 144
-- vim.g.neovide_fullscreen = true
vim.g.neovide_floating_corner_radius = 0.5
vim.g.neovide_scroll_animation_far_lines = 1
vim.g.inlay_hints_enabled_by_default = true

require("config.options").config()
require("config.keymaps").config()
