local config = require("gruber-black.config")

local M = {}

function M.setup(opts)
    config.options = vim.tbl_deep_extend("force", config.options, opts or {})
end

return M
