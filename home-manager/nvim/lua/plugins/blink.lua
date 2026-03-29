return {
	"saghen/blink.cmp",
	opts = {
		keymap = {
			preset = "super-tab",
			["<Tab>"] = { "select_and_accept", "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "select_prev", "fallback" },
		},
		completion = {
			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},
		},
	},
}
