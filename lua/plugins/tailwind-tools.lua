return {
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    event = "VeryLazy",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      document_color = {
        enabled = true, -- highlight Tailwind colors in buffers
        kind = "inline", -- "inline" | "background" | "foreground"
        inline_symbol = "■ ",
      },
      conceal = {
        enabled = false, -- set true if you like hiding long class strings
      },
    },
  },
}
