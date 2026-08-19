vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.cursorline = true

vim.opt.fillchars = { eob = " " }
vim.opt.list = true
vim.opt.listchars = { tab = "  ", space = " ", trail = "•", nbsp = "␣", eol = " " }

vim.opt.scrolloff = 10

vim.opt.breakindent = true
vim.opt.expandtab = true
vim.opt.shiftwidth = 0
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

vim.opt.termguicolors = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.autocomplete = true
vim.opt.complete = "o"
vim.opt.completeopt = { "fuzzy", "menuone", "noinsert", "noselect" }
vim.opt.pumheight = 7

vim.opt.cmdheight = 0
vim.opt.laststatus = 3
vim.opt.statusline = "%!v:lua.create_statusline()"

vim.opt.timeoutlen = 1500
vim.opt.updatetime = 250

vim.opt.undofile = true
