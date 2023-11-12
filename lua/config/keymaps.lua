-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local Util = require("lazyvim.util")
local map = Util.safe_keymap_set

-- Move to window using the <ctrl> hjkl keys
map("n", "<A-h>", "^", { desc = "Go to end of line", remap = true })
map("n", "<A-l>", "$", { desc = "Go to first of line", remap = true })

-- Add escape
map("i", "jk", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
