---@type LazySpec
return {
  {
    "sheng-tse/jupynvim",
    -- Carrega no startup: o plugin registra um autocmd BufReadCmd em *.ipynb
    -- dentro do setup(), entao precisa estar ativo ANTES de abrir o arquivo.
    lazy = false,
    build = function(plugin)
      local install = loadfile(plugin.dir .. "/lua/jupynvim/install.lua")()
      install.run(plugin)
    end,
    opts = {
      log_level = "info",
      image_renderer = "placeholder", -- correto p/ uso dentro do tmux (kitty direto e' instavel ali)
      auto_venv = true, -- detecta o .venv do projeto (ipykernel) subindo a partir do notebook
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
