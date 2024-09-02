-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme_toggle = { "everforest", "one_light" },
	theme = "everforest",
	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
	statusline = {
		theme = "vscode_colored",
	},
}

return M
