return {
	"lewis6991/gitsigns.nvim", -- GitHub stars 5 k 超、メンテ活発  [oai_citation:0‡GitHub](https://github.com/lewis6991/gitsigns.nvim?utm_source=chatgpt.com)
	event = "VeryLazy",
	opts = function()
		local gs = require("gitsigns")
		return {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
			current_line_blame = true,
			current_line_blame_opts = { delay = 300, virt_text_pos = "eol" },
			watch_gitdir = { interval = 1000, follow_files = true }, -- 自動リロード間隔(ms)
			on_attach = function(bufnr) -- キーマップは必要なものだけ
				local function map(mode, lhs, rhs, desc)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
				end
				map("n", "]c", gs.next_hunk, "Next hunk")
				map("n", "[c", gs.prev_hunk, "Prev hunk")
				map({ "n", "v" }, "<leader>hs", gs.stage_hunk, "Stage hunk")
				map({ "n", "v" }, "<leader>hr", gs.reset_hunk, "Reset hunk")
				map("n", "<leader>hp", gs.preview_hunk, "Preview hunk")
				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, "Blame line")
			end,
		}
	end,
}
