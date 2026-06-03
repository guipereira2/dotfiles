-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "min-theme",
    status = {
      components = {
        nav = {
          ruler = false,
          percentage = false,
          scrollbar = false,
          surround = false,
        },
      },
    },
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    highlights = {
      init = { -- this table overrides highlights in all themes
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        WinBar = { bg = "NONE" },
        WinBarNC = { bg = "NONE" },
        TabLine = { bg = "NONE" },
        TabLineFill = { bg = "NONE" },
        TabLineSel = { bg = "NONE" },
        SignColumn = { bg = "NONE" },
        NormalFloat = { bg = "NONE" },
        FloatBorder = { bg = "NONE" },
        EndOfBuffer = { bg = "NONE" },
        NeoTreeNormal = { bg = "NONE" },
        NeoTreeNormalNC = { bg = "NONE" },
        NeoTreeSignColumn = { bg = "NONE" },
        NeoTreeEndOfBuffer = { bg = "NONE" },
        NeoTreeVertSplit = { bg = "NONE" },
        NeoTreeWinSeparator = { bg = "NONE" },
        NeoTreeStatusLine = { bg = "NONE" },
        NeoTreeStatusLineNC = { bg = "NONE" },
        NeoTreeTabInactive = { bg = "NONE" },
        NeoTreeTabActive = { bg = "NONE" },
        NeoTreeTabSeparatorInactive = { bg = "NONE" },
        NeoTreeTabSeparatorActive = { bg = "NONE" },
        NeoTreeTabInactiveTransparent = { bg = "NONE" },
        NeoTreeTabActiveTransparent = { bg = "NONE", bold = true },
        NeoTreeTabSeparatorInactiveTransparent = { bg = "NONE" },
        NeoTreeTabSeparatorActiveTransparent = { bg = "NONE" },
        NeoTreeFloatNormal = { bg = "NONE" },
        NeoTreeFloatBorder = { bg = "NONE" },
      },
      astrodark = { -- a table of overrides/changes when applying the astrotheme theme
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
