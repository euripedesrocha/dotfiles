return {
  -- change trouble config
  {
    "nvim-telescope/telescope.nvim",
    -- opts will be merged with the parent spec
    opts = {
      pickers = {
        git_files = {
          recurse_submodules = true,
        },
      },
    },
    dependencies = {
      { "nvim-telescope/telescope-symbols.nvim" },
    },
  },
}
