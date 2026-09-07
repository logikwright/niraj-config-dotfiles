return {
    {
        "neovim/nvim-lspconfig",
    },

    {
        "seblyng/roslyn.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },

        opts = {},
    },
}
