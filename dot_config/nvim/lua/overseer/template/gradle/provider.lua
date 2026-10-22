local tasks = {
	{ "runClient" },
	{ "bootRun" },
	{ "spotlessApply" },
	{ "ktfmtMain" },
	{ "build" },
	{ "test" },
	{ "clean" },
	{ "build", "--continuous" },
}

return {
	name = "Gradle Tasks",
	generator = function(search, callback)
		local gradlew = vim.fs.find("gradlew", { upward = true, type = "file", path = search.dir })[1]
		if not gradlew then
			callback({})
			return
		end
		local root = vim.fs.dirname(gradlew)
		local templates = {}
		for _, arguments in ipairs(tasks) do
			local args = vim.deepcopy(arguments)
			local name = table.concat(args, " ")
			templates[#templates + 1] = {
				name = "Gradle: " .. name,
				desc = "Gradle task: " .. name,
				tags = { "build", "gradle" },
				builder = function()
					return {
						cmd = gradlew,
						args = vim.deepcopy(args),
						cwd = root,
						components = {
							"default",
							"on_result_diagnostics",
							{ "on_result_diagnostics_quickfix", open = true },
						},
						metadata = { priority = 100 },
					}
				end,
			}
		end
		callback(templates)
	end,
}
