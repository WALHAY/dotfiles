return function()
	local starter = require("mini.starter")

	starter.setup({
		evaluate_single = false,

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
