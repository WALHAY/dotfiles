vim.pack.add({
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
})

require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		width = 32,
		mappings = {
			["a"] = {
				"add",
				config = {
					show_path = "relative", -- "none", "relative", "absolute"
				},
			},
			["c"] = {
				"copy",
				config = {
					show_path = "relative", -- "none", "relative", "absolute"
				},
			},
			["m"] = {
				"move",
				config = {
					show_path = "relative", -- "none", "relative", "absolute"
				},
			},
			["r"] = {
				"rename",
				config = {
					show_path = "relative", -- "none", "relative", "absolute"
				},
			},
			["Z"] = "expand_all_subnodes",
		},
	},
	default_component_configs = {
		indent = {
			indent_size = 1,
			padding = 0,
		},
	},
	buffers = {
		follow_current_file = {
			enabled = true,
		},
		group_empty_dirs = true,
	},
	filesystem = {
		follow_current_file = {
			enabled = true,
		},
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
			never_show = {
				".DS_Store",
				"thumbs.db",
			},
			always_show = {
				".git",
				".gitignore",
				".clang-format",
			},
		},
		group_empty_dirs = true,
	},
	lazy = true
})
