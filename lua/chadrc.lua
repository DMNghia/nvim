local M = {}

M.base46 = {
  theme = "onedark",
  integrations = { "dap", "trouble" },
}

M.ui = {
  -- cmp = {
  --   icons_left = true,
  --   lspkind_text = true,
  --   style = "flat_dark",
  -- },
  statusline = {
    theme = "default",
    separator_style = "round",
  },
  telescope = { style = "borderless" },
  nvdash = {
    load_on_startup = false,
  },
}

M.lsp = {
  signature = false,
}

return M
