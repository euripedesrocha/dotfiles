local telescope = require("telescope")
local actions = require("telescope.actions")
local noremap = { noremap = true }
-- local silent_noremap = { noremap = true, silent = true }

telescope.setup {
  mappings = {
    i = {
      ["<esc>"] = actions.close
    },
  },
  pickers = {
    git_files = {
      recurse_submodules = true,
    }
  }
}
require("commander").setup({
  -- Specify what components are shown in the prompt;
  -- Order matters, and components may repeat
  components = {
    "DESC",
    "KEYS",
    "CMD",
    "CAT",
  },

  -- Spcify by what components the commands is sorted
  -- Order does not matter
  sort_by = {
    "DESC",
    "KEYS",
    "CMD",
    "CAT",
  },

  -- Change the separator used to separate each component
  separator = " ",

  -- When set to true,
  -- The desc component will be populated with cmd if desc is empty or missing.
  auto_replace_desc_with_cmd = true,

  -- Default title of the prompt
  prompt_title = "Commander",

  integration = {
    telescope = {
      -- Set to true to use telescope instead of vim.ui.select for the UI
      enable = true,
      -- Can be any builtin or custom telescope theme
      theme = theme,
    },
  }
})
require("commander").add({
  {
    desc = "Open commander",
    cmd = "<CMD>Telescope commander<CR>",
    keys = {
      { "n", "<Leader>fc", noremap },
      { "v", "<Leader>fc", noremap },

      -- If ever hesitate when using telescope start with <leader>f,
      -- also open command center
      { "n", "<Leader>f", noremap },
      { "v", "<Leader>f", noremap },
    },
    set = true,
  }
})
-- Add a new command
require("commander").add({
  {
    desc = "Open commander",
    cmd = require("commander").show,
    keys = { "n", "<Leader>fc" },
  }
})
-- Show commander and select the command by pressing "<leader>fc"
-- local builtin = require('telescope.builtin')

require("commander").add({
  {
    desc = "Telescope",
    cmd = "<CMD>Telescope<CR>",
    keys = { "n", "<leader>t", noremap },
  }, {
    desc = "Search inside current buffer",
    cmd = "<CMD>Telescope current_buffer_fuzzy_find<CR>",
    keys = { "n", "<leader>fl", noremap },
  }, {
    desc = "Find files",
    cmd = "<CMD>Telescope find_files<CR>",
    keys = { "n", "<leader>ff", noremap },
  }, {
    desc = "Find files git repository",
    cmd = "<CMD>Telescope git_files<CR>",
    keys = { "n", "<leader>fg", noremap },
  }, {
    desc = "Find buffers",
    cmd = "<CMD>Telescope buffers<CR>",
    keys = { "n", "<F4>", noremap },
  }, {
    -- You can specify multiple keys for the same cmd ...
    desc = "Show document symbols",
    cmd = "<CMD>Telescope lsp_document_symbols<CR>",
    keys = {
      { "n", "<leader>o", noremap },
      { "n", "<leader>ssd", noremap },
    },
  },
  {
    desc = "Live grep",
    cmd = "<CMD>Telescope live_grep<CR>",
    keys = { "n", "<leader>lg", noremap },
    set = true,

  }, {
    desc = "Show diagnostics",
    cmd = "<CMD>Telescope diagnostics<CR>",
    keys = { "n", "<leader>td", noremap },
    set = true,

  }, {
    desc = "Implementations",
    cmd = "<CMD>Telescope lsp_implementations<CR>",
    keys = { "n", "<leader>ti", noremap },
    set = true,

  }

  -- {
  --   -- ... and for different modes
  --   desc = "Show function signaure (hover)",
  --   cmd = "<CMD>lua vim.lsp.buf.hover()<CR>",
  --   keys = {
  --     { "n", "K", silent_noremap },
  --     { "i", "<C-k>", silent_noremap },
  --   }
  -- },
}, {
  category = "telescope",
}
)

---- Enable telescope fzf native, if installed
--pcall(require('telescope').load_extension, 'fzf')
--
---- See `:help telescope.builtin`
--vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
--vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
--vim.keymap.set('n', '<leader>/', function()
--  -- You can pass additional configuration to telescope to change theme, layout, etc.
--  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--    winblend = 10,
--    previewer = false,
--  })
--end, { desc = '[/] Fuzzily search in current buffer]' })
--
--vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
--vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
--vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
--
--
