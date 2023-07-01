local status, icons = pcall(require, "nvim-web-devicons")
if not status then
	return
end

icons.setup({
	override = {
		["tsx"] = {
			icon = "",
			color = "#519aba",
			cterm_color = "74",
			name = "Tsx",
		},
	},
})
