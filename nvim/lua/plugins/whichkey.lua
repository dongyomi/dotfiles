return {
    "folke/which-key.nvim",
    dependencies = { { "echasnovski/mini.nvim", version = "*" } },
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 0,
        win = {
            width = { min = 0 },
            padding = { 2, 2 },
            title = false,
            border = "rounded",
        },
        layout = {
            width = { min = 40 },
            spacing = 3,
        },
        icons = {
            group = "",
            rules = false,
            mappings = false,
        },
        sort = { "manual" },
        show_help = false,
        show_keys = false,
        spec = {
            { "<leader>e", "<CMD>NvimTreeToggle<CR>", desc = "Explorer" },
            { "<leader>o", "<CMD>MarkdownPreviewToggle<CR>", desc = "Markdown" },
            { "<leader>r", "<CMD>Telescope live_grep<CR>", desc = "Find words" },
            { "<leader>f", "<CMD>Telescope find_files<CR>", desc = "Find files" },
            { "<leader>l", "<CMD>Lazy<CR>", desc = "Lazy" },
            { "<leader>m", "<CMD>Mason<CR>", desc = "Mason" },
            { "<leader>w", "<CMD>write<CR>", desc = "Write" },
            { "<leader>v", "<CMD>vsplit | wincmd p<CR>", desc = "Split" },
            {
                "<leader>a",
                function()
                    require("conform").format({ lsp_format = "fallback" })
                end,
                desc = "Formatter",
            },
            { "<leader>t", "<CMD>Telescope<CR>", desc = "Telescope" },
            { "<leader>x", "<CMD>bd<CR>", desc = "Close buffer" },
            { "<leader>X", "<CMD>bufdo bd<CR>", desc = "Close all" },
            { "<leader>q", "<CMD>q<CR>", desc = "Close window" },
            { "<leader>Q", "<CMD>q!<CR>", desc = "Close force" },
        },
    },
}
