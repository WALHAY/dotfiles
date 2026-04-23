local M = {}

function M.delete_all_buffers()
	local current = vim.api.nvim_get_current_buf()
	local bufs = vim.api.nvim_list_bufs()

	for _, buf in ipairs(bufs) do
		if buf ~= current and not vim.api.nvim_buf_is_loaded(buf) then
			pcall(vim.api.nvim_buf_delete, buf, { })
		end
	end
end

M.setup = function()
	vim.keymap.set("n", "<leader>bD", M.delete_all_buffers, { desc = "Delete all buffers" })
end

return M
