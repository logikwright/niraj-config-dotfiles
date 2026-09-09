return {
    "marko-cerovac/material.nvim",
    priority = 1000,
    config = function()
        vim.g.material_style = "darker" -- can be : oceanic, deep ocean, palenight, lighter

        require("material").setup({
            disable = {
                background = true, -- use your terminal background
            },
            lualine_style = "stealth", -- can be : default
        })
    end,
}
