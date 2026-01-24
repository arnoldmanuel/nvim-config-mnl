return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
    require("nvim-tree").setup({
      view = {
        side = "left",
        width = 50,
      },
    })

    local api = require("nvim-tree.api")

    -- Toggle tree (open/close)
    vim.keymap.set("n", "<leader>e", api.tree.toggle, { desc = "Toggle explorer" })

    -- Smart focus:
    -- - if you're in the tree, go back
    -- - otherwise, focus (and open if needed)
    vim.keymap.set("n", "<leader>o", function()
        if vim.bo.filetype == "NvimTree" then
        vim.cmd("wincmd p")
        else
        api.tree.focus()
        end
    end, { desc = "Focus explorer / back" })
    end,
}