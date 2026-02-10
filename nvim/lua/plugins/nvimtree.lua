return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        on_attach = function(bufnr)
            local api = require("nvim-tree.api")
            local function opts(desc)
                return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
            end

            vim.keymap.set("n", "a", api.fs.create, opts("Create"))
            vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
            vim.keymap.set("n", "R", api.fs.rename_full, opts("Rename: Full Path"))
            vim.keymap.set("n", "d", api.fs.remove, opts("Delete"))
            vim.keymap.set("n", "y", api.fs.copy.filename, opts("Copy Name"))
            vim.keymap.set("n", "Y", api.fs.copy.absolute_path, opts("Copy"))
            vim.keymap.set("n", "<CR>", function(node)
                api.node.open.no_window_picker(node)
                api.tree.focus()
            end, opts("Open"))
            vim.keymap.set("n", "?", api.node.show_info_popup, opts("Info"))
            vim.keymap.set("n", "c", api.tree.change_root_to_node, opts("Change Root"))
            vim.keymap.set("n", "p", api.node.navigate.parent, opts("Parent Directory"))
            vim.keymap.set("n", "P", api.tree.change_root_to_parent, opts("Up"))
            vim.keymap.set("n", "s", api.tree.search_node, opts("Search"))
            vim.keymap.set("n", "e", api.tree.collapse_all, opts("Collapse"))
            vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
            vim.keymap.set("n", "q", api.tree.close, opts("Close"))
        end,

        view = {
            width = 40,
        },
        renderer = {
            indent_width = 2,
            indent_markers = {
                enable = true,
            },
            special_files = {},
            icons = {
                web_devicons = {
                    file = {
                        enable = true,
                        color = false,
                    },
                },
                show = {
                    git = false,
                    modified = false,
                    hidden = false,
                },
                glyphs = {
                    default = "",
                    symlink = "",
                    bookmark = "",
                    hidden = "",
                    folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                    },
                },
            },
        },
        actions = {
            file_popup = {
                open_win_config = {
                    border = "rounded",
                },
            },
        },
    },
}
