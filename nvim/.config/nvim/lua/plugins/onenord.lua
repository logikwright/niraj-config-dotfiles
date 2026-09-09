return {
    "rmehri01/onenord.nvim",
    priority = 1000,
    config = function()
        require("onenord").setup({
            theme = "dark",
            borders = true,
            fade_nc = false,
        })
    end,
}
