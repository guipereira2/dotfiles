-- Roslyn-based LSP for C# (Microsoft.CodeAnalysis.LanguageServer)
-- The server binary is installed via Mason (see mason.lua: "roslyn")

---@type LazySpec
return {
  "seblyng/roslyn.nvim",
  ft = "cs",
  ---@module 'roslyn.config'
  ---@type RoslynNvimConfig
  opts = {},
}
