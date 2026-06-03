---@type LazySpec
return {
  "nvim-mini/mini.icons",
  opts = {
    default = {
      directory = { hl = "NeoTreeDirIconWhite" },
    },
    extension = {
      conf = { glyph = "", hl = "MiniIconsGrey" },
      go = { glyph = "󰟓", hl = "MiniIconsCyan" },
      py = { glyph = "󰌠", hl = "MiniIconsBlue" },
    },
    filetype = {
      go = { glyph = "󰟓", hl = "MiniIconsCyan" },
      python = { glyph = "󰌠", hl = "MiniIconsBlue" },
    },
    file = {
      ["tmux.conf"] = { glyph = "", hl = "MiniIconsGrey" },
      [".tmux.conf"] = { glyph = "", hl = "MiniIconsGrey" },
      ["ghostty.conf"] = { glyph = "", hl = "MiniIconsGrey" },
    },
  },
}
