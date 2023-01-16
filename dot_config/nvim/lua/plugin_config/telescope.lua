local telescope = require("telescope")
local command_center = require("command_center")
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
  },
  extensions = {
    command_center = {
      components = {
        command_center.component.DESC,
        command_center.component.KEYS,
        command_center.component.CATEGORY,
      },
      sort_by = {
        command_center.component.KEYS,
        command_center.component.DESC,
        command_center.component.CATEGORY,
      },
      auto_replace_desc_with_cmd = true,
    }
  }
}

telescope.load_extension('command_center')
command_center.add({
  {
    desc = "Open command_center",
    cmd = "<CMD>Telescope command_center<CR>",
    keys = {
      { "n", "<Leader>fc", noremap },
      { "v", "<Leader>fc", noremap },

      -- If ever hesitate when using telescope start with <leader>f,
      -- also open command center
      { "n", "<Leader>f", noremap },
      { "v", "<Leader>f", noremap },
    },
  }
}, command_center.mode.SET)

-- local builtin = require('telescope.builtin')

command_center.add({
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

  }, {
    desc = "Show diagnostics",
    cmd = "<CMD>Telescope diagnostics<CR>",
    keys = { "n", "<leader>td", noremap },

  }, {
    desc = "Implementations",
    cmd = "<CMD>Telescope lsp_implementations<CR>",
    keys = { "n", "<leader>ti", noremap },

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
  command_center.mode.ADD_SET

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
