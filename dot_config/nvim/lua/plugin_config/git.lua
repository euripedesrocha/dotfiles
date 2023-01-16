require('gitsigns').setup {
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    -- Text object
    map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')

    local command_center = require("command_center")
    local noremap = { noremap = true }
    -- local silent_noremap = { noremap = true, silent = true }

    command_center.add({
      {
        desc = "Toggle Gitsigns",
        cmd = "<CMD>Gitsigns toggle_signs<CR>",
        keys = { "n", "<leader>gst", noremap },
      }, {
        desc = "Stage hunk",
        cmd = "<CMD>Gitsigns stage_hunk<CR>",
        keys = {
          {"n", "<leader>hs", noremap },
          {"v", "<leader>hs", noremap }
        }
      }, {
        desc = "Undo stage hunk",
        cmd = gs.undo_stage_hunk,
        keys = {'n', "<leader>hu", noremap},
      },{
        desc = "Reset Buffer",
        cmd = gs.reset_buffer,
        keys = {'n', "<leader>gR", noremap},
      }, {
        desc = "Preview hunk",
        cmd = gs.preview_hunk,
        keys = { "n", "<leader>hp", noremap },
      }, {
        desc = "Blame line",
        cmd = function() gs.blame_line { full = true } end,
        keys = { "n", "<leader>glb", noremap },
      }, {
        desc = "Git togle line blame",
        cmd = gs.toggle_current_line_blame,
        keys = { "n", "<leader>gtb", noremap },
      },{
        desc = "Git Diff",
        cmd = gs.diffthis,
        keys = { "n", "<leader>gd", noremap },
      },{
        desc = "Git diff last commit",
        cmd = function() gs.diffthis('~') end,
        keys = { "n", "<leader>gD", noremap },
      },{
        desc = "Git togle deleted",
        cmd = gs.toggle_deleted,
        keys = { "n", "<leader>gtd", noremap },
      },
      {
        desc = "Stage buffer",
        cmd = gs.stage_buffer,
        keys = { "n", "<leader>ghS", noremap },
      }, {
        desc = "Next hunk",
        cmd = gs.next_hunk,
        keys = { "n", "]h", noremap },
      },{
        desc = "Prev hunk",
        cmd = gs.prev_hunk,
        keys = { "n", "[h", noremap },
      },{
        desc = "Git list of changes",
        cmd = gs.setqflist,
        keys = { "n", "<leader>gc", noremap },
      },
    }, {
      category = "git",
      command_center.mode.ADD_SET
    })
  end
}
local command_center = require("command_center")
local noremap = { noremap = true }
-- local silent_noremap = { noremap = true, silent = true }

command_center.add({
{
desc = "Fugitive",
cmd = "<CMD>Git<CR>",
keys = { "n", "<leader>g", noremap },
},
},
{
category = "git",
command_center.mode.ADD_SET
}
)
