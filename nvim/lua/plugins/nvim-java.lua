return {
	"nvim-java/nvim-java",
	lazy = false,
	opts = {
		root_markers = {
			"settings.gradle",
			"settings.gradle.kts",
			"pom.xml",
			"build.gradle",
			"mvnw",
			"gradlew",
			"build.gradle",
			"build.gradle.kts",
			".git",
		},

		jdtls = {
			version = "v1.43.0",
		},

		lombok = {
			enable = true,
			version = "nightly",
		},

		-- load java test plugins
		java_test = {
			enable = true,
			version = "0.40.1",
		},

		-- load java debugger plugins
		java_debug_adapter = {
			enable = true,
			version = "0.58.1",
		},

		spring_boot_tools = {
			enable = false,
			version = "1.55.1",
		},

		notifications = {
			-- enable 'Configuring DAP' & 'DAP configured' messages on start up
			dap = false,
		},
	},
}
