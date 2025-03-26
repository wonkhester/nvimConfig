return {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  config = function()
    local gitsigns = require("gitsigns")

    -- Define highlights explicitly (avoiding deprecated 'hl', 'numhl', 'linehl' settings)
    local highlights = {
      { "GitSignsAdd", "DiffAdd" },
      { "GitSignsChange", "DiffChange" },
      { "GitSignsDelete", "DiffDelete" },
      { "GitSignsAddNr", "DiffAdd" },
      { "GitSignsChangeNr", "DiffChange" },
      { "GitSignsDeleteNr", "DiffDelete" },
      { "GitSignsAddLn", "DiffAdd" },
      { "GitSignsChangeLn", "DiffChange" },
      { "GitSignsDeleteLn", "DiffDelete" },
      { "GitSignsUntracked", "DiffAdd" },
      { "GitSignsUntrackedNr", "DiffAdd" },
      { "GitSignsUntrackedLn", "DiffAdd" },
      { "GitSignsChangedelete", "DiffChange" },
      { "GitSignsChangedeleteNr", "DiffChange" },
      { "GitSignsChangedeleteLn", "DiffChange" },
      { "GitSignsTopdelete", "DiffDelete" },
      { "GitSignsTopdeleteNr", "DiffDelete" },
      { "GitSignsTopdeleteLn", "DiffDelete" },
    }

    for _, hl in ipairs(highlights) do
      vim.api.nvim_set_hl(0, hl[1], { link = hl[2] })
    end

    -- Setup Gitsigns
    gitsigns.setup({
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
    })
  end,
}

