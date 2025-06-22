return {
    "vim-test/vim-test",
    config = function()
        vim.g["test#strategy"] = "neovim"
        vim.g["test#neovim#start_normal"] = 1  -- do not close with any key press by default
        vim.g["test#python#runner"] = "pytest"
        vim.keymap.set("n", "<leader>tn", ":TestNearest<CR>")
        vim.keymap.set("n", "<leader>tf", ":TestFile<CR>")
        vim.keymap.set("n", "<leader>ts", ":TestSuite<CR>")
        vim.keymap.set("n", "<leader>tl", ":TestLast<CR>")
        vim.keymap.set("n", "<leader>tv", ":TestVisit<CR>")
    end
}
