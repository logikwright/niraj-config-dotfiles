vim.lsp.config("html", {
    cmd = {"vscode-html-language-server","--stdio"},

    filetypes = {
        "html",
    },

})

vim.lsp.enable("html")
