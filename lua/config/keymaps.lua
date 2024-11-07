-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- General
map("i", "jk", "<ESC>", { desc = "Escape" })
map({ "n", "x" }, ";", ":", { desc = "Command mode" })
map({ "n", "x" }, "<A-h>", "^", { desc = "Go to begin of line" })
map({ "n", "x" }, "<A-l>", "$", { desc = "Go to end of line" })
map("i", "<A-h>", "<ESC>^i", { desc = "Go to begin of line" })
map("i", "<A-l>", "<ESC>$a", { desc = "Go to end of line" })
map({ "n", "i" }, "<C-d>", "<ESC>yyp", { desc = "Copy to new line" })
map({ "n", "i" }, "<C-z>", "<ESC>u", { desc = "Undo" })
map({ "n", "i" }, "<C-y>", "<ESC>dd", { desc = "Delete line" })

-- Copy and paste
map("n", "<C-S-v>", '"+p', { desc = "Paste from clipboard" })
map("i", "<C-S-v>", '<ESC>"+pa', { desc = "Paste from clipboard" })
map("v", "<C-S-c>", '"+y', { desc = "Copy to clipboard" })

-- Nvchad keymaps
map("n", "<leader>ut", function()
  require("nvchad.themes").open()
end, { desc = "Choose themes" })
map("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')
  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, { desc = "Open menu" })
