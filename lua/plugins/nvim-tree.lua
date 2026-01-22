return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({})

    vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>",
      { desc = "Explorer" }
    )
    vim.keymap.set("n", "<leader>o", "<cmd>NvimTreeFocus<cr>",
      { desc = "Focus explorer" }
    )
  end,
}