return {
    "RRethy/vim-illuminate",
    config = function()
        local group = vim.api.nvim_create_augroup("Illuminate", {})
        vim.api.nvim_create_autocmd("VimEnter", {
            group = group,
            callback = function(_)
                vim.cmd("hi illuminatedWordText cterm=none gui=none")
            end
        })
    end,
}
