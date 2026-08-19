local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-c>"] = actions.close,

                ["<Tab>"] = actions.move_selection_next,
                ["<S-Tab>"] = actions.move_selection_previous,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<Down>"] = actions.move_selection_next,
                ["<Up>"] = actions.move_selection_previous,

                ["<CR>"] = actions.select_default,
                ["<C-u>"] = actions.results_scrolling_up,
                ["<C-d>"] = actions.results_scrolling_down,
                ["<C-h>"] = actions.results_scrolling_left,
                ["<C-l>"] = actions.results_scrolling_right,

                ["<M-u>"] = actions.preview_scrolling_up,
                ["<M-d>"] = actions.preview_scrolling_down,
                ["<M-h>"] = actions.preview_scrolling_left,
                ["<M-l>"] = actions.preview_scrolling_right,

                ["<C-s>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,

                ["<LeftMouse>"] = false,
                ["<2-LeftMouse>"] = false,

                ["<PageUp>"] = false,
                ["<PageDown>"] = false,

                ["<C-/>"] = false,
                ["<C-_>"] = false,
                ["<C-f>"] = false,
                ["<C-j>"] = false,
                ["<C-k>"] = false,
                ["<C-q>"] = false,

                ["<C-r><C-a>"] = false,
                ["<C-r><C-f>"] = false,
                ["<C-r><C-l>"] = false,
                ["<C-r><C-w>"] = false,

                ["<C-t>"] = false,
                ["<C-w>"] = false,
                ["<C-x>"] = false,

                ["<M-f>"] = false,
                ["<M-j>"] = false,
                ["<M-k>"] = false,
                ["<M-q>"] = false,
            },
        },
    },
})

require("telescope").load_extension("fzf")
