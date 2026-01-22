return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- In case something loads early, this avoids hard-crashing
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      vim.notify("nvim-treesitter not loaded yet. Run :Lazy sync and restart nvim.", vim.log.levels.ERROR)
      return
    end

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",

        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        "go",
        "python",

        "yaml",
        "toml",
        "markdown",
        "markdown_inline",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<CR>",
          node_incremental = "<CR>",
          node_decremental = "<BS>",
        },
      },
    })
  end,
}
