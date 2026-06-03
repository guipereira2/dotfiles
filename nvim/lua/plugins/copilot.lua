---@type LazySpec
return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    cmd = "Copilot",
    opts = {
      panel = { enabled = false },
      suggestion = {
        enabled = true,
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
          accept = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      filetypes = {
        markdown = true,
        yaml = true,
        gitcommit = true,
        gitrebase = false,
        help = false,
      },
    },
  },
}
