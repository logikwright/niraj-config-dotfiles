vim.lsp.config("cssls", {
    cmd = { "vscode-css-language-server", "--stdio"},

    filetypes = {
        "css",
    },
})

vim.lsp.enable("cssls")
