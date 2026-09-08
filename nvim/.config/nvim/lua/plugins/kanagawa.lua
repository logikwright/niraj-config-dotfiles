return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        print("Kanagawa config is running")
        require('kanagawa').setup({
            undercurl = true,
            commentStyle = {
                italic = true,
            },
            functionStyle = {},
            keywordStyle = {
                italic = false,
            },
            statementStyle = {
                bold = true,
            },
            transparent = true,
            dimInactive = true,
            theme = "lotus",
        })
        vim.cmd.colorscheme("kanagawa-wave")
    end,
}
