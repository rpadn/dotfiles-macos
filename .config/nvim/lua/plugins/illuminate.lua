return {
    "RRethy/vim-illuminate",
    config = function()
        local group = vim.api.nvim_create_augroup("Illuminate", {})
        vim.api.nvim_create_autocmd("VimEnter", {
            group = group,
            callback = function(_)
                vim.cmd("hi illuminatedWordRead guibg=#005f87 guifg=#bcbcbc")
                vim.cmd("hi illuminatedWordText guibg=#005f87 guifg=#bcbcbc")
                vim.cmd("hi illuminatedWordWrite guibg=#005f87 guifg=#bcbcbc")
            end
        })
    end,
}
