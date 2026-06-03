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
      separators = {
        breadcrumbs = " › ",
      },
      attributes = {
        buffer_active = { italic = false, bold = true },
      },
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
        SnacksDashboardHeader  = { fg = "#ffffff" },
        SnacksDashboardDesc    = { fg = "#ffffff" },
        SnacksDashboardIcon    = { fg = "#ffffff" },
        SnacksDashboardKey     = { fg = "#ffffff" },
        SnacksDashboardFooter  = { fg = "#ffffff" },
        SnacksDashboardSpecial = { fg = "#ffffff" },
        NeoTreeDirIconWhite = { fg = "#ffffff" },
        Normal = { bg = "NONE" },
        NormalNC = { bg = "NONE" },
        StatusLine = { bg = "NONE" },
        StatusLineNC = { bg = "NONE" },
        SnacksIndent = { fg = "#3a3a3a" },
        SnacksIndentScope = { fg = "#4a4a4a" },
        WinSeparator = { fg = "#3a3a3a", bg = "NONE" },
        VertSplit = { fg = "#3a3a3a", bg = "NONE" },
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
        NeoTreeTabSeparatorInactive = { bg = "NONE", fg = "#3a3a3a" },
        NeoTreeTabSeparatorActive = { bg = "NONE", fg = "#3a3a3a" },
        NeoTreeTabInactiveTransparent = { bg = "NONE" },
        NeoTreeTabActiveTransparent = { bg = "NONE", bold = true },
        NeoTreeTabSeparatorInactiveTransparent = { bg = "NONE", fg = "#3a3a3a" },
        NeoTreeTabSeparatorActiveTransparent = { bg = "NONE", fg = "#3a3a3a" },
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
