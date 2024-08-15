local function addRelativePath(dir)
    local spath =
        debug.getinfo(1, 'S').source
        :sub(2)
        :gsub("^([^/])", "./%1")
        :gsub("[^/]*$", "")
    dir = dir and (dir .. "/") or ""
    spath = spath .. dir
    package.path = spath .. "?.lua;"
        .. spath .. "?/init.lua"
        .. package.path
end

local M = {}
function M.AddRelativePath(dir)
    addRelativePath(dir)
end

return M
