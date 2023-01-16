vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.hlsearch = true
vim.o.breakindent = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.updatetime = 300
vim.wo.signcolumn = 'auto:2'
vim.o.completeopt = 'menuone,noselect'

vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.softtabstop = 2
vim.o.shiftwidth = 0 -- use tabstop value

vim.o.undofile = true

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
 callback = function()
   vim.highlight.on_yank()
 end,
 group = highlight_group,
 pattern = '*',
})

-- vim.g.python3_host_prog
--
-- set exrc
-- set secure
-- vim.o.colorcolumn=120
