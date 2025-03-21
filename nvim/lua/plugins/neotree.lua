return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	cmd = { "Neotree" },
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	opts = {
		close_if_last_window = false,
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
				hide_by_name = {
					"node_modules",
				},
				never_show = {
					".DS_Store",
					"thumbs.db",
				},
				always_show = {
					".gitignore",
					".clang-format",
				},
			},
			group_empty_dirs = true,
		},
	},
}
