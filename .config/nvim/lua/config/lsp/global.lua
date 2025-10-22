vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("i", "<C-Space>", "<C-x><C-o>", opts)
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function()
            vim.cmd.vsplit()
            vim.lsp.buf.definition()
        end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        -- vim.keymap.set("n", "<leader>ac", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>fr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "<leader>fm", function() vim.lsp.buf.format() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

        -- diagnostic
        vim.keymap.set("n", "<leader>da", function()
            vim.diagnostic.setqflist()
        end, opts)
        vim.keymap.set("n", "]n", function()
            vim.diagnostic.goto_next()
        end, opts)
        vim.keymap.set("n", "[n", function()
            vim.diagnostic.goto_prev()
        end, opts)

        -- format on save
        -- vim.api.nvim_create_autocmd("BufWritePre", {
        --     callback = function()
        --         vim.lsp.buf.format({ async = true })
        --     end,
        -- })
    end,
})

vim.diagnostic.config({
    severity_sort = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    }
})

-- vim.lsp.set_log_level 'debug'
