return function()
	local snacks = require("snacks")

	snacks.setup({
		picker = {
			enabled = true,
			hidden = true,
			layout = {
				layout = { width = 0.6, height = 0.7 },
			},
		},
		notifier = {
			enabled = false, -- nvim-notify handles notifications.
		},
		indent = {
			enabled = true,
		},
		words = {
			enabled = true,
		},
	})
end
