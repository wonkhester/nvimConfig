return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")

        -- Set up Telescope
        telescope.setup()

        -- Keybindings
        vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Search for file" })
        vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Search for git files" })
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "Search for file content" })
    end,
}
