return {
    "pappasam/papercolor-theme-slim",

    config = function()
        vim.cmd.colorscheme("PaperColorSlim")
        vim.cmd("set guicursor=n-v-sm:block-Cursor,i-ci-c-ve:ver25-Cursor,r-cr-o:hor20-Cursor")
        vim.cmd("set winborder=rounded")
        -- custom colors
        vim.cmd("hi DiagnosticError guifg=#d73f00") -- purple by default
        vim.cmd("hi DiagnosticWarn guifg=#df875f")  -- light yellow by default
    end
}
