return function()
	require("kotlin").setup({
		jvm_args = {
			"-Xmx2g",
		},

		root_markers = {
			"build.gradle",
			"build.gradle.kts",
			"settings.gradle",
			"settings.gradle.kts",
			"pom.xml",
			"mvnw",
			".git",
		},

		inlay_hints = {
			enabled = true, -- Master switch: enable/disable all inlay hints

			-- Parameter hints (show parameter names in function calls)
			parameters = true, -- foo(name: "value", age: 42)
			parameters_compiled = true, -- Show parameter names for compiled code
			parameters_excluded = false, -- Show hints for excluded parameters (usually false)

			-- Type hints (show inferred types)
			types_property = true, -- val name: String = "foo"
			types_variable = true, -- val count: Int = 42
			function_return = true, -- fun foo(): String { }
			function_parameter = true, -- fun foo(name: String) { }

			-- Lambda hints
			lambda_return = true, -- { x -> x * 2 }: (Int) -> Int
			lambda_receivers_parameters = true, -- Show receivers and parameters

			-- Other hints
			value_ranges = true, -- Show hints for ranges
			kotlin_time = true, -- Show kotlin.time warnings
		},
	})
end
