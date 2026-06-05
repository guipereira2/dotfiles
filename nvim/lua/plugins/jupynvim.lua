---@type LazySpec
return {
  {
    "sheng-tse/jupynvim",
    lazy = false,
    build = function(plugin)
      local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
      install.run(plugin)
    end,
    opts = {
      log_level = "info",
      image_renderer = "placeholder",
      auto_venv = true,
    },
    config = function(_, opts)
      require("jupynvim").setup(opts)

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "python",
        callback = function(args)
          if vim.b[args.buf].jupynvim_filetype == nil then return end
          local ok, ap = pcall(require, "nvim-autopairs")
          if ok then ap.on_attach(args.buf) end
        end,
      })
    end,
  },
}
