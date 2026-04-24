vim.pack.add({ { src = "https://github.com/rcarriga/nvim-notify", name = "notify" } })

local notify = require("notify")

notify.setup({ render = "wrapped-compact", fps = 120 })

vim.notify = notify
