---@type LazySpec
return {
  "stevearc/aerial.nvim",
  opts = function(_, opts)
    local function i(cp) return vim.fn.nr2char(cp) .. " " end
    opts.nerd_font = true
    opts.icons = {
      Array         = i(0xEA8B),
      Boolean       = i(0xEB63),
      Class         = i(0xEB5B),
      Constant      = i(0xEB63),
      Constructor   = i(0xE624),
      Enum          = i(0xEA95),
      EnumMember    = i(0xEB5E),
      Event         = i(0xEA88),
      Field         = i(0xEB5F),
      File          = i(0xEA8A),
      Function      = i(0xEA8C),
      Interface     = i(0xEB61),
      Key           = i(0xEB60),
      Method        = i(0xEA8C),
      Module        = i(0xEA8A),
      Namespace     = i(0xEA8A),
      Null          = i(0xEB63),
      Number        = i(0xEA88),
      Object        = i(0xEB62),
      Operator      = i(0xEB64),
      Package       = i(0xEA8A),
      Property      = i(0xEB65),
      String        = i(0xEA8B),
      Struct        = i(0xEB62),
      TypeParameter = i(0xEA92),
      Variable      = i(0xEA88),
      Collapsed     = i(0xE602),
    }
    return opts
  end,
}
