vim.g.base46_cache = vim.fn.stdpath("data") .. "/base46_cache/"

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- (method 1, For heavy lazyloaders)
for _, v in ipairs(vim.fn.readdir(vim.g.base46_cache)) do
  dofile(vim.g.base46_cache .. v)
end

-- Add nvchad cmp
local options = {}
options = vim.tbl_deep_extend("force", options, require("nvchad.cmp"))
require("cmp").setup(options)
