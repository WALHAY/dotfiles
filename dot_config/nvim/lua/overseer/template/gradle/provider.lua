local function create_gradle_task(name)
	return {
		name = "Gradle: " .. name,
		desc = "Gradle task: " .. name,
		builder = function()
			return {
				cmd = { "./gradlew", name },
				cwd = vim.fn.getcwd(),
				components = {
					{ "default", output = "wrap" },
					{ "on_output_quickfix" },
				},
				metadata = { priority = 100 },
			}
		end,
		tags = { "build", "gradle" },
	}
end

return {
	name = "Gradle Tasks",
	generator = function(search, cb)
		local gradlew = vim.fs.find("gradlew", { upward = true, type = "file", path = search.dir })[1]
		if not gradlew then
			cb({})
			return
		end

		local tasks = { "runClient", "bootRun", "spotlessApply", "ktfmtMain", "build", "test", "clean" }

		local templates = {}
		for _, name in ipairs(tasks) do
			table.insert(templates, create_gradle_task(name))
		end

		cb(templates)
	end,
	condition = {
		callback = function(search)
			local gradlew = vim.fs.find("gradlew", { upward = true, type = "file", path = search.dir })[1]
			return gradlew ~= nil, "No gradlew found"
		end,
	},
}
