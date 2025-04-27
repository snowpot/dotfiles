return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot", -- 遅延読み込み
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
				keymap = {
					accept = "<C-c>",
					next = "<C-n>",
					prev = "<C-p>",
					dismiss = "<C-h>",
				},
			},
			panel = { enabled = false },
		})
	end,
}
