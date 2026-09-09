vim.api.nvim_create_user_command("MyTheme", function(opts)
    require("theme").save(opts.args)
end, {
    nargs = 1,
    complete = "color",
})
