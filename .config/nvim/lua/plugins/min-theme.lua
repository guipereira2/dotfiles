---@type LazySpec
return {
  {
    "datsfilipe/min-theme.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dark",
      transparent = true,
    },
    config = function(_, opts) require("min-theme").setup(opts) end,
  },
}
