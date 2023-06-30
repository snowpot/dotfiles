local status, nvim_tree = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

nvim_tree.setup({
	ensure_installed = { "tsx", "lua", "html", "css", "json", "yaml", "markdown", "markdown_inline" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
	},
	additional_vim_regex_highlighting = false,
	autotag = {
		enable = true,
	},
})
