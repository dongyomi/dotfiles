--Default
--Print the line number in front of each line.
vim.opt.number = true
--Show the line number relative to the line with the cursor in front of each line.
vim.opt.relativenumber = true
--When and how to draw the signcolumn.
vim.opt.signcolumn = "yes"
--Highlight the text line of the cursor with CursorLine.
vim.opt.cursorline = true
--Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

--Indent
--Use the appropriate number of spaces to insert a <Tab>.
vim.opt.expandtab = true
--The <Tab> key will move the cursor to the next soft tab stop, instead of inserting a literal tab.
vim.opt.softtabstop = 4
--Defines the column multiple used to display the Tab character.
vim.opt.tabstop = 4
--Number of columns that make up one level of (auto)indentation used by 'cindent', <<, >>, etc.
vim.opt.shiftwidth = 0
--Every wrapped line will continue visually indented (same amount of space as the beginning of that line)
vim.opt.breakindent = true

--Visual
--Displays invisible characters such as tabs, spaces, etc.
vim.opt.list = true
--Strings to use in 'list' mode and for the :list command.
vim.opt.listchars = { tab = "  ", space = " ", trail = " ", nbsp = " ", eol = "↵" }
--Characters to fill EOF
vim.opt.fillchars = { eob = " " }

--Ui
--Enables 24-bit RGB color in the TUI.
vim.opt.termguicolors = true
--Defines the default border style of floating windows.
vim.opt.winborder = "rounded"

--Input Delay
--If this many milliseconds nothing is typed the swap file will be written to disk (used by Lsp).
vim.opt.updatetime = 250
--Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.timeoutlen = 100

--Plugin
--Turn off built-in file explorer and directory browser in neovim.
vim.g.loaded_netrw = 1
--Turn off sub plugin of netrw.
vim.g.loaded_netrwPlugin = 1
