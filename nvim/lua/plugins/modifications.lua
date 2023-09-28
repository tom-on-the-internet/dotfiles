return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = { position = "right", mappings = { ["<cr>"] = "close_on_open" } },
      filesystem = {
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          hide_gitignored = true,
          hide_by_name = {
            -- '.git',
            -- '.DS_Store',
            -- 'thumbs.db',
          },
          never_show = {},
        },
        commands = {
          close_on_open = function(state)
            local node = state.tree:get_node()
            if require("neo-tree.utils").is_expandable(node) then
              state.commands["toggle_node"](state)
            else
              state.commands["open"](state)
              state.commands["close_window"](state)
              vim.cmd("normal! M")
            end
          end,
        },
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        path_display = { "truncate" },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = "delete_buffer", -- delete buffer
            },
          },
        },
      },
    },
  },
}
