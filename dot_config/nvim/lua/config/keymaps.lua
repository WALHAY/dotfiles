local M = {}

function M.delete_all_buffers()
	local current = vim.api.nvim_get_current_buf()
	local skipped = {}
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if buf ~= current and vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buflisted then
			local ok = not vim.bo[buf].modified and pcall(vim.api.nvim_buf_delete, buf, { force = false })
			if not ok then
				skipped[#skipped + 1] = vim.api.nvim_buf_get_name(buf)
			end
		end
	end
	if #skipped > 0 then
		vim.notify("Kept modified or busy buffers:\n" .. table.concat(skipped, "\n"), vim.log.levels.WARN)
	end
end

local function command(name)
	return "<cmd>" .. name .. "<CR>"
end
local function picker(name)
	return function()
		require("snacks").picker[name]()
	end
end

local function screen_line(direction)
	return function()
		return vim.v.count == 0 and "g" .. direction or direction
	end
end

local function hunk(direction, motion)
	return function()
		if vim.wo.diff then
			vim.cmd.normal({ vim.v.count1 .. motion, bang = true })
		else
			require("gitsigns").nav_hunk(direction)
		end
	end
end

local function error_jump(direction)
	return function()
		vim.diagnostic.jump({ count = direction * vim.v.count1, severity = vim.diagnostic.severity.ERROR })
	end
end

-- Personal mappings are a single source for setup and the generated Markdown table.
M.bindings = {
	{
		"n",
		"<leader>bD",
		M.delete_all_buffers,
		"Delete other buffers",
		"Буферы",
		"Закрыть остальные буферы, сохранив текущий и несохранённые",
	},
	{
		"n",
		"<C-d>",
		"<C-d>zz",
		"Scroll down and center",
		"Навигация",
		"Полэкрана вниз и центрирование курсора",
	},
	{
		"n",
		"<C-u>",
		"<C-u>zz",
		"Scroll up and center",
		"Навигация",
		"Полэкрана вверх и центрирование курсора",
	},
	{
		{ "n", "x" },
		"j",
		screen_line("j"),
		"Move down by screen line",
		"Навигация",
		"Вниз по экранной строке; с числом — по строкам файла",
		{ expr = true },
	},
	{
		{ "n", "x" },
		"k",
		screen_line("k"),
		"Move up by screen line",
		"Навигация",
		"Вверх по экранной строке; с числом — по строкам файла",
		{ expr = true },
	},
	{ "n", "n", "nzzzv", "Next search match and center", "Навигация", "Повторить поиск, центрировать и раскрыть складку" },
	{
		"n",
		"N",
		"Nzzzv",
		"Previous search match and center",
		"Навигация",
		"Повторить поиск в обратную сторону, центрировать и раскрыть складку",
	},
	{ "n", "<C-h>", "<C-w>h", "Focus left window", "Окна", "Перейти в окно слева" },
	{ "n", "<C-j>", "<C-w>j", "Focus lower window", "Окна", "Перейти в окно снизу" },
	{ "n", "<C-k>", "<C-w>k", "Focus upper window", "Окна", "Перейти в окно сверху" },
	{ "n", "<C-l>", "<C-w>l", "Focus right window", "Окна", "Перейти в окно справа" },
	{ "t", "<C-h>", "<C-\\><C-n><C-w>h", "Focus left window from terminal", "Окна", "Из терминала перейти в окно слева" },
	{ "t", "<C-j>", "<C-\\><C-n><C-w>j", "Focus lower window from terminal", "Окна", "Из терминала перейти в окно снизу" },
	{
		"t",
		"<C-k>",
		"<C-\\><C-n><C-w>k",
		"Focus upper window from terminal",
		"Окна",
		"Из терминала перейти в окно сверху",
	},
	{
		"t",
		"<C-l>",
		"<C-\\><C-n><C-w>l",
		"Focus right window from terminal",
		"Окна",
		"Из терминала перейти в окно справа",
	},
	{
		"n",
		"[c",
		hunk("prev", "[c"),
		"Previous Git hunk",
		"Git",
		"Предыдущий блок изменений; в diff — предыдущая разница",
	},
	{ "n", "]c", hunk("next", "]c"), "Next Git hunk", "Git", "Следующий блок изменений; в diff — следующая разница" },
	{ "n", "[e", error_jump(-1), "Previous error", "Диагностика", "Предыдущая ошибка, пропуская предупреждения" },
	{ "n", "]e", error_jump(1), "Next error", "Диагностика", "Следующая ошибка, пропуская предупреждения" },
	{
		"n",
		"<leader>pc",
		function()
			require("config.packages").clean()
		end,
		"Clean unused plugins",
		"Плагины",
		"Показать и удалить неактивные плагины после подтверждения",
	},
	{
		"n",
		"<leader>fk",
		picker("keymaps"),
		"Find keymaps",
		"Поиск",
		"Найти действующие сочетания клавиш",
	},
	{ "n", "<C-p>", picker("files"), "Find files", "Поиск", "Найти файл" },
	{
		"n",
		"<leader>fg",
		picker("grep"),
		"Live grep",
		"Поиск",
		"Поиск текста по проекту через ripgrep",
	},
	{
		"n",
		"<leader>fb",
		picker("buffers"),
		"Find buffers",
		"Поиск",
		"Выбрать открытый буфер",
	},
	{ "n", "<leader>fj", picker("jumplist"), "Find jumps", "Поиск", "История переходов" },
	{ "n", "<leader>fr", picker("recent"), "Find recent files", "Поиск", "Недавно открытые файлы" },
	{ "n", "<leader>fm", picker("marks"), "Find marks", "Поиск", "Найти метку и перейти к ней" },
	{
		"n",
		"<leader>fR",
		picker("resume"),
		"Resume last picker",
		"Поиск",
		"Продолжить последний поиск с прежним запросом",
	},
	{
		"n",
		"<leader>fs",
		picker("lsp_workspace_symbols"),
		"Find workspace symbols",
		"Поиск",
		"Найти символ в проекте через LSP",
	},
	{ "n", "<leader>fq", picker("qflist"), "Find quickfix", "Поиск", "Список quickfix" },
	{
		"n",
		"<leader>fd",
		picker("diagnostics_buffer"),
		"Buffer diagnostics",
		"Поиск",
		"Диагностика текущего буфера",
	},
	{
		"n",
		"<leader>e",
		command("Neotree toggle"),
		"Toggle file tree",
		"Файлы",
		"Открыть или закрыть Neo-tree",
	},
	{
		"n",
		"<leader>-",
		function()
			require("oil").open()
		end,
		"Open parent directory",
		"Файлы",
		"Открыть папку текущего файла в Oil",
	},
	{
		{ "n", "x", "o" },
		"s",
		function()
			require("flash").jump()
		end,
		"Flash jump",
		"Навигация",
		"Переход к метке Flash",
	},
	{
		{ "n", "x", "o" },
		"S",
		function()
			require("flash").treesitter()
		end,
		"Flash Treesitter",
		"Навигация",
		"Выбрать узел синтаксического дерева",
	},
	{
		{ "n", "x" },
		"<leader>bf",
		function()
			require("conform").format({ async = true })
		end,
		"Format buffer or selection",
		"Буферы",
		"Форматировать буфер или выделение",
	},
	{ "n", "gd", vim.lsp.buf.definition, "Go to definition", "LSP", "Перейти к определению через LSP" },
	{ "n", "gD", vim.lsp.buf.declaration, "Go to declaration", "LSP", "Перейти к объявлению через LSP" },
	{
		"n",
		"grh",
		function()
			local buf = vim.api.nvim_get_current_buf()
			vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
		end,
		"Toggle inlay hints",
		"LSP",
		"Включить или выключить inlay hints текущего буфера",
	},
	{
		"n",
		"<leader>xx",
		command("Trouble diagnostics toggle"),
		"Toggle diagnostics",
		"Диагностика",
		"Показать диагностику проекта в Trouble",
	},
	{
		"n",
		"<leader>xq",
		command("Trouble qflist toggle"),
		"Toggle quickfix",
		"Диагностика",
		"Показать quickfix в Trouble",
	},
	{ "n", "<leader>oi", command("Octo issue list"), "List GitHub issues", "GitHub", "Список issues" },
	{ "n", "<leader>op", command("Octo pr list"), "List GitHub pull requests", "GitHub", "Список pull requests" },
	{
		"n",
		"<leader>od",
		command("Octo discussion list"),
		"List GitHub discussions",
		"GitHub",
		"Список обсуждений",
	},
	{
		"n",
		"<leader>on",
		command("Octo notification list"),
		"List GitHub notifications",
		"GitHub",
		"Список уведомлений",
	},
	{
		"n",
		"<leader>os",
		function()
			require("octo.utils").create_base_search_command({ include_current_repo = true })
		end,
		"Search GitHub",
		"GitHub",
		"Поиск по GitHub с текущим репозиторием",
	},
	{
		{ "n", "x", "o" },
		"<leader>rr",
		command("OverseerToggle"),
		"Toggle task list",
		"Запуск",
		"Открыть или закрыть список задач Overseer",
	},
	{
		{ "n", "x", "o" },
		"<leader>rj",
		command("OverseerRun"),
		"Run task",
		"Запуск",
		"Выбрать и запустить задачу Overseer",
	},
	{
		{ "n", "x", "o" },
		"<leader>ra",
		command("OverseerTaskAction"),
		"Task action",
		"Запуск",
		"Выбрать действие над задачей Overseer",
	},
	{
		"n",
		"<leader>Gg",
		command("Gradle"),
		"Gradle projects",
		"Gradle",
		"Открыть Gradle-проекты и задачи",
	},
	{
		"n",
		"<leader>Gf",
		command("GradleFavorites"),
		"Gradle favorites",
		"Gradle",
		"Избранные задачи Gradle",
	},
	{
		"n",
		"<leader>qs",
		function()
			require("plugins.sessions").save(false)
		end,
		"Save session",
		"Сессии",
		"Сохранить активную сессию; без активной — запросить имя",
	},
	{
		"n",
		"<leader>qS",
		function()
			require("plugins.sessions").save(true)
		end,
		"Save new session",
		"Сессии",
		"Сохранить сессию под новым именем",
	},
	{
		"n",
		"<leader>ql",
		function()
			require("mini.sessions").read()
		end,
		"Load latest session",
		"Сессии",
		"Прочитать локальную или последнюю сессию",
	},
	{
		"n",
		"<leader>qp",
		function()
			require("mini.sessions").select()
		end,
		"Pick session",
		"Сессии",
		"Выбрать сессию для загрузки",
	},
	{
		"n",
		"<leader>qd",
		function()
			require("mini.sessions").select("delete")
		end,
		"Delete session",
		"Сессии",
		"Выбрать сессию для удаления",
	},
	{
		"n",
		"<leader>qr",
		function()
			require("mini.sessions").restart()
		end,
		"Restart with session",
		"Сессии",
		"Перезапустить Neovim с текущей сессией",
	},
}

function M.setup()
	for _, binding in ipairs(M.bindings) do
		local opts = vim.tbl_extend("force", { desc = binding[4], silent = true }, binding[7] or {})
		vim.keymap.set(binding[1], binding[2], binding[3], opts)
	end
end

return M
