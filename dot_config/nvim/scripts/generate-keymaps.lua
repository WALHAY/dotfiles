-- Run from any directory: nvim --clean --headless -l /path/to/nvim/scripts/generate-keymaps.lua
local root = vim.fs.dirname(vim.fs.dirname(debug.getinfo(1, "S").source:sub(2)))
root = vim.fn.fnamemodify(root, ":p"):gsub("/$", "")
vim.opt.runtimepath:prepend(root)

local path = root .. "/KEYMAPS.md"
local lines = vim.fn.readfile(path)
local first, last
for i, line in ipairs(lines) do
	if line == "<!-- personal-keymaps:start -->" then
		first = i
	end
	if line == "<!-- personal-keymaps:end -->" then
		last = i
	end
end
assert(first and last and first < last, "Missing personal-keymaps markers in KEYMAPS.md")

local groups, order = {}, {}
for _, binding in ipairs(require("config.keymaps").bindings) do
	local group = binding[5]
	if not groups[group] then
		groups[group] = {}
		order[#order + 1] = group
	end
	local modes = type(binding[1]) == "table" and table.concat(binding[1], ", ") or binding[1]
	local key = binding[2]:gsub("<leader>", "<Space>")
	groups[group][#groups[group] + 1] = ("| `%s` | `%s` | %s |"):format(key, modes, binding[6])
end

local generated = {}
for _, group in ipairs(order) do
	vim.list_extend(
		generated,
		{ "", "## " .. group, "", "| Клавиши | Режим | Действие |", "| --- | --- | --- |" }
	)
	vim.list_extend(generated, groups[group])
end
generated[#generated + 1] = ""

local output = vim.list_slice(lines, 1, first)
vim.list_extend(output, generated)
vim.list_extend(output, vim.list_slice(lines, last, #lines))
vim.fn.writefile(output, path)
print(("Updated %s (%d personal bindings)"):format(path, #require("config.keymaps").bindings))
