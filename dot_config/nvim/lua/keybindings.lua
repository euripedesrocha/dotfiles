local commander = require("commander")
local noremap = { noremap = true }
commander.add({
  {
    desc = "Save",
    cmd = '<CMD>w<CR>',
    keys = { { "n", "i" }, "<F2>", noremap },
  }, {
    desc = "Toggle Numbers",
    cmd = '<CMD>set invnumber<CR>',
    keys = { { "n", "i" }, "<F3>", noremap },
  }, {
    desc = "Clear Highlighting",
    cmd = '<CMD>noh<CR>',
    keys = { { "n" }, "<leader><leader>", noremap },
  }, {
    desc = "Set spell English",
    cmd = '<CMD>setlocal spell! spelllang=en_us<CR>',
    keys = { { "n"}, "<leader>sse", noremap },
  },
})
---- Keymaps for better default experience
---- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
--
---- Remap for dealing with word wrap
--vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
--vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
---- Diagnostic keymaps
--vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
--vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
--vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
--
-- nmap <leader>s :setlocal spell! spelllang=pt<cr>
-- "Voom
-- nnoremap <leader>el :Voom latex<CR>
-- nnoremap <leader>ec :VoomToggle<CR>
--
-- nnoremap <leader>n :cn<CR>
-- nnoremap <leader>p :cp<CR>
-- nnoremap <leader>g :Git<CR>
-- nnoremap <leader>gp :Git push<cR>
-- nnoremap <leader><leader> :noh<cR>
--
--
-- let g:clang_format#style = "llvm"
--
-- "
-- let g:termdebug_wide=1
-- "au User TermdebugStartPre  echomsg 'debugging starting'
-- "au User TermdebugStartPost echomsg 'debugging started'
-- "au User TermdebugStopPre   echomsg 'debugging stopping'
-- "au User TermdebugStopPost  echomsg 'debugging stopped'
-- "let g:termdebugger = ['rr', 'replay', '--'] // for custom gdb
--
