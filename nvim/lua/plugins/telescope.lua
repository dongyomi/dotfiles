return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
        return {
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    vertical = {
                        width = 0.4,
                        height = 0.7,
                        preview_cutoff = 40,
                        prompt_position = "bottom",
                    },
                },
                initial_mode = "normal",
                default_mappings = false,
                mappings = {
                    i = {},
                    n = {
                        ["<C-j>"] = require("telescope.actions").preview_scrolling_down,
                        ["<C-k>"] = require("telescope.actions").preview_scrolling_up,
                        ["q"] = require("telescope.actions").close,
                        ["<esc>"] = require("telescope.actions").close,
                    },
                },
            },
        }
    end,
}
