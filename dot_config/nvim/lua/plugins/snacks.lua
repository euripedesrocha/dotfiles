return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      win = {
        position = "right",
        -- col = 0.4,
        width = 0.4,
        -- },
      },
    },
    lazygit = {
      cmd = "lazygit",
      win = {
        position = "float",
      },
    },
    picker = {
      sources = {
        git_files = {
          submodules = true,
        },
        git_grep = {
          untracked = true,
          submodules = true,
        },
      },
    },
  },
}
