local status, telescope = pcall(require, "telescope")
if (not status) then return end

local actions = require("telescope.actions")

telescope.setup {
  defaults = {
    mappings = {
      n = { ["q"] = actions.close },
    },
  },
}
