local function status_mode()
    local mode_list = {
        n = "%#StatuslineModeWhite# N %*",
        i = "%#StatuslineModeCyan# I %*",
        v = "%#StatuslineModeMagenta# V %*",
        V = "%#StatuslineModeMagenta# V %*",
        ["\22"] = "%#StatuslineModeMagenta# V %*",
        c = "%#StatuslineModeBlue# C %*",
        t = "%#StatuslineModeGreen# T %*",
        R = "%#StatuslineModeRed# R %*",
        s = "%#StatuslineModeYellow# S %*",
        S = "%#StatuslineModeYellow# S %*",
        ["\19"] = "%#StatuslineModeYellow# S %*",
    }

    return mode_list[vim.fn.mode()]
end

local function status_git()
    local git_cmd = "git -C %s branch --show-current 2>/dev/null"
    local buf_path = vim.api.nvim_buf_get_name(0)

    return vim.fn.system(string.format(git_cmd, vim.fn.shellescape(vim.fs.dirname(buf_path)))):gsub("%s+", "")
end

local function status_diagnostic()
    local diag = ""
    local diag_list = { "%#DiagnosticError#e", "%#DiagnosticWarn#w", "%#DiagnosticInfo#i", "%#DiagnosticHint#h" }
    local diag_count = vim.diagnostic.count(0)

    for i = 1, 4 do
        if diag_count[i] and diag_count[i] > 0 then
            diag = diag .. diag_list[i] .. diag_count[i] .. "%*" .. " "
        end
    end

    return diag
end

local function status_coding()
    local code = require("plugins.coding")
    local type = vim.bo.filetype

    local fmt = code.formatter[type] and code.formatter[type].name or ""
    local lsp = code.lsp[type] or ""

    return fmt .. " " .. lsp .. " " .. type
end

local status_except = {
    help = "[help]",
    prompt = "[explorer]",
    terminal = "[%f]",
}

function _G.create_statusline()
    local buf_name = vim.api.nvim_buf_get_name(0)
    local buf_type = status_except[vim.bo.buftype]

    if buf_name == "" and not buf_type then
        return status_mode() .. " - " .. "[no name]"
    elseif buf_type then
        return status_mode() .. " - " .. buf_type
    else
        return status_mode()
            .. " "
            .. status_git()
            .. " "
            .. "%f%{(&modified || &readonly || !&modifiable) ? ' ' : ''}%m%r"
            .. " "
            .. status_diagnostic()
            .. "%="
            .. status_coding()
            .. " %l:%c "
    end
end
