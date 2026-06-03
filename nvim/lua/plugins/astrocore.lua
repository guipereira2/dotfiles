---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = false,
        swapfile = false,
      },
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<S-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<S-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<C-S-C>"] = { '"+yy', desc = "Copy line to clipboard" },
        ["<C-v>"] = { '"+p', desc = "Paste from clipboard" },
      },
      v = {
        ["<C-S-C>"] = { '"+y', desc = "Copy selection to clipboard" },
        ["<C-v>"] = { '"+p', desc = "Paste from clipboard" },
      },
      i = {
        ["<C-v>"] = { "<C-r>+", desc = "Paste from clipboard" },
      },
    },
  },
}
