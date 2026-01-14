return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	opts = {
		indent = {
			enabled = true,
			char = "│",
			hl = {
				"SnacksIndent1",
				"SnacksIndent2",
			},
			scope = {
				enabled = true, -- enable highlighting the current scope
				priority = 200,
				char = "│",
				underline = false, -- underline the start of the scope
				only_current = false, -- only show scope in the current window
				hl = "SnacksIndentScope", ---@type string|string[] hl group for scopes
			},
			chunk = {
				enabled = true,
				char = {
					corner_top = "╭",
					corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow = ">",
				},
				hl = "SnacksIndentChunk",
			},
		},
		picker = {
			enabled = true,
			hidden = true,
			ignored = true,
			exclude = {
				"node_modules",
			},
			sources = {
				files = {
					hidden = true,
					ignored = true,
				},
			},
		},
	},
	keys = {
		{
			"ff",
			function()
				require("snacks").picker.files()
			end,
			desc = "Find files",
		},
		{
			"fb",
			function()
				require("snacks").picker.buffers()
			end,
			desc = "Find files",
		},
		{
			"fg",
			function()
				require("snacks").picker.grep()
			end,
		},
		{
			"fe",
			function()
				require("snacks").picker.diagnostics({ severity = vim.diagnostic.severity.ERROR })
			end,
			desc = "Find errors in project",
		},
	},
}
