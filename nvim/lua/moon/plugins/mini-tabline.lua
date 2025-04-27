return {
	"echasnovski/mini.tabline",
	event = "VeryLazy",
	opts = {
		options = {

			show_modify_state = true,
			show_icon = true,
			modified_icon = "+",
			close_icon = "x",
			tabpage_icon = "",
			max_name_length = 18,
			max_prefix_length = 15,
			tab_size = 18,
		},
		highlights = {
			fill = { guibg = "#1e1e2e" },
			tab_selected = { guibg = "#1e1e2e", gui = "bold" },
		},
	},
}
