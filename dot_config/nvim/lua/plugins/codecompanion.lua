return {
  "olimorris/codecompanion.nvim",
  config = true,
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    adapters = {
      gemini = function()
        return require("codecompanion.adapters").extend("gemini", {
          env = {
            api_key = "cmd: secret-tool lookup gemini api_key",
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = "copilot",
      },
      inline = {
        adapter = "copilot",
      },
    },
  },
  keys = {
    { "<leader>aci", ":CodeCompanion<CR>", desc = "CodeCompanion Inline" },
    { "<leader>acc", ":CodeCompanionChat<CR>", desc = "CodeCompanion Chat" },
    { "<leader>act", ":CodeCompanionChat Toggle<CR>", desc = "CodeCompanionChat Toggle" },
    { "<C-Space>", "<cmd>lua require('codecompanion').complete()<CR>", desc = "CodeCompanion complete" },
    { "<leader>aca", ":CodeCompanionActions<CR>", desc = "CodeCompanion Action" },
    {
      "<leader>acs",
      "<cmd>lua require('codecompanion').select_strategy()<CR>",
      desc = "CodeCompanion Inline",
    },
  },
}
