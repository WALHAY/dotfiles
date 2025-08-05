return {
	"toppair/peek.nvim",
	lazy = false,
	event = { "VeryLazy" },
	build = "deno task --quiet build:fast",
	ft = "markdown",
	config = function()
		require("peek").setup()
		vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
		vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
	end,
}
