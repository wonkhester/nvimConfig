return {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {}, -- Harpoon doesn't use opts directly, so leave it empty
    config = function()
        local harpoon = require("harpoon")
        local mark = require("harpoon.mark")
        local ui = require("harpoon.ui")

        -- Set up Harpoon
        harpoon.setup()

        -- Keybindings
        vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add current file to Harpoon" })
        vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu, { desc = "Open Harpoon menu" })
        vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end, { desc = "Go to Harpoon file 1" })
        vim.keymap.set("n", "<C-t>", function() ui.nav_file(2) end, { desc = "Go to Harpoon file 2" })
        vim.keymap.set("n", "<C-n>", function() ui.nav_file(3) end, { desc = "Go to Harpoon file 3" })
        vim.keymap.set("n", "<C-s>", function() ui.nav_file(4) end, { desc = "Go to Harpoon file 4" })
    end,
}
