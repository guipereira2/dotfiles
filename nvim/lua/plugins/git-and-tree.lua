---@type LazySpec
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      opts.options = opts.options or {}
      opts.options.opt = opts.options.opt or {}
      opts.options.opt.relativenumber = false
      opts.options.opt.ruler = false
      opts.options.opt.showcmd = false
      opts.options.opt.showmode = false
      opts.options.opt.laststatus = 2
      opts.options.opt.cmdheight = 0

      opts.mappings = opts.mappings or {}
      opts.mappings.n = opts.mappings.n or {}
      opts.mappings.n["<C-b>"] = { "<Cmd>Neotree toggle<CR>", desc = "Toggle Explorer" }
      opts.mappings.n["<C-h>"] = { "<Cmd>wincmd h<CR>", desc = "Focus left window" }
      opts.mappings.n["<C-l>"] = { "<Cmd>wincmd l<CR>", desc = "Focus right window" }
      opts.mappings.n["<C-Q>"] = false
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      opts.window = opts.window or {}
      opts.window.position = "right"
      opts.window.mappings = opts.window.mappings or {}
      opts.window.mappings["<C-q>"] = "open"
      opts.window.mappings["<C-Q>"] = "open"
      opts.sources = { "filesystem", "buffers" }
      opts.source_selector = opts.source_selector or {}
      opts.source_selector.highlight_tab = "NeoTreeTabInactiveTransparent"
      opts.source_selector.highlight_tab_active = "NeoTreeTabActiveTransparent"
      opts.source_selector.highlight_background = "NeoTreeTabInactiveTransparent"
      opts.source_selector.highlight_separator = "NeoTreeTabSeparatorInactiveTransparent"
      opts.source_selector.highlight_separator_active = "NeoTreeTabSeparatorActiveTransparent"
      opts.source_selector.sources = {
        { source = "filesystem", display_name = "File" },
        { source = "buffers", display_name = "Buffers" },
      }

      local cwd = (vim.uv or vim.loop).cwd()
      vim.fn.system({ "git", "-C", cwd, "rev-parse", "--is-inside-work-tree" })
      if vim.v.shell_error ~= 0 then opts.enable_git_status = false end
    end,
  },
}
