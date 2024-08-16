return {
  "nvim-neo-tree/neo-tree.nvim",
  config = function()
    local icons = require("plugins.user.icons")
    require("neo-tree").setup({
      close_if_last_window = true,
      popup_border_style = "rounded",
      default_component_configs = {
        icon = {
          folder_closed = icons.ui.Folder,
          folder_open = icons.ui.FolderOpen,
          folder_empty = icons.ui.EmptyFolder,
        },
        git_status = {
          symbols = {
            added = icons.git.LineAdded,
            modified = icons.git.LineModified,
            deleted = icons.git.LineRemoved,
            renamed = icons.git.File,
            untracked = icons.git.FileUntracked,
            ignored = icons.git.FileIgnored,
            unstaged = icons.git.FileUnStaged,
            staged = icons.git.FileStaged,
            conflict = icons.git.Branch,
          },
        },
      },
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
    })
  end,
}
