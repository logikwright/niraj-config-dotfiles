return {
    "ellisonleao/gruvbox.nvim",
    priority = 1000,
    config = function()
        require("gruvbox").setup({
            undercurl = true,
            bold = true,
            italic = {
                strings = false,
                emphasis = false,
                comments = true,
                operators = false,
                folds = false,
            },
            terminal_colors = true,
            contrast = "", -- "", "soft", or "hard"
            transparent_mode = true,
            dim_inactive = true
        })

        vim.o.background = "dark"
    end,
}
