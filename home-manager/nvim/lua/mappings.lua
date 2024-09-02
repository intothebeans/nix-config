require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("i", "<M-f>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

map("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "next todo" })

map("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "prev todo" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-h>", "<cmd> TmuxNavigateLeft <cr>", { desc = "window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight <cr>", { desc = "window right" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp <cr>", { desc = "window up" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown <cr>", { desc = "window down" })
