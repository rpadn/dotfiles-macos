return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        local custom_papercolor = require("lualine.themes.PaperColor")
        local colors = {
            red       = '#df0000',
            green     = '#008700',
            blue      = '#00afaf',
            pink      = '#afdf00',
            olive     = '#dfaf5f',
            navy      = '#df875f',
            orange    = '#d75f00',
            purple    = '#8959a8',
            aqua      = '#3e999f',
            black     = '#000000',
            grey_1    = '#444444',
            grey_2    = '#2f2f2f',
            white_1   = '#d0d0d0',
            white_2   = '#c6c6c6',
            aqua_dark = '#5f8787',
        }
        -- lualine sections
        -- +-------------------------------------------------+
        -- | A | B | C                             X | Y | Z |
        -- +-------------------------------------------------+
        custom_papercolor.normal.a.bg = colors.pink
        custom_papercolor.normal.a.fg = colors.black

        custom_papercolor.normal.b.bg = colors.grey_1
        custom_papercolor.normal.b.fg = colors.white_2

        custom_papercolor.normal.c.bg = colors.grey_2
        custom_papercolor.normal.c.fg = colors.white_1

        custom_papercolor.replace.a.bg = colors.orange

        require("lualine").setup({
            options = {
                theme = custom_papercolor,
            },
            sections = {
                -- remove git branch & diff status
                lualine_b = { "diagnostics" },
                -- show relative
                lualine_c = { { "filename", path = 1 } },
            },
        })
    end
}
