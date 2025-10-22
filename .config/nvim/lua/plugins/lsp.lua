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
        -- copilot / sidekick inline completion
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if client and client:supports_method("textDocument/inlineCompletion") then
                    vim.lsp.inline_completion.enable(true)
                end
            end,
        })
    end
}
