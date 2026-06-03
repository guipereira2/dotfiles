---@type LazySpec
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astroui.status"
    opts.statusline = {
      hl = { fg = "fg", bg = "NONE" },
      status.component.file_info {
        file_icon = false,
        bufnr = false,
        unique_path = false,
        filename = false,
        file_modified = false,
        file_read_only = false,
        close_button = false,
        filetype = { padding = { left = 1, right = 1 } },
        surround = false,
      },
      status.component.git_branch { surround = false, padding = { left = 1, right = 1 } },
      status.component.lsp {
        lsp_progress = false,
        lsp_client_names = { padding = { left = 1, right = 1 } },
        surround = false,
      },
    }
  end,
}
