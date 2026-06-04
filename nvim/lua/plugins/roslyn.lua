---@type LazySpec
return {
  "seblyng/roslyn.nvim",
  ft = "cs",
  init = function()
    local d = vim.lsp.diagnostic
    if d and not d._refresh then
      d._refresh = function(opts)
        if d._workspace_diagnostics then pcall(d._workspace_diagnostics, opts or {}) end
      end
    end
  end,
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {},
}
