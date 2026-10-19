vim.lsp.config("clangd",{
    cmd = { "clangd" },

    filetypes = {
        "c",
        "cpp",
        "objc",
        "objcpp",
    },

    root_markers = {
        ".clangd",
        ".clang-tidy",
        ".clang-format",
        "compile_commands.json",
        "compile_flags.txt",
        "CMakeLists.txt",
        ".git",
    },
})

vim.lsp.enable("clangd")
