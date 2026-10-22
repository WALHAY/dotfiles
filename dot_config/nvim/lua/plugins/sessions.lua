local M = {}

function M.save(new_session)
	local sessions = require("mini.sessions")
	if not new_session and vim.v.this_session ~= "" then
		sessions.write()
		return
	end
	vim.ui.input({ prompt = "Session name: " }, function(name)
		if name and name ~= "" then
			sessions.write(name)
		end
	end)
end

function M.setup()
	require("mini.sessions").setup({
		autoread = true,
		autowrite = true,
		file = "Session.vim",
		force = { read = false, write = true, delete = false },
		hooks = {
			pre = {
				write = function()
					if vim.fn.exists(":Neotree") == 2 then
						vim.cmd("Neotree close")
					end
				end,
			},
		},
	})
end

return setmetatable(M, {
	__call = function()
		M.setup()
	end,
})
