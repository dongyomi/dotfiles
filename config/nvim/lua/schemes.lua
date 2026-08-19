vim.g.gruvbox_material_background = "hard"
vim.g.gruvbox_material_foreground = "material"

vim.cmd([[colorscheme gruvbox-material]])

vim.api.nvim_set_hl(0, "PmenuKind", { bg = "#3c3836", fg = "#ddc7a1" })

vim.api.nvim_set_hl(0, "StatuslineModeBlue", { bg = "#7daea3", fg = "#1d2021", bold = true })
vim.api.nvim_set_hl(0, "StatuslineModeCyan", { bg = "#89b482", fg = "#1d2021", bold = true })
vim.api.nvim_set_hl(0, "StatuslineModeGreen", { bg = "#a9b665", fg = "#1d2021", bold = true })
vim.api.nvim_set_hl(0, "StatuslineModeMagenta", { bg = "#d3869b", fg = "#1d2021", bold = true })
vim.api.nvim_set_hl(0, "StatuslineModeRed", { bg = "#ea6962", fg = "#1d2021", bold = true })
vim.api.nvim_set_hl(0, "StatuslineModeWhite", { bg = "#d4be98", fg = "#1d2021", bold = true })
vim.api.nvim_set_hl(0, "StatuslineModeYellow", { bg = "#d8a657", fg = "#1d2021", bold = true })
