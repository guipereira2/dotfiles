---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = {
      condition = function() return vim.bo.filetype ~= "snacks_dashboard" end,
      hl = { fg = "fg", bg = "NONE" },
      status.component.git_branch { surround = false, padding = { left = 1, right = 1 } },
      status.component.file_info {
        file_icon = { padding = { left = 1, right = 1 } },
        bufnr = false,
        unique_path = false,
        filename = false,
        file_modified = false,
        file_read_only = false,
        close_button = false,
        filetype = { padding = { left = 0, right = 1 } },
        surround = false,
      },
      status.component.fill(),
      status.component.lsp {
        lsp_progress = false,
        lsp_client_names = { padding = { left = 1, right = 1 } },
        surround = false,
      },
    }

    if opts.tabline and opts.tabline[2] then
      opts.tabline[2] = status.heirline.make_buflist {
        status.component.tabline_file_info(),
        { provider = "│", hl = { fg = "#3a3a3a" } },
      }
    end
  end,
}
