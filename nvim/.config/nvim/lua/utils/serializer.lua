local M = {}

local function serialize(value, indent)
    indent = indent or ""

    if type(value) == "table" then
        local lines = { "{" }

        for key, item in pairs(value) do
            local line = string.format(
                "%s    %s = %s,",
                indent,
                key,
                serialize(item, indent .. "    ")
            )
            table.insert(lines, line)
        end

        table.insert(lines, indent .. "}")
        return table.concat(lines, "\n")
    end

    if type(value) == "string" then
        return string.format("%q", value)
    end

    return tostring(value)
end

function M.to_lua(table_data)
    return "return " .. serialize(table_data)
end

return M
