local M = {}

local state = require("theme_state")

function M.load()
    vim.o.background = "dark"
    vim.cmd.colorscheme(state.current)
end

function M.save(theme)

    local ok, err = pcall(vim.cmd.colorscheme, theme)

    if not ok then
        vim.notify(
            string.format("Theme '%s' is not installed.", theme),
            vim.log.levels.ERROR,
            { title = "MyTheme" }
        )
        return
    end

    state.current = theme

    local path = vim.fn.stdpath("config") .. "/lua/theme_state.lua"

    local lines = {
        "return {",
        string.format(' current = "%s",', theme),
        "}",
    }

    vim.fn.writefile(lines, path)
end

return M
