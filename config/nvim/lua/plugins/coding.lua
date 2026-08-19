local M = {}

M.treesitter = {
    "bash",
    "c",
    "diff",
    "go",
    "json",
    "lua",
    "markdown",
    "python",
    "toml",
    "vim",
    "vimdoc",
}

M.lsp = {
    go = "gopls",
    lua = "lua_ls",
    python = "pyright",
}

M.lsp_config = {
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = { globals = { "vim" } },
            },
        },
    },
}

M.formatter = {
    go = { name = "gofmt", cmd = "gofmt" },
    json = { name = "jq", cmd = "jq ." },
    lua = { name = "stylua", cmd = "stylua --stdin-filepath % --search-parent-directories -" },
    python = { name = "ruff_format", cmd = "ruff format --stdin-filename % -" },
}

require("nvim-treesitter").install(M.treesitter)

vim.lsp.enable(vim.tbl_values(M.lsp))

for k, v in pairs(M.lsp_config) do
    vim.lsp.config[k] = v
end

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "● ",
            [vim.diagnostic.severity.WARN] = "▲ ",
            [vim.diagnostic.severity.INFO] = "■ ",
            [vim.diagnostic.severity.HINT] = "◆ ",
        },
    },
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if client and client:supports_method("textDocument/completion") then
            vim.lsp.completion.enable(true, client.id, args.buf, {
                autotrigger = true,
                convert = function(item)
                    local kinds = vim.lsp.protocol.CompletionItemKind
                    local kind_name = kinds[item.kind] or ""
                    return {
                        abbr = item.label,
                        kind = kind_name ~= "" and string.format(" [%s] ", kind_name:lower()) or "",
                        menu = "",
                    }
                end,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql",
    callback = function()
        vim.opt_local.omnifunc = ""
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function(args)
        local buf = args.buf
        local fmt = M.formatter[vim.bo[buf].filetype]
        local cmd = fmt and fmt.cmd or nil

        if cmd then
            local bufname = vim.api.nvim_buf_get_name(buf)
            local resolve = cmd:gsub("%%", function()
                return vim.fn.shellescape(bufname)
            end)

            local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
            local input = table.concat(lines, "\n")

            local output = vim.fn.system(resolve, input)

            if vim.v.shell_error == 0 then
                local result = vim.split(output, "\n", { plain = true })
                if result[#result] == "" then
                    table.remove(result)
                end
                vim.api.nvim_buf_set_lines(buf, 0, -1, false, result)
            end
        end
    end,
})

return M
