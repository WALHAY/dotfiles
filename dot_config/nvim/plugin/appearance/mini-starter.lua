vim.pack.add({ "https://github.com/nvim-mini/mini.starter" })

function setup()
	local starter = require("mini.starter")

	starter.setup({
		evaluate_single = true,

		items = nil,

		header = "	   ::::    ::::::::::::::::::::: :::     ::::::::::::::  :::   ::: \n"
			.. "     :+:+:   :+::+:      :+:    :+::+:     :+:    :+:     :+:+: :+:+: \n"
			.. "    :+:+:+  +:++:+      +:+    +:++:+     +:+    +:+    +:+ +:+:+ +:+ \n"
			.. "   +#+ +:+ +#++#++:++# +#+    +:++#+     +:+    +#+    +#+  +:+  +#+  \n"
			.. "  +#+  +#+#+#+#+      +#+    +#+ +#+   +#+     +#+    +#+       +#+   \n"
			.. " #+#   #+#+##+#      #+#    #+#  #+#+#+#      #+#    #+#       #+#    \n"
			.. "###    ######################     ###    ##############       ###     \n",

		footer = "",

		query_updaters = "abcdefghijklmnopqrstuvwxyz0123456789_-.",

		silent = true,
	})
end

setup()
