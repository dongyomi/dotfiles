vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<ESC>", ":nohls<cr>", { silent = true })

vim.keymap.set("n", "<C-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<C-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<C-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>")

vim.keymap.set("n", "<A-k>", "<CMD>resize -2<CR>")
vim.keymap.set("n", "<A-j>", "<CMD>resize +2<CR>")
vim.keymap.set("n", "<A-h>", "<CMD>vertical resize -2<CR>")
vim.keymap.set("n", "<A-l>", "<CMD>vertical resize +2<CR>")

vim.keymap.set("n", "<leader><leader>", ":b#<cr>", { silent = true })
vim.keymap.set("n", "<leader>r", ":restart<cr>", { silent = true })
vim.keymap.set("n", "<leader>sp", ":sp<cr>", { silent = true })
vim.keymap.set("n", "<leader>v", ":vs<cr>", { silent = true })
vim.keymap.set("n", "<leader>w", ":w<cr>", { silent = true })
vim.keymap.set("n", "<leader>x", function()
    if vim.bo.buftype == "terminal" then
        vim.cmd("bd!")
    else
        vim.cmd("bd")
    end
end, { silent = true })
vim.keymap.set("n", "<leader>X", ":%bd<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", ":q<cr>", { silent = true })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { silent = true })
vim.keymap.set("i", "<Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-x><C-o>"
end, { expr = true, remap = false })
vim.keymap.set("i", "<S-Tab>", function()
    return vim.fn.pumvisible() == 1 and "<C-p>" or "<S-Tab>"
end, { expr = true, remap = false })
vim.keymap.set("i", "<CR>", function()
    return vim.fn.pumvisible() == 1 and "<C-y>" or "<CR>"
end, { expr = true, remap = false })

vim.keymap.set("n", "<leader>b", ":Telescope buffers<cr>", { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>d", ":Telescope diagnostics<cr>", { desc = "Telescope diagnostics" })
vim.keymap.set("n", "<leader>f", ":Telescope find_files<cr>", { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>g", ":Telescope live_grep<cr>", { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>z", ":Telescope<cr>", { desc = "Telescope" })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.keymap.set("n", "<leader>m", require("plugins.markdown").toggle_mkdp, { silent = true })
    end,
})

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { silent = true })

local open_term = require("plugins.terminal").open_term
local send_term = require("plugins.terminal").send_term

vim.keymap.set("n", "<leader>t", function()
    open_term("vsplit", 1)
end, { silent = true })
vim.keymap.set("n", "<leader>st", function()
    open_term("split", 1)
end, { silent = true })

for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i .. "t", function()
        open_term("vsplit", i)
    end, { silent = true })

    vim.keymap.set("n", "<leader>" .. i .. "st", function()
        open_term("split", i)
    end, { silent = true })
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "python",
    callback = function()
        vim.keymap.set("v", "<leader><cr>", function()
            send_term(1)
        end, { silent = true })

        for i = 1, 9 do
            vim.keymap.set("v", "<leader>" .. i .. "<cr>", function()
                send_term(i)
            end, { silent = true })
        end
    end,
})
