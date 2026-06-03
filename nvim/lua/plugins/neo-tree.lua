---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    window = {
      position = "right",
      mappings = {
        ["<C-Tab>"] = "next_source",
        ["<C-S-Tab>"] = "prev_source",
      },
    },
    source_selector = {
      separator = { left = "", right = " │" },
    },
    filesystem = { hijack_netrw_behavior = "disabled" },
    event_handlers = {
      {
        event = "neo_tree_window_after_open",
        handler = function() vim.opt_local.statusline = " " end,
      },
    },
  },
}
