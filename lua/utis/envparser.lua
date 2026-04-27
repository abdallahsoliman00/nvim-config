local M = {}

function M.load_env(path)
    local env = {}
    for line in io.lines(path) do
        local key, value = line:match('^([%w_]+)=?(.*)$')
        if key then
            env[key] = value
        end
    end
    return env
end

return M
