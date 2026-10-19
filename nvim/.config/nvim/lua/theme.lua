local M = {}

local state = require("theme_state")

function M.load()
    vim.o.background = "dark"

    if state.current == "material" then
        vim.g.material_style = state.material.style
    end

    if state.current == "kanagawa" then
        -- configure Kanagwa variant
    end

    vim.cmd.colorscheme(state.current)
end

function M.save(theme, variant)

    local ok, err = pcall(vim.cmd.colorscheme, theme)

    if not ok then
        vim.notify(
            string.format("Theme '%s' is not installed.", theme),
            vim.log.levels.ERROR,
            { title = "MyTheme" }
        )
        return
    end

    if theme == "material" and variant then
        state.material.style = variant
        print("Material style: ", state.material.style)
    end

    if theme == "kanagawa" and variant then
        state.kanagawa.theme = variant
    end

    state.current = theme

    local path = vim.fn.stdpath("config") .. "/lua/theme_state.lua"
    
    local serializer = require("utils.serializer")

    local content = serializer.to_lua(state)

    print(content)

    vim.fn.writefile(
        vim.split(content, "\n"),
        path
    )

    M.load()
end

return M
