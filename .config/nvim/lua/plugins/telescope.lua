return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtin = require('telescope.builtin')
        -- navigation
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
        vim.keymap.set('n', '<leader>fj', builtin.jumplist, {})
        -- misc
        vim.keymap.set('n', '<leader>f/', builtin.command_history, {})
        vim.keymap.set('n', '<leader>fq', builtin.quickfixhistory, {})
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
        -- search
        vim.keymap.set('n', '<leader>ss', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>sS', builtin.grep_string, {})
        vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, {})
        -- lsp
        vim.keymap.set('n', '<leader>so', builtin.lsp_document_symbols, {})
    end
}
