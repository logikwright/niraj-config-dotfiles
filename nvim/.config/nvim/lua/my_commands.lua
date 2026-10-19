vim.api.nvim_create_user_command("MyTheme", function(opts)
    local args = vim.split(opts.args, "%s+")

    local theme = table.remove(args, 1)
    local variant = table.concat(args, " ")

    require("theme").save(theme, variant)
    -- print("Theme:", theme)
    -- print("Variant:", variant)
end, {
    nargs = "+",
    complete = "color",
})
