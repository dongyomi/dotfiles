local M = {}

vim.g.mkdp_auto_close = 0
vim.g.mkdp_page_title = "${name}"

M.mkdp_status = 0

function M.toggle_mkdp()
    if M.mkdp_status == 0 then
        M.mkdp_status = 1
        vim.cmd("MarkdownPreview")
        print("markdown preview opened")
    else
        M.mkdp_status = 0
        vim.cmd("MarkdownPreviewStop")
        vim.defer_fn(function()
            print("markdown preview closed")
        end, 100)
    end
end

return M
