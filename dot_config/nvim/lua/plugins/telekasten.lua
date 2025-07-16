return {
  {
    "nvim-telekasten/calendar-vim",
    keys = {
      { "<leader>cal", mode = { "n", "x", "o" }, false },
      { "<leader>caL", mode = { "n", "x", "o" }, false },
    },
  },
  {
    "nvim-telekasten/telekasten.nvim",
    lazy = false,
    version = "*",
    keys = {
      { "<leader>zg", "<cmd>Telekasten search_notes<cr>", desc = "Search notes" },
      { "<leader>zp", "<cmd>Telekasten panel<cr>", desc = "Telekasten panel" },
      { "<leader>zf", "<cmd>Telekasten find_notes<CR>", desc = "Find notes" },
      { "<leader>zz", "<cmd>Telekasten follow_link<CR>", desc = "Follow link" },
      { "<leader>zn", "<cmd>Telekasten new_note<CR>", desc = "New note" },
      { "<leader>zc", "<cmd>Telekasten show_calendar<CR>", desc = "Calendar" },
      { "<leader>zb", "<cmd>Telekasten show_backlinks<CR>", desc = "Backlinks" },
      { "<leader>zi", "<cmd>Telekasten insert_link<CR>", desc = "Insert link" },
      { "<leader>zv", "<cmd>Telekasten switch_vault<CR>", desc = "Switch Vault" },
      { "<leader>zw", "<cmd>Telekasten goto_thisweek<CR>", desc = "This week notes" },
    },
    opts = {
      home = vim.fn.expand("~/zettelnotes"),
      vaults = {
        projects = {
          home = vim.fn.expand("~/vaults/projects"),
        },
        areas = {
          home = vim.fn.expand("~/vaults/areas"),
        },
        resources = {
          home = vim.fn.expand("~/vaults/resources"),
        },
        archive = {
          home = vim.fn.expand("~/vaults/archive"),
        },
        espressif = {
          home = vim.fn.expand("~/vaults/espressif"),
        },
      },
      template_new_weekly = vim.fn.expand("~/zettelnotes/templates/weekly.md"),
      template_new_daily = vim.fn.expand("~/zettelnotes/templates/daily.md"),
    },
  },
}
