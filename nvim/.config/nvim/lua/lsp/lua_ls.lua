vim.lsp.config("lua_ls", {
    cmd = { 
        "lua-language-server",
        "--logpath=" .. vim.fn.expand("~/.local/state/lua-language-server"),
    },

    filetypes = {
        "lua",
    },

    root_markers = {
        ".luarc.json",
        ".luarc.jsonc",
        ".git",
    },

    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                },
            },
        },
    },
})

vim.lsp.enable("lua_ls")
