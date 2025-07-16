return {
  "vim-voom/VOoM",
  cmd = "Voom",
  config = function()
    -- Optional: Set default outline type for file types
    vim.g.voom_ft_modes = {
      markdown = "markdown",
      python = "python",
      lua = "lua",
      vim = "vimoutliner",
    }
    -- Optional: Set default width of the outline window
    vim.g.voom_tree_width = 30
  end,
}
