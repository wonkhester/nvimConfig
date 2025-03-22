local map = vim.keymap.set

map("n", "<leader>pv", function() vim.cmd.Ex() end)
map("n", "<leader>u", function() vim.cmd.UndotreeToggle() end)

local builtin = require('telescope.builtin')

map('n', '<leader>pf', builtin.find_files, {})
map('n', '<C-p>', builtin.git_files, {})
map('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)


local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

map("n", "<leader>a", mark.add_file)
map("n", "<C-e>", ui.toggle_quick_menu)

map("n", "<C-h>", function() ui.nav_file(1) end)
map("n", "<C-t>", function() ui.nav_file(2) end)
map("n", "<C-n>", function() ui.nav_file(3) end)
map("n", "<C-s>", function() ui.nav_file(4) end)
