return {
    "tpope/vim-fugitive",
    dependencies = {
        "tpope/vim-rhubarb", -- github integration for gbrowse
        "rbong/vim-flog",
        "airblade/vim-gitgutter",
    },

    config = function()
        -- fugitive
        vim.keymap.set("n", "<leader>gs", ":Git <CR>")
        vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
        vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
        vim.keymap.set("n", "<leader>gL", ":Git pull --rebase<CR>")
        vim.keymap.set("n", "<leader>gl", ":Git log --pretty=format='%h %s <%an>'<CR>")

        -- flog
        vim.keymap.set("n", "<leader>gf", ":Flogsplit<CR>")
    end
}
