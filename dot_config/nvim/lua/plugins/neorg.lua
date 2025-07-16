if true then
  return {}
end
return {
  {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    config = true,
    keys = {
      { "<leader>no", "<cmd>Neorg index<cr>", desc = "Open current neorg workspace index" },
      { "<leader>nr", "<cmd>Neorg return<cr>", desc = "Return from neorg" },
      { "<leader><up>", "<Plug>(neorg.text-objects.item-up)", desc = "Move item up" },
      { "<leader><down>", "<Plug>(neorg.text-objects.item-down)", desc = "Move item down" },
      { "<leader>nz", "<Plug>(neorg.telescope.backlinks.file_backlinks)", desc = "neorg file backlinks" },
      { "<leader>nh", "<Plug>(neorg.telescope.backlinks.header_backlinks)", desc = "neorg header backlinks" },
      { "<leader>nll", "<Plug>(neorg.telescope.find_linkable)", desc = "neorg find linkable" },
      { "<leader>nlf", "<Plug>(neorg.telescope.insert_file_link)", desc = "neorg insert file link" },
      { "<leader>nli", "<Plug>(neorg.telescope.insert_link)", desc = "neorg insert link" },
      { "<leader>nsh", "<Plug>(neorg.telescope.search_headings)", desc = "neorg search headings" },
      { "<leader>nsf", "<Plug>(neorg.telescope.find_norg_files)", desc = "neorg search files" },
      { "<leader>nw", "<Plug>(neorg.telescope.switch_workspace)", desc = "neorg switch workspace" },
    },
    opts = {
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.text-objects"] = {},
        ["core.summary"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes", -- Format: <name_of_workspace> = <path_to_workspace_root>
              journal = "~/journal/",
              tutorial = "~/Norg-Tutorial/",
            },
            default_workspace = "notes",
            index = "index.norg", -- The name of the main (root) .norg file
          },
        },
        ["core.integrations.telescope"] = {},
        ["core.journal"] = {
          strategy = "nested",
          workspace = "journal",
        },
        ["external.templates"] = {
          -- templates_dir = vim.fn.stdpath("config") .. "/templates/norg",
          -- default_subcommand = "add", -- or "fload", "load"
          -- keywords = { -- Add your own keywords.
          --   EXAMPLE_KEYWORD = function ()
          --     return require("luasnip").insert_node(1, "default text blah blah")
          --   end,
          -- },
          -- snippets_overwrite = {},
        },
      },
    },
    -- ADD THIS LINE
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-neorg/neorg-telescope" },
      { "pysan3/neorg-templates", dependencies = { "L3MON4D3/LuaSnip" } },
    },
  },
}
