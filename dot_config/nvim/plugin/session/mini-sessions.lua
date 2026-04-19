vim.pack.add({ "https://github.com/nvim-mini/mini.sessions" })

require("mini.sessions").setup({
	autoread = false,
	autowrite = true,
	file = "Session.vim",
	force = { read = false, write = true, delete = false },
})

vim.api.nvim_create_autocmd("PackChanged", {
	pattern = "nvim-mini/mini.sessions",
	callback = function(ev)
		vim.schedule(setup_sessions)
	end,
})

function setup_sessions()
	local ms = require("mini.sessions")

	if not ms.config then
		ms.setup({
			autoread = false,
			autowrite = true,
			file = "Session.vim",
			force = { read = false, write = true, delete = false },
		})
	end

	local function save_session(new_session)
		vim.cmd("Neotree close")

		if new_session or not pcall(ms.write) then
			local name = vim.fn.input({ prompt = "Session name: ", cancelreturn = "" })
			if name ~= "" then
				pcall(ms.write, name)
			end
		end
	end

	local function delete_session()
		local entries = {}
		local detected = ms.detected or {}

		for k, _ in pairs(detected) do
			entries[#entries + 1] = k
		end

		vim.ui.select(entries, { prompt = "Delete session:" }, function(choice)
			if choice then
				ms.delete(choice)
			end
		end)
	end

	vim.keymap.set("n", "<leader>qs", function()
		save_session(false)
	end, { desc = "Session: Save" })
	vim.keymap.set("n", "<leader>qS", function()
		save_session(true)
	end, { desc = "Session: Save New" })
	vim.keymap.set("n", "<leader>qp", ms.select, { desc = "Session: Select" })
	vim.keymap.set("n", "<leader>qd", delete_session, { desc = "Session: Delete" })
	vim.keymap.set("n", "<leader>qr", ms.restart, { desc = "Session: Restart" })
end

setup_sessions()
