vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },

    filetypes = {
        "python",
    },

    root_markers = {
        "pyproject.toml",
        "ruff.toml",
        ".ruff.total",
        ".git",
    },
})

vim.lsp.enable("ruff")
