return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
  },
  config = function()
    local telescope = require("telescope")
    local builtin = require("telescope.builtin")

    telescope.setup({
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
          "--glob=!node_modules/**",
          "--glob=!dist/**",
          "--glob=!build/**",
        },

        prompt_prefix = "   ",
        selection_caret = "❯ ",
        path_display = { "truncate" },

        file_ignore_patterns = {
          "node_modules",
          ".git/",
          "dist",
          "build",
        },
      },

      pickers = {
        find_files = {
          hidden = true,
        },
      },

      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    pcall(telescope.load_extension, "fzf")

    -- Telescope keymaps
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
    vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep (ripgrep)" })
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

    vim.keymap.set("n", "<leader>fw", function()
      builtin.live_grep({ default_text = vim.fn.expand("<cword>") })
    end, { desc = "Search word under cursor" })

    vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Git files" })
  end,
}
