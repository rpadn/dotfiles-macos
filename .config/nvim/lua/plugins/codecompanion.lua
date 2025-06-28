return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "j-hui/fidget.nvim", -- Display status
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "ravitemer/codecompanion-history.nvim",
        {
            "ravitemer/mcphub.nvim", -- Manage MCP servers
            cmd = "MCPHub",
            build = "npm install -g mcp-hub@latest",
            config = true,
        },
        {
            "MeanderingProgrammer/render-markdown.nvim", -- Make Markdown buffers look beautiful
            ft = { "markdown", "codecompanion" },
        },
    },
    opts = {
        extensions = {
            history = {
                enabled = true,
                opts = {
                    keymap = "gh",
                    save_chat_keymap = "sc",
                    auto_save = true,
                    auto_generate_title = true,
                    continue_last_chat = false,
                    delete_on_clearing_chat = false,
                    picker = "telescope",
                    enable_logging = false,
                    dir_to_save = vim.fn.stdpath("data") .. "/codecompanion-history",
                },
            },
            mcphub = {
                callback = "mcphub.extensions.codecompanion",
                opts = {
                    make_vars = true,
                    make_slash_commands = true,
                    show_result_in_chat = true,
                },
            },
        },
        strategies = {
            chat = {
                adapter = {
                    name = "copilot",
                    model = "claude-3.7-sonnet",
                },
                keymaps = {
                    completion = {
                        modes = {
                            i = "<C- >",
                        },
                    },
                },
                slash_commands = {
                    ["buffer"] = {
                        keymaps = {
                            modes = {
                                i = "<C-b>",
                            },
                        },
                    },
                },
            },
            inline = {
                adapter = {
                    name = "copilot",
                    model = "claude-3.7-sonnet",
                },
            },
        },
    },
    keys = {
        {
            "<leader>la",
            "<cmd>CodeCompanionActions<CR>",
            desc = "Open the action palette",
            mode = { "n", "v" },
        },
        {
            "<leader>lo",
            "<cmd>CodeCompanionChat Toggle<CR>",
            desc = "Toggle a chat buffer",
            mode = { "n", "v" },
        },
        {
            "<leader>lA",
            "<cmd>CodeCompanionChat Add<CR>",
            desc = "Add code to a chat buffer",
            mode = { "v" },
        },
        {
            "<leader>li",
            ":CodeCompanion ",
            desc = "Inline chat",
            mode = { "n", "v" },
        },
    },
    config = function(_, opts)
        require("codecompanion").setup(opts)

        -- fidget integration
        local progress = require("fidget.progress")
        local handles = {}
        local group = vim.api.nvim_create_augroup("CodeCompanionFidget", {})

        vim.api.nvim_create_autocmd("User", {
            pattern = "CodeCompanionRequestStarted",
            group = group,
            callback = function(e)
                handles[e.data.id] = progress.handle.create({
                    title = "CodeCompanion",
                    message = "Thinking...",
                    lsp_client = { name = e.data.adapter.formatted_name },

                })
            end,
        })

        vim.api.nvim_create_autocmd("User", {
            pattern = "CodeCompanionRequestFinished",
            group = group,
            callback = function(e)
                local h = handles[e.data.id]
                if h then
                    h.message = e.data.status == "success" and "Done" or "Failed"
                    h:finish()
                    handles[e.data.id] = nil
                end
            end,
        })
    end,
}
