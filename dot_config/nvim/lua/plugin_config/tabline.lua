local tabline = require('tabline')
tabline.setup {
  -- Defaults configuration options
  enable = true,
  options = {
    -- If lualine is installed tabline will use separators configured in lualine by default.
    -- These options can be used to override those settings.
    section_separators = { '', '' },
    component_separators = { '', '' },
    max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
    show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
    show_devicons = true, -- this shows devicons in buffer section
    show_bufnr = false, -- this appends [bufnr] to buffer section,
    show_filename_only = false, -- shows base filename only instead of relative path in filename
    modified_icon = "+ ", -- change the default modified icon
    modified_italic = false, -- set to true by default; this determines whether the filename turns italic if modified
    show_tabs_only = false, -- this shows only tabs instead of tabs + buffers
  }
}

local commander = require("commander")
local options = { noremap = true, silent = true }
commander.add({
  {
    desc = "Create a new tab",
    cmd = "<cmd>TablineTabNew<CR>",
    keys = {"n", "<leader>tn", options}
  },{
    desc = "Next Buffer",
    cmd = "<cmd>TablineBufferNext<CR>",
    keys = {"n", "]t", options}
  },{
    desc = "Previous Buffer",
    cmd = "<cmd>TablineBufferPrevious<CR>",
    keys = {"n", "[t", options}
  },{
    desc = "Show only visible buffers",
    cmd = "<cmd>TablineToggleShowAllBuffers<CR>",
    keys = {"n", "<leader>tv", options}
  },

}, {
    category = "Tabs",
  }
)

