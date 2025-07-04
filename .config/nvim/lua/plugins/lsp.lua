return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "saghen/blink.cmp",
    },

    config = function()
        -- mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- NOTE: since mason does not support subpackages, python-lsp-server
                -- is installed outside of mason (including mypy, ruff, jedi, ...
                -- https://github.com/Homebrew/homebrew-core/blob/HEAD/Formula/p/python-lsp-server.rb
                "gopls",
                "lua_ls",
                "bashls",
            }
        })
    end
}
