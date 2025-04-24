return {
	cmd = {
		"clangd",
		"--background-index", -- Index in the background
		"--clang-tidy", -- Enable clang-tidy diagnostics
		"--header-insertion=never", -- Disable auto-inserting headers
		"--completion-style=detailed",
		"--cross-file-rename", -- Better cross-file refactoring
		"--pch-storage=memory", -- Speeds up parsing
	},
	settings = {},
	filetypes = {
		"c",
		"h",
		"cpp",
		"hpp",
	},
	root_markers = {
		".git",
		"compile_commands.json",
		"CMakeLists.txt",
	},
}
