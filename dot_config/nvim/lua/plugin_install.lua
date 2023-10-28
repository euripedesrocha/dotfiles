local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { "folke/neodev.nvim", opts = {} },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  },
  { "akinsho/toggleterm.nvim"},
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
  },
  { 'romgrk/barbar.nvim', dependencies = 'nvim-web-devicons' },
  {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
  { -- Additional text objects via treesitter
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/nvim-treesitter-context',
   },
   {
     'andymass/vim-matchup',
     config = function()
       vim.g.matchup_matchparen_offscreen = { method = "popup" }
     end
   },
   {
     'nvim-telescope/telescope.nvim', tag = '0.1.4',
     dependencies = { 'nvim-lua/plenary.nvim' }
   },
   {
     "FeiyouG/commander.nvim",
     dependencies = { "nvim-telescope/telescope.nvim" }
   },
   {
     "renerocksai/telekasten.nvim",
     dependencies = { "nvim-telescope/telescope.nvim", "renerocksai/calendar-vim" }
   },
   { -- LSP Configuration & Plugins
     'neovim/nvim-lspconfig',
     dependencies = {
       -- Automatically install LSPs to stdpath for neovim
       'williamboman/mason.nvim',
       'williamboman/mason-lspconfig.nvim',
       -- Additional lua configuration, makes nvim stuff amazing
       'folke/neodev.nvim',
     }
     },
     'p00f/clangd_extensions.nvim',
     { -- Autocompletion
     'hrsh7th/nvim-cmp',
     dependencies = { 'hrsh7th/cmp-nvim-lsp',
     'hrsh7th/cmp-buffer',
     'hrsh7th/cmp-path',
     'hrsh7th/cmp-cmdline',
     "paopaol/cmp-doxygen",
     'L3MON4D3/LuaSnip',
     'saadparwaiz1/cmp_luasnip' },
   },
   -- Git related plugins
   'tpope/vim-fugitive',
   {
     'lewis6991/gitsigns.nvim',
     dependencies = {
       'nvim-lua/plenary.nvim'
     }
   },
   'glepnir/lspsaga.nvim',
   { 'jose-elias-alvarez/null-ls.nvim',
   dependencies = { 'nvim-lua/plenary.nvim' }
    },
    'numToStr/Comment.nvim'
  })

-- use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines

-- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }


--	-- surround vim
--	use 'tpope/vim-surround'
--
--	-- better hotfix window (for showing and searching through results in telescope's find usages)
--	-- TODO: learn how to use?
--	use {"kevinhwang91/nvim-bqf"}
--
--	-- prettier tabs
--	use 'romgrk/barbar.nvim'
--
--
--	-- support the missing lsp diagnostic colors
--	use 'folke/lsp-colors.nvim'
--
--
--	-- highlight variables under cursor
--	use 'RRethy/vim-illuminate'
--

-- "Plugin 'octol/vim-cpp-enhanced-highlight'
-- Plugin 'jackguo380/vim-lsp-cxx-highlight'
-- Plugin 'rhysd/vim-clang-format'
-- Plugin 'vim-voom/VOoM'
-- Plugin 'wakatime/vim-wakatime'
