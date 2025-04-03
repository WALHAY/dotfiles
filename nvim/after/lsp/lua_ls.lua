return {
	cmd = { "lua-language-server" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
		},
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".luacheckrc",
		".stylua.toml",
		"lazy-lock.json",
		"stylua.toml",
		"selene.toml",
		"selene.yml",
		".git",
	},
}
