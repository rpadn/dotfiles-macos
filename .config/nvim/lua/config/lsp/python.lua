vim.lsp.config("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                black = { enabled = false },
                autopep8 = { enabled = false },
                flake8 = { enabled = false },
                yapf = { enabled = false },
                pylint = { enabled = false },
                pyflakes = { enabled = false },
                pycodestyle = { enabled = false },
                --
                pylsp_mypy = {
                    enabled = true,
                    strict = true,
                    report_progress = true,
                },
                jedi = {
                    environment = ".venv/",
                },
                ruff = {
                    enabled = true,
                    formatEnabled = true,
                    format = { "I" },
                }
            }
        }
    }
})

vim.lsp.enable("pylsp")
