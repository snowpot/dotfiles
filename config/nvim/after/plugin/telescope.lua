local status, builtin = pcall(require, "telescope.builtin")
if not status then
	return
end

vim.keymap.set("n", "ff", builtin.find_files, {})
vim.keymap.set("n", "fg", builtin.live_grep, {})
vim.keymap.set("n", "fb", builtin.buffers, {})
vim.keymap.set("n", "fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser", { noremap = true })

local status2, telescope = pcall(require, "telescope")
if not status2 then
	return
end

local actions = require("telescope.actions")

telescope.setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close,
			},
		},
	},
	pickers = {
		find_files = {
			theme = "dropdown",
			hidden = true,
			previewer = true,
		},
	},
	extensions = {
		file_browser = {
			theme = "dropdown",
			hijack_netrw = true,
			hidden = true,
		},
	},
})

require("telescope").load_extension("file_browser")
