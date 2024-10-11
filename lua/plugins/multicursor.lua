return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")

    mc.setup({
      -- set to true if you want multicursor undo history
      -- to clear when clearing cursors
      shallowUndo = false,

      -- set to empty table to disable signs
      signs = { " ┆", " │", " ┃" },
    })

    -- Add cursors above/below the main cursor.
    vim.keymap.set({ "n", "v" }, "<A-S-up>", function()
      mc.addCursor("k")
    end)
    vim.keymap.set({ "n", "v" }, "<A-S-down>", function()
      mc.addCursor("j")
    end)

    -- Add a cursor and jump to the next word under cursor.
    vim.keymap.set({ "n", "v" }, "<A-S-n>", function()
      mc.addCursor("*")
    end)

    -- Jump to the next word under cursor but do not add a cursor.
    vim.keymap.set({ "n", "v" }, "<A-S-s>", function()
      mc.skipCursor("*")
    end)

    -- Rotate the main cursor.
    vim.keymap.set({ "n", "v" }, "<A-S-left>", mc.nextCursor)
    vim.keymap.set({ "n", "v" }, "<A-S-right>", mc.prevCursor)

    -- Delete the main cursor.
    vim.keymap.set({ "n", "v" }, "<A-S-x>", mc.deleteCursor)

    -- Add and remove cursors with control + left click.
    vim.keymap.set("n", "<A-leftmouse>", mc.handleMouse)

    vim.keymap.set({ "n", "v" }, "<A-S-q>", function()
      if mc.cursorsEnabled() then
        -- Stop other cursors from moving.
        -- This allows you to reposition the main cursor.
        mc.disableCursors()
      else
        mc.addCursor()
      end
    end)

    vim.keymap.set({ "n", "v" }, "<A-S-q>", function()
      -- clone every cursor and disable the originals
      mc.duplicateCursors()
    end)

    vim.keymap.set("n", "<A-S-c>", function()
      mc.clearCursors()
    end)

    -- Align cursor columns.
    vim.keymap.set("n", "<A-S-a>", mc.alignCursors)

    -- Split visual selections by regex.
    vim.keymap.set("v", "S", mc.splitCursors)

    -- Append/insert for each line of visual selections.
    vim.keymap.set("v", "I", mc.insertVisual)
    vim.keymap.set("v", "A", mc.appendVisual)

    -- match new cursors within visual selections by regex.
    vim.keymap.set("v", "M", mc.matchCursors)

    -- Rotate visual selection contents.
    vim.keymap.set("v", "<A-S-t>", function()
      mc.transposeCursors(1)
    end)
    vim.keymap.set("v", "<A-S-T>", function()
      mc.transposeCursors(-1)
    end)

    -- Customize how cursors look.
    vim.api.nvim_set_hl(0, "MultiCursorCursor", { link = "Cursor" })
    vim.api.nvim_set_hl(0, "MultiCursorVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorSign", { link = "SignColumn" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledCursor", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
    vim.api.nvim_set_hl(0, "MultiCursorDisabledSign", { link = "SignColumn" })
  end,
}
