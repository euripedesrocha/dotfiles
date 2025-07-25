return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "ledger",
      })
      vim.treesitter.language.register("markdown", "telekasten")
      return opts
    end,
  },
}
