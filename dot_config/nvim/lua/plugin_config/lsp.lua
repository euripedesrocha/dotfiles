require('mason').setup()
local servers = {
  clangd = {},
  cmake = {},
  lua_ls = {},
  marksman = {},
  pyright = {},
  ruff_lsp = {},
  yamlls = {},
}
-- Setup neovim lua configuration
require('neodev').setup()
local null_ls = require("null-ls")

null_ls.setup {
  debug = true,
  sources = {
    -- null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.completion.spell,
    null_ls.builtins.diagnostics.cmake_lint,
    -- null_ls.builtins.diagnostics.cppcheck,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.diagnostics.proselint,
    null_ls.builtins.formatting.astyle.with({
      extra_args = { "--project", vim.fn.expand("~/.espressif/.astylerc") },
      -- condition = function(utils)
      --   return utils.root_has_file("tools/format.sh")
      -- end
    }),
    null_ls.builtins.diagnostics.actionlint,
  }
}
local on_attach
on_attach = function(_, bufnr)
  local lsp_formatting = function(buffer_number)
    vim.lsp.buf.format({
      filter = function(f_client)
        return f_client.name ~= "clangd"
      end,
      bufnr = buffer_number,
    })
  end
  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    lsp_formatting(bufnr)
  end, { desc = 'Format current buffer with LSP' })

  require('lspsaga').setup({
    finder = {
      max_height = 0.5,
      keys = {
        shuttle = '[w',
        toggle_or_open = 'o',
        vsplit = 'v',
        split = 's',
        tabe = 't',
        tabnew = 'r',
        quit = { 'q', '<ESC>' },
        close = '<C-c>k',
      },
      methods = {
        tyd = 'textDocument/typeDefinition'
      }
    },
    definition = {
      edit = "o",
      vsplit = "v",
      split = "s",
      tabe = "t",
      quit = "q",
    },
    code_action = {
      extend_gitsigns = false,
    },
    symbol_in_winbar = {
      enable = false
    },
  })
  local commander = require("commander")
  local options = { noremap = true, silent = true }
  commander.add({
    {
      desc = "Code Action",
      cmd = "<cmd>Lspsaga code_action<CR>",
      keys = { { "n", "<leader>ca", options }, { "v", "<leader>ca", options } }
    }, {
      desc = "Rename",
      cmd = "<cmd>Lspsaga rename<CR>",
      keys = { "n", "<leader>rn", options },
    }, {
      desc = "Line diagnostics",
      cmd = "<cmd>Lspsaga show_line_diagnostics<CR>",
      keys = { "n", "<leader>sd", options },
    }, {
      desc = "Peek definition",
      cmd = "<cmd>Lspsaga peek_definition<CR>",
      keys = { "n", "gd", options },
    }, {
      desc = "Show Outline",
      cmd = "<cmd>Lspsaga outline<CR>",
      keys = { "n", "<leader>so", options },
    }, {
      desc = "Format",
      cmd = "<cmd>Format<CR>",
      keys = { "n", "<leader>af", options },
    }, {
      desc = "LSP Finder",
      cmd = "<cmd>Lspsaga finder tyd+ref+imp+def<CR>",
      keys = { "n", "gh", options },
    }, {
      desc = "Next diagnostic",
      cmd = "<cmd>Lspsaga diagnostic_jump_next<CR>",
      keys = { "n", "]e", options },
    }, {
      desc = "Previous diagnostic",
      cmd = "<cmd>Lspsaga diagnostic_jump_prev<CR>",
      keys = { "n", "[e", options },
    }, {
      desc = "Next Error",
      cmd = function() require("lspsaga.diagnostic").goto_next({ severity = vim.diagnostic.severity.ERROR }) end,
      keys = { "n", "]E", options },
    }, {
      desc = "Previous Error",
      cmd = function() require("lspsaga.diagnostic").goto_prev({ severity = vim.diagnostic.severity.ERROR }) end,
      keys = { "n", "[E", options },
    }, {
      desc = "Hover Docs",
      cmd = "<cmd>Lspsaga hover_doc<CR>",
      keys = { "n", "K", options },
    },
    -- {
    --   desc = "Signature Help",
    --   cmd = vim.lsp.buf.implementation,
    --   keys = { "n", "<C-k>", options },
    -- },
    --
    --   -- nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    --   nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    --   nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    --   nmap('gI', , '[G]oto [I]mplementation')
    --   nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  }, {
    category = "LSP",
  }
  )

end

require('clangd_extensions').setup {
  server = { on_attach = on_attach },
}
-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

--
-- " Highlight the symbol and its references when holding the cursor.
-- autocmd CursorHold * silent call CocActionAsync('highlight')
-- "
-- "xmap <leader>f  <Plug>(coc-format-selected)
-- "nmap <leader>f  <Plug>(coc-format-selected)
-- "
--
-- "nnoremap <leader>f :CocFix<CR>
--   "
--   "   " Applying codeAction to the selected region.
--   " Example: `<leader>aap` for current paragraph
-- xmap <leader>a  <Plug>(coc-codeaction-selected)
-- nmap <leader>a  <Plug>(coc-codeaction-selected)
-- "
-- " " Remap keys for applying codeAction to the current buffer.
--  nmap <leader>ac  <Plug>(coc-codeaction)
-- " " Apply AutoFix to problem on the current line.
--  nmap <leader>f  <Plug>(coc-fix-current)
-- "
-- " " Map function and class text objects
-- " " NOTE: Requires 'textDocument.documentSymbol' support from the
-- " language server.
--  xmap if <Plug>(coc-funcobj-i)
--  omap if <Plug>(coc-funcobj-i)
--  xmap af <Plug>(coc-funcobj-a)
--  omap af <Plug>(coc-funcobj-a)
--  xmap ic <Plug>(coc-classobj-i)
--  omap ic <Plug>(coc-classobj-i)
--  xmap ac <Plug>(coc-classobj-a)
--  omap ac <Plug>(coc-classobj-a)
-- "
-- " Use CTRL-S for selections ranges.
-- " " Requires 'textDocument/selectionRange' support of
-- " language server.
--  nmap <silent> <C-s> <Plug>(coc-range-select)
--  xmap <silent> <C-s> <Plug>(coc-range-select)
-- "
-- " " Add `:Fold` command to fold current buffer.
--  command! -nargs=? Fold :call     CocAction('fold', <f-args>)
-- "
-- " " Add `:OR` command for organize imports of the current
-- " buffer.
--  command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
-- "
-- "
