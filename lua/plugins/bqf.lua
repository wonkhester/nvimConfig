return {
    'kevinhwang91/nvim-bqf',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        preview = {
            win_height = 12,    -- Height of the preview window
            win_vheight = 12,   -- Height in vertical splits
            delay_syntax = 80,  -- Delay for syntax highlighting
        },
        auto_enable = true,
    },
    config = function()
        vim.api.nvim_set_keymap('n', '<Leader>q', ':lua if vim.fn.getqflist({winid = 0}).winid == 0 then vim.cmd("copen") else vim.cmd("cclose") end<CR>', { noremap = true, silent = true })
    end,
}
