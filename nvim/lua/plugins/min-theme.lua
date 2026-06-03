---@type LazySpec
return {
  {
    "datsfilipe/min-theme.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dark",
      transparent = true,
      italics = {
        comments = false,
        keywords = false,
        functions = false,
        strings = false,
        variables = false,
        bufferline = false,
      },
    },
    config = function(_, opts) require("min-theme").setup(opts) end,
  },
}
