return {
    "rebelot/kanagawa.nvim",
    priority = 1000,
    config = function()
        require("kanagawa").setup({
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
            transperent = true,
            dimInactive = true,
            theme = "dragon",
        })
        vim.cmd.colorscheme("kanagawa")
    end,
}
