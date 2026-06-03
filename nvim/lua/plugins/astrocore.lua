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
        laststatus = 3,
      },
    },
    autocmds = {
      hide_dashboard_statusline = {
        {
          event = "FileType",
          pattern = "snacks_dashboard",
          callback = function() vim.opt_local.statusline = " " end,
        },
      },
      dir_open_layout = {
        {
          event = "VimEnter",
          callback = function(data)
            if vim.fn.isdirectory(data.file) == 1 then
              vim.schedule(function()
                local win = vim.api.nvim_get_current_win()
                local buf = vim.api.nvim_get_current_buf()
                require("snacks.dashboard").open({ win = win, buf = buf })
                vim.schedule(function()
                  require("neo-tree.command").execute({
                    action = "show",
                    source = "filesystem",
                    position = "right",
                    dir = data.file,
                  })
                  vim.api.nvim_set_current_win(win)
                end)
              end)
            end
          end,
        },
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
        ["<C-Tab>"]   = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["<C-S-Tab>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<C-S-C>"] = { '"+yy', desc = "Copy line to clipboard" },
        ["<C-v>"] = { '"+p', desc = "Paste from clipboard" },
      },
      v = {
        ["<C-S-C>"] = { '"+y', desc = "Copy selection to clipboard" },
        ["<C-v>"] = { '"+p', desc = "Paste from clipboard" },
      },
      i = {
        ["<C-v>"] = { "<C-r>+", desc = "Paste from clipboard" },
        ["<C-d>"] = { function() require("blink.cmp").show() end, desc = "Show completions" },
      },
    },
  },
}
