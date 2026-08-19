local M = {}

M.terminal = {}

function M.open_term(split, index)
    if not M.terminal[index] or not vim.api.nvim_buf_is_valid(M.terminal[index]) then
        M.terminal[index] = nil
    end

    local term = M.terminal[index]

    if term then
        for _, v in ipairs(vim.api.nvim_list_wins()) do
            if vim.api.nvim_win_get_buf(v) == term then
                vim.api.nvim_set_current_win(v)
                return
            end
        end

        vim.cmd(split)
        vim.api.nvim_set_current_buf(term)
    else
        vim.cmd(split)
        vim.cmd("terminal")

        local buf = vim.api.nvim_get_current_buf()
        M.terminal[index] = buf
        vim.api.nvim_buf_set_name(buf, "terminal " .. index)
    end
end

function M.send_term(index)
    local lines = vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = vim.fn.mode() })

    while #lines > 0 and lines[1]:match("^%s*$") do
        table.remove(lines, 1)
    end
    while #lines > 0 and lines[#lines]:match("^%s*$") do
        table.remove(lines, #lines)
    end

    if #lines > 0 then
        local term = M.terminal[index]

        if not term or not vim.api.nvim_buf_is_valid(term) then
            vim.api.nvim_echo({ { "terminal " .. index .. " is not running", "ErrorMsg" } }, true, {})
            return
        end

        local id = vim.b[term].terminal_job_id
        vim.api.nvim_chan_send(id, "\27[200~" .. table.concat(lines, "\n") .. "\n" .. "\27[201~")
        vim.defer_fn(function()
            vim.api.nvim_chan_send(id, "\n")
        end, 20)
    end
end

return M
