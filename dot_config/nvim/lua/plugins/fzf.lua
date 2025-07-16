return {
  "ibhagwan/fzf-lua",
  opts = {
    git = {
      files = {
        cmd = "git ls-files --exclude-standard --recurse-submodules", -- Include submodule files
      },
    },
  },
  keys = {
    { "<leader>clr", "<cmd>FzfLua lsp_references<cr>", desc = "LSP references" },
    { "<leader>cli", "<cmd>FzfLua lsp_incoming_calls<cr>", desc = "LSP references" },
  },
}
