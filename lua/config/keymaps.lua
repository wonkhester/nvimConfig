local map = vim.keymap.set

map("n", "<leader>pv", function() vim.cmd.Ex() end)
map("n", "<leader>u", function() vim.cmd.UndotreeToggle() end)
map("n", "<leader>gs", function() vim.cmd.Git() end)

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '>-2<CR>gv=gv")

map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("x", "<leader>p", "\"_dP")

map("n", "<leader>y", "\"+y")
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+Y")

map("n", "<leader>d", "\"_d")
map("v", "<leader>d", "\"_d")

map("n", "Q", "<nop>")
map("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
map("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })


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
